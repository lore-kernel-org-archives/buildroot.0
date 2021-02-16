From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 21:01:02 +0100
Subject: [Buildroot] [git commit] package/collectd: add 'mdevents' option
Message-ID: <20210216194300.A4E91853AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=933de25dc0cbc5bfd683b97e85e53d020184d98f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mdevents plugin is new since 5.12.0 and enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
