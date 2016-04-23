From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Apr 2016 22:59:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/freeswitch: disable ClueCon
	invitation messages
Message-ID: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index f25b9fa..ec52172 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -153,6 +153,8 @@ define FREESWITCH_ENABLE_MODULES
 	$(Q)echo $(FREESWITCH_ENABLED_MODULES) \
 		| tr ' ' '\n' \
 		> $(@D)/modules.conf
+	> $(@D)/noreg
+	> $(@D)/cluecon2.tmpl
 endef
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
-- 
2.8.0.rc3
