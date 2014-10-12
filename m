From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Oct 2014 09:50:06 +0200
Subject: [Buildroot] Mono: new package
Message-ID: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


[Thomas:

  - Merge mono-managed and mono-native as a single package. The
    mono-managed stuff is done by the host variant of the mono
    package, while the mono-native stuff is done as the target variant
    of the mono package.

  - Introduce a BR2_PACKAGE_MONO_ARCH_SUPPORTS blind Config.in option
    to make sure the IPv6 related comment is not displayed when the
    architecture being used anyway doesn't support Mono.

  - Add a patch to Mono to fix the C library path when uClibc and Musl
    is used. This is a better approach than the
    POST_INSTALL_TARGET_HOOKS because this approach can potentially be
    submitted upstreamed, which ultimately allows to simplify the
    Buildroot package.

  - Depend on a 'monolite' package, and use it instead of letting Mono
    download Monolite by itself, which circumvents Buildroot's
    download infrastructure.
    mono-managed stuff is done by the host variant of the mono
    package, while the mono-native stuff is done as the target variant
    of the mono package.

  - Introduce a BR2_PACKAGE_MONO_ARCH_SUPPORTS blind Config.in option
    to make sure the IPv6 related comment is not displayed when the
    architecture being used anyway doesn't support Mono.

  - Add a patch to Mono to fix the C library path when uClibc and Musl
    is used. This is a better approach than the
    POST_INSTALL_TARGET_HOOKS because this approach can potentially be
    submitted upstreamed, which ultimately allows to simplify the
    Buildroot package.

  - Depend on a 'monolite' package, and use it instead of letting Mono
    download Monolite by itself, which circumvents Buildroot's
    download infrastructure.

  - Move the installation of Mono libraries to the target Mono
    package, as a POST_INSTALL_TARGET_HOOKS.]

[Angelo:

  - Bump to the latest Mono version 3.10.0

  - Add selection for .Net runtime compilation and installation in
    target. If nothing is selected, only a minimal mono is built ]
