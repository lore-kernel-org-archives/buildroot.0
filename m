From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:14:04 +0200
Subject: [Buildroot] [git commit] package/libbluray: bump version
Message-ID: <20150928201423.2FAB58077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bed212e46b4638ef54eb5d26fcce4c0ac0278ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi 16.x-Jarvis depends on libbluray > 0.7.0
https://github.com/xbmc/xbmc/commit/329190a0323e332dd9fa9ad14fcbf3b2d92afe77

Also enable UDF support like in OpenElec:
https://github.com/OpenELEC/OpenELEC.tv/commit/50d086b1b21645b0baec881a72fc3c4476f7ade5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.hash |    4 ++--
 package/libbluray/libbluray.mk   |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index b7bc201..5bb41a1 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://get.videolan.org/libbluray/0.6.2/libbluray-0.6.2.tar.bz2.sha512
-sha512 20fbc5f34d7d025efaac1b6398c18b94b603a52bfb6dd0f021059d3bd4c3cf785e715698cd09e5d1c97a7ed11bbd146b29aa363650620eef1efca08053fc033a  libbluray-0.6.2.tar.bz2
+# From http://get.videolan.org/libbluray/0.8.1/libbluray-0.8.1.tar.bz2.sha512
+sha512	6618e01a567f0dc5d21302fc771d4155589c81703028b76f6090a2d12ef1c7e9d08d9c79312a7c8b2ca0d6c63ce980195f0866509a4f8f05f64ed6650c7f78dc	libbluray-0.8.1.tar.bz2
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index be95b85..e10f7db 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 0.6.2
+LIBBLURAY_VERSION = 0.8.1
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
@@ -12,6 +12,8 @@ LIBBLURAY_LICENSE = LGPLv2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
+LIBBLURAY_CONF_OPTS = --enable-udf
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
