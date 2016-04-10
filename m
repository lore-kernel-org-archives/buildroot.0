From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:23 +0200
Subject: [Buildroot] [PATCH v12 15/31] package/freeswitch: enable mod_isac
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 95db94e..189bee7 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -145,6 +145,12 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+# mod_isac supports a limited set of archs
+# src/mod/codecs/mod_isac/typedefs.h
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
+FREESWITCH_ENABLED_MODULES += codecs/mod_isac
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
-- 
2.8.0.rc3
