From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 18:21:00 +0100
Subject: [Buildroot] [git commit] package/libgpiod: bump to version 1.6.2
Message-ID: <20210201170854.1A1ED864F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ac09f01f367780518df7c430ab89fbe112c1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.6.2 now builds against headers >= 4.8.x. (Previously 5.5 was
required). Functionality might still be limited depending on the kernel version.

* altered note on updating
* disable building of tests

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 0ea15869b0..7b691aaf5e 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  a041b06907c956dd1c77836cccf4d392af29b9fe09c8ad18449a6da707b5ba2d  libgpiod-1.4.5.tar.xz
+sha256  c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9  libgpiod-1.6.2.tar.xz
 # Hash for license file
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 83d5abb002..72f8ae772c 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-# be careful when bumping versions, newer branches (e.g. >= 1.6)
-# depend on pretty recent kernel headers
-LIBGPIOD_VERSION = 1.4.5
+# Be careful when bumping versions.
+# Dependency on kernel header versions may change.
+LIBGPIOD_VERSION = 1.6.2
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
 LIBGPIOD_INSTALL_STAGING = YES
 LIBGPIOD_DEPENDENCIES = host-pkgconf
+LIBGPIOD_CONF_OPTS = --disable-tests
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
 LIBGPIOD_CONF_OPTS += --enable-tools
