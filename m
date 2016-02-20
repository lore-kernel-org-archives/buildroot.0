From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:23:27 +0100
Subject: [Buildroot] [PATCH v8 27/28] package/freeswitch: enable
	mod_memcache, add optional dependency to libmemcached
In-Reply-To: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456007008-5200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456007008-5200-28-git-send-email-bernd.kuhls@t-online.de>
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
index 3404fb2..7178590 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -220,6 +220,11 @@ FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
+FREESWITCH_DEPENDENCIES += libmemcached
+FREESWITCH_ENABLED_MODULES += applications/mod_memcache
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
-- 
2.7.0
