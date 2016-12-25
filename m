From: jackzzjack <jackzzjack@gmail.com>
Date: Sun, 25 Dec 2016 21:54:34 +0800
Subject: [Buildroot] [PATCH 1/1] Fix collectd cannot configure with
	dependence error.
Message-ID: <20161225135434.124035-1-jackzzjack@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix http://autobuild.buildroot.org/results/358/358e2f02f42e08fe362ecd46e636c0048e77c21f/

Signed-off-by: jackzzjack <jackzzjack@gmail.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 50a2e53..15f6765 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -162,7 +162,7 @@ ifeq ($(BR2_PACKAGE_MYSQL),y)
 COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
-COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/include
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
-- 
2.7.4
