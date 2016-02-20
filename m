From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:17 +0100
Subject: [Buildroot] [PATCH v8 17/28] package/freeswitch: enable mod_ilbc,
	add optional dependency to libilbc
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-18-git-send-email-bernd.kuhls@t-online.de>
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
index 7505136..0b88bed 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -190,6 +190,11 @@ ifeq ($(BR2_PACKAGE_LIBG7221),y)
 FREESWITCH_DEPENDENCIES += libg7221
 endif
 
+ifeq ($(BR2_PACKAGE_LIBILBC),y)
+FREESWITCH_DEPENDENCIES += libilbc
+FREESWITCH_ENABLED_MODULES += codecs/mod_ilbc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBLDNS),y)
 FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum
-- 
2.7.0
