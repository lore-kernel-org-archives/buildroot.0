From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Apr 2016 16:18:22 +0200
Subject: [Buildroot] [PATCH v11 10/26] package/freeswitch: enable mod_lua
In-Reply-To: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459693118-19072-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459693118-19072-11-git-send-email-bernd.kuhls@t-online.de>
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
index 17d8490..74ec7ea 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -178,6 +178,11 @@ FREESWITCH_DEPENDENCIES += libyaml
 FREESWITCH_ENABLED_MODULES += languages/mod_yaml
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+FREESWITCH_DEPENDENCIES += lua
+FREESWITCH_ENABLED_MODULES += languages/mod_lua
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.8.0.rc3
