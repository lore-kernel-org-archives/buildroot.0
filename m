From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Mar 2021 07:44:52 -0000
Subject: [Buildroot] [git commit] package/collectd: add 'mdevents' option
Message-ID: <20210308072134.4A99C8893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e77ab581208682e0bc2b8e03ab3fe6604e5b803d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mdevents plugin is new since 5.12.0 and enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ae69482608..11136f98ef 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -331,6 +331,11 @@ config BR2_PACKAGE_COLLECTD_MD
 	help
 	  Collects software-RAID device information.
 
+config BR2_PACKAGE_COLLECTD_MDEVENTS
+	bool "mdevents"
+	help
+	  Events from md (Linux Software RAID) devices.
+
 config BR2_PACKAGE_COLLECTD_MEMCACHEC
 	bool "memcachec"
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 4a4e313224..792eb9c355 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -94,6 +94,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),--enable-lua,--disable-lua) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
+	$(if $(BR2_PACKAGE_COLLECTD_MDEVENTS),--enable-mdevents,--disable-mdevents) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMORY),--enable-memory,--disable-memory) \
