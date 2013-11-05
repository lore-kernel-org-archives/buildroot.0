From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 22:24:14 +0100
Subject: [Buildroot] [git commit] collectd: add option for sensors plugin
Message-ID: <20131105212426.DC48D9BA6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c611d5b527505c896fdf181218b1c728f2ceaf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   |    6 ++++++
 package/collectd/collectd.mk |    4 +++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 2059198..8123162 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -277,6 +277,12 @@ config BR2_PACKAGE_COLLECTD_PROTOCOLS
 	help
 	  Collects information about the network protocols.
 
+config BR2_PACKAGE_COLLECTD_SENSORS
+	bool "sensors"
+	select BR2_PACKAGE_LM_SENSORS
+	help
+	  Collects data from lm-sensors.
+
 config BR2_PACKAGE_COLLECTD_SERIAL
 	bool "serial"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 55a388c..e7dc093 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
 		memcachec modbus multimeter netapp netlink nginx \
 		notify_desktop notify_email numa nut onewire oracle perl pf \
 		pinba postgresql powerdns python redis routeros rrdcached \
-		sensors sigrok tape target_v5upgrade teamspeak2 ted \
+		sigrok tape target_v5upgrade teamspeak2 ted \
 		tokyotyrant uuid varnish vserver write_mongodb write_redis \
 		xmms zfs_arc
 
@@ -74,6 +74,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),--enable-write_riemann,--disable-write_riemann) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
+	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),--enable-sensors,--disable-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SERIAL),--enable-serial,--disable-serial) \
 	$(if $(BR2_PACKAGE_COLLECTD_STATSD),--enable-statsd,--disable-statsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_SET),--enable-target_set,--disable-target_set) \
@@ -108,6 +109,7 @@ COLLECTD_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
+	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl)
 
