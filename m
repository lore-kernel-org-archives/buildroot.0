From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Apr 2020 19:12:43 +0200
Subject: [Buildroot] [PATCH v2,4/6] package/collectd: add InfluxDB support
In-Reply-To: <20200414171245.2235154-1-fontaine.fabrice@gmail.com>
References: <20200414171245.2235154-1-fontaine.fabrice@gmail.com>
Message-ID: <20200414171245.2235154-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

InfluxDB support is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/605fcdcddeefb23b945203079e5c87625ce0e336

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index f1f3c2ed9f..7186d67c36 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -638,6 +638,12 @@ config BR2_PACKAGE_COLLECTD_WRITEHTTP
 	  Sends values collected to a web-server using HTTP POST and
 	  PUTVAL.
 
+config BR2_PACKAGE_COLLECTD_WRITEINFLUXDBUDP
+	bool "write_influxdb_udp"
+	help
+	  Sends data to an instance of InfluxDB using the "Line
+	  Protocol".
+
 config BR2_PACKAGE_COLLECTD_WRITELOG
 	bool "write_log"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 52b218e139..964f4dc694 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -140,6 +140,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_VMEM),--enable-vmem,--disable-vmem) \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEINFLUXDBUDP),--enable-write_influxdb_udp,--disable-write_influxdb_udp) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITELOG),--enable-write_log,--disable-write_log) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),--enable-write_prometheus,--disable-write_prometheus) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),--enable-write_redis,--disable-write_redis) \
-- 
2.25.1
