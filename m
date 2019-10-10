From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Oct 2019 21:25:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: needs host-flex
Message-ID: <20191010192501.21183-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/cd5deacbe6f4f97aa0bbc8040ac9aa7860ceaa6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 2f60b4561e..7915e7f434 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -144,9 +144,10 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)
 
 # since 5.9.1 the file src/liboconfig/parser.c is missing from the tar
-# download file, triggering the need for host-bison
+# download file, triggering the need for host-{bison,flex}
 COLLECTD_DEPENDENCIES = \
 	host-bison \
+	host-flex \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_AMQP),rabbitmq-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
-- 
2.23.0
