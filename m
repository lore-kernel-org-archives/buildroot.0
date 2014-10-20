From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 20 Oct 2014 16:15:26 +0200
Subject: [Buildroot] [PATCH 0/2 v5] Mono new package
Message-ID: <1413814528-26904-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds mono and monolite packages.

Chengelog:

* Defaulting BR2_PACKAGE_MONO_45 now depends on select
* Minor formatting issues

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
    target.]

Angelo Compagnucci (2):
  package/monolite: new package
  package/mono: new package

 package/Config.in                               |  1 +
 package/mono/Config.in                          | 40 ++++++++++++++++
 package/mono/mono-001-gc-fix-uclibc.patch       | 16 +++++++
 package/mono/mono-002-support-uclibc-musl.patch | 25 ++++++++++
 package/mono/mono.mk                            | 64 +++++++++++++++++++++++++
 package/monolite/monolite.mk                    | 17 +++++++
 6 files changed, 163 insertions(+)
 create mode 100644 package/mono/Config.in
 create mode 100644 package/mono/mono-001-gc-fix-uclibc.patch
 create mode 100644 package/mono/mono-002-support-uclibc-musl.patch
 create mode 100644 package/mono/mono.mk
 create mode 100644 package/monolite/monolite.mk

-- 
2.1.1
