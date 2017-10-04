From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Oct 2017 23:02:24 +0200
Subject: [Buildroot] [PATCH v3 4/4] package/freeswitch: Use mod_g729 only
	when freeswitch-mod-bcg729 is disabled
In-Reply-To: <20171004210224.12763-1-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
Message-ID: <20171004210224.12763-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mod_g729 contained in freeswitch source provides pass-through:
https://freeswitch.org/confluence/display/FREESWITCH/mod_g729

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: no changes
v2: no changes

 package/freeswitch/freeswitch.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 0adb35d751..6c1dc7c012 100644
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
