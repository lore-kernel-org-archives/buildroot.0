From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:15:57 +0200
Subject: [Buildroot] [git commit] package/collectd: add InfluxDB support
Message-ID: <20200817100942.718EB82775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19e08a5ace06ba071783b2574fc4c6625cca65bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

InfluxDB support is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/605fcdcddeefb23b945203079e5c87625ce0e336

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a467a8a4ca..e3e3c5401f 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -644,6 +644,12 @@ config BR2_PACKAGE_COLLECTD_WRITEHTTP
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
index ad16c72912..ad79e1cb0b 100644
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
