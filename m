From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:55:10 +0200
Subject: [Buildroot] [PATCH v14 19/27] package/freeswitch: enable mod_alsa
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 80a6d0b..a012886 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -166,6 +166,11 @@ FREESWITCH_LICENSE_FILES += src/mod/codecs/mod_isac/LICENSE
 FREESWITCH_ENABLED_MODULES += codecs/mod_isac
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FREESWITCH_DEPENDENCIES += alsa-lib
+FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
-- 
2.8.0.rc3
