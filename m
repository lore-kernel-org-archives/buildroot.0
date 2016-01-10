From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:41 +0100
Subject: [Buildroot] [PATCH v5 25/29] package/freeswitch: enable
	mod_soundtouch, add optional dependency to libsoundtouch
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-26-git-send-email-bernd.kuhls@t-online.de>
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
index e320916..f5c81c5 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -218,6 +218,11 @@ FREESWITCH_DEPENDENCIES += libsndfile
 FREESWITCH_ENABLED_MODULES += formats/mod_sndfile
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOUNDTOUCH),y)
+FREESWITCH_DEPENDENCIES += libsoundtouch
+FREESWITCH_ENABLED_MODULES += applications/mod_soundtouch
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.6.4
