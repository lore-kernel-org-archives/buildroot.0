From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Apr 2016 21:31:51 +0200
Subject: [Buildroot] [PATCH v13 17/26] package/freeswitch: enable mod_silk
In-Reply-To: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460662320-1437-18-git-send-email-bernd.kuhls@t-online.de>
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
index 7043e1b..f81a941 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -216,6 +216,11 @@ FREESWITCH_DEPENDENCIES += portaudio
 FREESWITCH_ENABLED_MODULES += endpoints/mod_portaudio
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSILK),y)
+FREESWITCH_DEPENDENCIES += libsilk
+FREESWITCH_ENABLED_MODULES += codecs/mod_silk
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.8.0.rc3
