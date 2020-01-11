From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 09:32:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix bluez5_utils
 dependency
Message-ID: <20200111083250.221622-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ab390616eb74fcb982c886408b53489dc42179bb wrongly added a
bluez_utils5 dependency instead of bluez5_utils

Fixes:
 - http://autobuild.buildroot.org/results/942aa07547068c9b47ce50c6dc016ee633e1a1c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 2adc78a5b5..3495878db0 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -21,7 +21,7 @@ LIBSIGROK_CONF_OPTS += --with-libbluez
 LIBSIGROK_DEPENDENCIES += bluez_utils
 else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 LIBSIGROK_CONF_OPTS += --with-libbluez
-LIBSIGROK_DEPENDENCIES += bluez_utils5
+LIBSIGROK_DEPENDENCIES += bluez5_utils
 else
 LIBSIGROK_CONF_OPTS += --without-libbluez
 endif
-- 
2.24.1
