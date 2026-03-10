{pkgs}: {
  channel = "stable-24.11";
  packages = [
    pkgs.gh
    pkgs.nodejs_22
    pkgs.corepack_latest
  ];
  env = {
    COREPACK_ENABLE_STRICT = "0";
  };
  idx = {
    extensions = [
      "astro-build.astro-vscode"
      "sdras.night-owl"
    ];
    workspace = {
      onCreate = {
        install-pnpm = "corepack enable && corepack prepare pnpm@latest --activate";
      };
      onStart = {
        install-pnpm = "corepack enable && corepack prepare pnpm@latest --activate";
      };
    };
    previews = {
      previews = {
        web = {
          command = [
            "pnpm"
            "run"
            "dev"
            "--host"
            "0.0.0.0"
            "--port"
            "$PORT"
          ];
          manager = "web";
        };
      };
    };
  };
}