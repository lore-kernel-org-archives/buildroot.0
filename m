From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:15:38 +0200
Subject: [Buildroot] [git commit] package/freeswitch: Use mod_g729 only when
	freeswitch-mod-bcg729 is disabled
Message-ID: <20171008210817.CB4B081127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f46658d0457fd6e0b1dd7cebd82ccba57c05862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mod_g729 contained in freeswitch source provides pass-through:
https://freeswitch.org/confluence/display/FREESWITCH/mod_g729

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index ce22ffc..defa00f 100644
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
@@ -175,6 +174,12 @@ FREESWITCH_DEPENDENCIES += alsa-lib
 FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
 endif
 
+# Use the pass-through g729 module provided by freeswitch instead of
+# the external mod_bcg729 provided by freeswitch-mod-bcg729.
+ifeq ($(BR2_PACKAGE_FREESWITCH_MOD_BCG729),)
+FREESWITCH_ENABLED_MODULES += codecs/mod_g729
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
