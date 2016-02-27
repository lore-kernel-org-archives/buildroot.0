From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:27:12 +0100
Subject: [Buildroot] [PATCH/next v9 22/28] package/freeswitch: enable
	mod_sndfile, add optional dependency to libsndfile
In-Reply-To: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456586838-21197-23-git-send-email-bernd.kuhls@t-online.de>
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
index a345950..66e8e0d 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -242,6 +242,11 @@ FREESWITCH_DEPENDENCIES += libsilk
 FREESWITCH_ENABLED_MODULES += codecs/mod_silk
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+FREESWITCH_DEPENDENCIES += libsndfile
+FREESWITCH_ENABLED_MODULES += formats/mod_sndfile
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.7.0
