From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:40:01 +0100
Subject: [Buildroot] [PATCH v6 20/29] package/freeswitch: enable mod_opus,
	add optional dependency to opus
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-21-git-send-email-bernd.kuhls@t-online.de>
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
index af3db24..79a85cf 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -207,6 +207,11 @@ FREESWITCH_DEPENDENCIES += lua
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
2.6.4
