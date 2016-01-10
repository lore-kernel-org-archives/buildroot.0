From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:44 +0100
Subject: [Buildroot] [PATCH v5 28/29] package/freeswitch: enable
	mod_memcache, add optional dependency to libmemcached
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-29-git-send-email-bernd.kuhls@t-online.de>
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
index 71b5ad6..05d79c1 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -182,6 +182,11 @@ FREESWITCH_DEPENDENCIES += libldns
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
2.6.4
