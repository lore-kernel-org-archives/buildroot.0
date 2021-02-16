From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 21:00:51 +0100
Subject: [Buildroot] [git commit] package/collectd: add 'infiniband' option
Message-ID: <20210216194300.8F9F1853AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbd676801e4ca037d0ae67788e936ea6ec533441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infiniband plugin is new since 5.12.0 and enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index f02cedda49..ae69482608 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -285,6 +285,11 @@ config BR2_PACKAGE_COLLECTD_HUGEPAGES
 	help
 	  Reports the number of used and free hugepages on Linux.
 
+config BR2_PACKAGE_COLLECTD_INFINIBAND
+	bool "infiniband"
+	help
+	  Attributes and counters for each port on each IB device.
+
 config BR2_PACKAGE_COLLECTD_INTERFACE
 	bool "interface"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 3fcca12a45..4a4e313224 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -83,6 +83,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),--enable-grpc,--disable-grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
+	$(if $(BR2_PACKAGE_COLLECTD_INFINIBAND),--enable-infiniband,--disable-infiniband) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
