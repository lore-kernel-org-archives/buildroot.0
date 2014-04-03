From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:28 +0200
Subject: [Buildroot] [PATCH v4 33/37] WIP: xbmc: Add VA-API support
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-34-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 691cad6..6c79c4c 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -39,7 +39,6 @@ XBMC_CONF_OPT +=  \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-ssh \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-vtbdecoder \
 	--enable-optimizations
@@ -55,6 +54,13 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+XBMC_DEPENDENCIES += libva
+XBMC_CONF_OPT += --enable-vaapi
+else
+XBMC_CONF_OPT += --disable-vaapi
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
 XBMC_DEPENDENCIES += \
 	libglew \
-- 
1.7.10.4
