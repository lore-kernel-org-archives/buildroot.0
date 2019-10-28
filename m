From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 13:59:21 +0100
Subject: [Buildroot] [git commit] package/collectd: add onewire support
Message-ID: <20191028125708.6866C8B445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9147c5b4e8fde8d5325bb384bd23b91fb04442d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index bda546e67e..4fa4074a51 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -359,6 +359,13 @@ config BR2_PACKAGE_COLLECTD_OLSRD
 	help
 	  Reads information about meshed networks from olsrd.
 
+config BR2_PACKAGE_COLLECTD_ONEWIRE
+	bool "onewire"
+	select BR2_PACKAGE_OWFS
+	help
+	  Collects temperature information from sensors connected over
+	  the OneWire bus.
+
 config BR2_PACKAGE_COLLECTD_OPENLDAP
 	bool "openldap"
 	depends on BR2_USE_WCHAR
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index fefd5641b2..31f7340d98 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -20,7 +20,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond hddtemp intel_rdt ipmi java lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
-	nut onewire oracle perl pf pinba powerdns python routeros \
+	nut oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
@@ -105,6 +105,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_NAGIOS),--enable-notify_nagios,--disable-notify_nagios) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
+	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),--enable-onewire,--disable-onewire) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),--enable-openldap,--disable-openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),--enable-ping,--disable-ping) \
@@ -167,6 +168,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
+	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),owfs) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
