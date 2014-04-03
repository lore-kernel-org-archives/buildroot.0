From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:32 +0200
Subject: [Buildroot] [PATCH v4 37/37] WIP: xbmc: Add option for Goom
	screensaver
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-38-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    5 +++++
 package/xbmc/xbmc.mk   |    6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 765f325..7bb6386 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -116,6 +116,11 @@ config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	help
 	  Enable webserver feature
 
+config BR2_PACKAGE_XBMC_GOOM
+	bool "goom screensaver"
+	help
+	  Enable goom screensaver
+
 config BR2_PACKAGE_XBMC_LIBNFS
 	bool "nfs"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 8d8dfbe..b4e0fb0 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -110,6 +110,12 @@ else
 XBMC_CONF_OPT += --disable-libmp3lame
 endif
 
+ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
+XBMC_CONF_OPT += --enable-goom
+else
+XBMC_CONF_OPT += --disable-goom
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
