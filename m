From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 13:27:53 +0000
Subject: [Buildroot] [PATCH] systemd: bump version to 233
Message-ID: <20170313132753.7178-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-kdbus no longer exists, so remove everything related to it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/systemd/Config.in    | 5 -----
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 8 +-------
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aaed7dc..0f54686 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -155,11 +155,6 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
-config BR2_PACKAGE_SYSTEMD_KDBUS
-	bool "enable kdbus support"
-	help
-	  Enable kdbus support for Systemd.
-
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 0acaa3c..17f4c0f 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 1172c7c7d5d72fbded53186e7599d5272231f04cc8b72f9a0fb2c5c20dfc4880  systemd-232.tar.gz
+sha256 8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083  systemd-233.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0d2f416..cfd885d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 232
+SYSTEMD_VERSION = 233
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
@@ -87,12 +87,6 @@ else
 SYSTEMD_CONF_OPTS += --disable-xkbcommon
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
-SYSTEMD_CONF_OPTS += --enable-kdbus
-else
-SYSTEMD_CONF_OPTS += --disable-kdbus
-endif
-
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 SYSTEMD_DEPENDENCIES += bzip2
 SYSTEMD_CONF_OPTS += --enable-bzip2
-- 
2.10.2
