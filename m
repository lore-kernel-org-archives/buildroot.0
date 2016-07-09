From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  9 Jul 2016 15:49:05 +0200
Subject: [Buildroot] [PATCH 0/2] Meson: new build system
Message-ID: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series provides a new build system: Meson.

It is a rework of the package formerly known as "python-meson", with the
following changes:

 - removed comments about file being generated in cross-compilation
   configuration file.
 - removed reference to "exe_wrapper" in cross-compilation configuration file.
 - removed installation of exe_wrapper.
 - removed dependency on host-qemu.

Eric Le Bihan (2):
  meson: new package
  docs/manual: document meson-based packages

 docs/manual/adding-packages-meson.txt   | 84 +++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |  2 +
 package/meson/cross-compilation.conf.in | 17 +++++++
 package/meson/meson.hash                |  2 +
 package/meson/meson.mk                  | 31 ++++++++++++
 5 files changed, 136 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt
 create mode 100644 package/meson/cross-compilation.conf.in
 create mode 100644 package/meson/meson.hash
 create mode 100644 package/meson/meson.mk

--
2.4.11
