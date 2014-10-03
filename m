From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Oct 2014 12:06:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xbmc: add option to enable alsa
Message-ID: <1412330791-7545-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Fix typo

 package/xbmc/Config.in |    6 ++++++
 package/xbmc/xbmc.mk   |    2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 54f8855..a7337d5 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -103,6 +103,12 @@ menuconfig BR2_PACKAGE_XBMC
 
 if BR2_PACKAGE_XBMC
 
+config BR2_PACKAGE_XBMC_ALSA_LIB
+	bool "alsa"
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Enable alsa support.
+
 config BR2_PACKAGE_XBMC_AVAHI
 	bool "avahi"
 	depends on !BR2_PREFER_STATIC_LIB # avahi
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 75fc63b..5d8199c 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -71,7 +71,7 @@ else
 XBMC_CONF_OPT += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ifeq ($(BR2_PACKAGE_XBMC_ALSA_LIB),y)
 XBMC_DEPENDENCIES += alsa-lib
 XBMC_CONF_OPT += --enable-alsa
 else
-- 
1.7.10.4
