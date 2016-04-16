From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:55:04 +0200
Subject: [Buildroot] [PATCH v14 13/27] package/freeswitch: enable mod_ilbc
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-14-git-send-email-bernd.kuhls@t-online.de>
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
index dfc994a..0ccbe2a 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -183,6 +183,11 @@ ifeq ($(BR2_PACKAGE_LIBG7221),y)
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
2.8.0.rc3
