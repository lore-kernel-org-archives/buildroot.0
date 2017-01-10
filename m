From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Jan 2017 10:06:46 -0300
Subject: [Buildroot] [PATCH] collectd: fix libgcrypt support
Message-ID: <20170110130646.16400-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the newer versions the collectd configure script expects
libgcrypt-config as parameter rather than the location for the
libgcrypt-config script. Adjust the package to account for this.
Fixes:
http://autobuild.buildroot.net/results/a49/a494bc905e4509528c4932f76a094b9ea8e70bd3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 7ab7dd4..fa6ebae 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -175,8 +175,7 @@ endif
 # network can use libgcrypt
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 COLLECTD_DEPENDENCIES += libgcrypt
-COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
-COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
 COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
-- 
2.10.2
