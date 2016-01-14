From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:39:46 +0100
Subject: [Buildroot] [PATCH v6 05/29] package/freeswitch: enable mod_enum,
	add optional dependency to libldns
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-6-git-send-email-bernd.kuhls@t-online.de>
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
index b698d88..33735dd 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -141,6 +141,11 @@ else
 FREESWITCH_CONF_OPTS += --disable-core-libedit-support
 endif
 
+ifeq ($(BR2_PACKAGE_LIBLDNS),y)
+FREESWITCH_DEPENDENCIES += libldns
+FREESWITCH_ENABLED_MODULES += applications/mod_enum
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 FREESWITCH_DEPENDENCIES += util-linux
 endif
-- 
2.6.4
