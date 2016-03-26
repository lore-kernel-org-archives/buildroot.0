From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:17:34 -0300
Subject: [Buildroot] [PATCH] libgtk2: point to the proper cups-config
Message-ID: <1459019854-13008-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it can pick up the distro cups-config if it's present, leading
to improper library usage/linkage. Fixes:
http://autobuild.buildroot.net/results/bf4/bf493977817a750427aae82e71a5257187bd7344/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 971e33c..94fa97f 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -85,6 +85,7 @@ LIBGTK2_CONF_OPTS += --without-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK2_CONF_OPTS += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
 LIBGTK2_DEPENDENCIES += cups
 else
 LIBGTK2_CONF_OPTS += --disable-cups
-- 
2.7.3
