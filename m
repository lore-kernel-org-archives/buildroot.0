From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:07:32 +0200
Subject: [Buildroot] [git commit] libgpiod: bump version to v0.3
Message-ID: <20170624100647.59E567FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=138996c2517e5c1319425cc0d1e0a67cb0005be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-pkgconf to dependencies as we now use PKG_CHECK_MODULES in
configure.ac.

Changelog for v0.3:

New features:
- gpiomon can now watch multiple lines at the same time and supports custom
  output formats which can be specified using the --format argument
- testing framework can now test external programs: test cases for gpio-tools
  have been added

Improvements:
- improve error messages
- improve README examples
- configure script improvements

Bug fixes:
- use correct UAPI flags when requesting line events

Also includes bug fixes from v0.2.1:

Bug fixes:
- capitalize 'GPIO' in error messages in gpioset, gpioget & gpiomon
- tweak the error message on invalid arguments in gpiofind
- don't ignore superfluous arguments and fix the displayed name for falling
  edge events in gpiomon

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index fcf212e..aeeabf6 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92 libgpiod-v0.2.tar.gz
+sha256 24794006c14194e269b944f2cca0e85e481f1538be3c143479c4c6691bf25add libgpiod-v0.3.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index c95ea44..76648bd 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = v0.2
+LIBGPIOD_VERSION = v0.3
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
 
+LIBGPIOD_DEPENDENCIES = host-pkgconf
+
 # Needed for autoreconf to work properly
 define LIBGPIOD_FIXUP_M4_DIR
         mkdir $(@D)/m4
