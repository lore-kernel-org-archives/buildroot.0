From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Mar 2016 22:58:37 +0100
Subject: [Buildroot] [PATCH/next v10 09/28] package/freeswitch: enable
	mod_yaml
In-Reply-To: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456869536-18324-10-git-send-email-bernd.kuhls@t-online.de>
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
index 4e82128..2244434 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -171,6 +171,11 @@ FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYAML),y)
+FREESWITCH_DEPENDENCIES += libyaml
+FREESWITCH_ENABLED_MODULES += languages/mod_yaml
+endif
+
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
 FREESWITCH_DEPENDENCIES += unixodbc
 FREESWITCH_CONF_OPTS += \
-- 
2.7.0
