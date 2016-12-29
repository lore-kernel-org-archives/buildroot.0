From: Yu-Ting, Kao <jackzzjack@gmail.com>
Date: Thu, 29 Dec 2016 13:20:38 +0800
Subject: [Buildroot] [PATCH 1/1] Fix gcrypt library linker option on
	collectd.
Message-ID: <1482988838-6777-1-git-send-email-jackzzjack@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 28c1b31..c2d6f37 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -177,6 +177,7 @@ ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 COLLECTD_DEPENDENCIES += libgcrypt
 COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
 COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+COLLECTD_CONF_ENV += LIBS="-lgcrypt"
 else
 COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
-- 
2.4.8
