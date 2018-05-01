From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:48:24 +0200
Subject: [Buildroot] [git commit] libgudev: bump to version 232
Message-ID: <20180501095048.7667983471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cfa33d5ad7694ccc7329f0fd2c5f6d50ee00a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add --disable-umockdev (enabled by default)
Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgudev/libgudev.hash | 7 +++++--
 package/libgudev/libgudev.mk   | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index a6c1d6b535..138ae93d71 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,2 +1,5 @@
-# From: http://ftp.gnome.org/pub/GNOME/sources/libgudev/230/libgudev-230.sha256sum
-sha256 a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18  libgudev-230.tar.xz
+# From: http://ftp.gnome.org/pub/GNOME/sources/libgudev/232/libgudev-232.sha256sum
+sha256 ee4cb2b9c573cdf354f6ed744f01b111d4b5bed3503ffa956cefff50489c7860  libgudev-232.tar.xz
+
+# Hash for license file:
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index fce710a1c2..50432c461e 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 230
+LIBGUDEV_VERSION = 232
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
 LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
 LIBGUDEV_LICENSE = LGPL-2.1+
 LIBGUDEV_LICENSE_FILES = COPYING
+LIBGUDEV_CONF_OPTS = --disable-umockdev
 
 $(eval $(autotools-package))
