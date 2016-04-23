From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Apr 2016 22:59:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/freeswitch: Fix added license
In-Reply-To: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461445189-31992-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noted by Thomas:
http://lists.busybox.net/pipermail/buildroot/2016-April/158864.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index ec52172..f76ad24 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -161,7 +161,7 @@ FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 # mod_isac supports a limited set of archs
 # src/mod/codecs/mod_isac/typedefs.h
 ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_x86_64),y)
-FREESWITCH_LICENSE += BSD-3c (mod_isac)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE) BSD-3c (mod_isac)
 FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
-- 
2.8.0.rc3
