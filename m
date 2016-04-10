From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:24 +0200
Subject: [Buildroot] [PATCH v12 16/31] package/freeswitch: enable mod_opus
In-Reply-To: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460281299-2385-17-git-send-email-bernd.kuhls@t-online.de>
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
index 189bee7..cf12b75 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -201,6 +201,11 @@ FREESWITCH_DEPENDENCIES += lua
 FREESWITCH_ENABLED_MODULES += languages/mod_lua
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+FREESWITCH_DEPENDENCIES += opus
+FREESWITCH_ENABLED_MODULES += codecs/mod_opus
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.8.0.rc3
