From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Apr 2016 21:31:43 +0200
Subject: [Buildroot] [PATCH v13 09/26] package/freeswitch: enable mod_lua
In-Reply-To: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460662320-1437-10-git-send-email-bernd.kuhls@t-online.de>
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
index 827ae26..942c478 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -176,6 +176,11 @@ FREESWITCH_DEPENDENCIES += libyaml
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
