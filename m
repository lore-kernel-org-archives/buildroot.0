From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:20:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/asterisk: add bluez5_utils optional
 dependency
Message-ID: <20200111092016.419075-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asterisk/asterisk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 00070aadba..bfdcb49e8f 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -139,6 +139,9 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 ASTERISK_DEPENDENCIES += bluez_utils
 ASTERISK_CONF_OPTS += --with-bluetooth
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+ASTERISK_DEPENDENCIES += bluez5_utils
+ASTERISK_CONF_OPTS += --with-bluetooth
 else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
-- 
2.24.1
