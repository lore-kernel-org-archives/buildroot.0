From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:35 +0200
Subject: [Buildroot] [PATCH v12 27/31] package/freeswitch: enable mod_shout
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-28-git-send-email-bernd.kuhls@t-online.de>
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
index 4b73f74..b80c49d 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -230,6 +230,11 @@ FREESWITCH_DEPENDENCIES += portaudio
 FREESWITCH_ENABLED_MODULES += endpoints/mod_portaudio
 endif
 
+ifeq ($(BR2_PACKAGE_LAME)$(BR2_PACKAGE_LIBSHOUT)$(BR2_PACKAGE_MPG123),yyy)
+FREESWITCH_DEPENDENCIES += lame libshout mpg123
+FREESWITCH_ENABLED_MODULES += formats/mod_shout
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSILK),y)
 FREESWITCH_DEPENDENCIES += libsilk
 FREESWITCH_ENABLED_MODULES += codecs/mod_silk
-- 
2.8.0.rc3
