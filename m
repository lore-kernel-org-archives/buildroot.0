From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 09:38:42 +0100
Subject: [Buildroot] [git commit] collectd: fix option passed to the snmp
	dependency
Message-ID: <20161226084055.3E5687FE47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1914921ebc3c5d5720d7249e3dc2e5d030471f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-libnetsnmp doesn't take a path to the netsnmp config script,
but to the sysroot where netsnmp can be found.

Fixes:

  http://autobuild.buildroot.org/results/358e2f02f42e08fe362ecd46e636c0048e77c21f/

Signed-off-by: Jack Kao <jackzzjack@gmail.com>
[Thomas: path is $(STAGING_DIR)/usr, not $(STAGING_DIR)/usr/include.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 50a2e53..28c1b31 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -162,7 +162,7 @@ ifeq ($(BR2_PACKAGE_MYSQL),y)
 COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
-COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
