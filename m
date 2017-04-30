From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Apr 2017 22:17:37 +0200
Subject: [Buildroot] [PATCH 4/4] package/freeswitch: Use mod_g729 only when
	freeswitch_mod_bcg729 is disabled
In-Reply-To: <20170430201737.12821-1-bernd.kuhls@t-online.de>
References: <20170430201737.12821-1-bernd.kuhls@t-online.de>
Message-ID: <20170430201737.12821-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mod_g729 contained in freeswitch source provides pass-through:
https://freeswitch.org/confluence/display/FREESWITCH/mod_g729

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 215d0b974..3465b19be 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -116,7 +116,6 @@ FREESWITCH_ENABLED_MODULES += \
 	applications/mod_valet_parking \
 	applications/mod_voicemail \
 	codecs/mod_g723_1 \
-	codecs/mod_g729 \
 	dialplans/mod_dialplan_asterisk \
 	dialplans/mod_dialplan_xml \
 	endpoints/mod_loopback \
@@ -175,6 +174,10 @@ FREESWITCH_DEPENDENCIES += alsa-lib
 FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
 endif
 
+ifeq ($(BR2_PACKAGE_FREESWITCH_MOD_BCG729),)
+FREESWITCH_ENABLED_MODULES += codecs/mod_g729
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
-- 
2.11.0
