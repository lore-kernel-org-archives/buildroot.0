From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:41:33 +0100
Subject: [Buildroot] [git commit] collectd: add hugepages plugin support
Message-ID: <20161223214640.1DE8C7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d430b24ecd4da25fd195905e6f92a501cf79ade0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add explicit support for the new hugepages dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index b17abe8..7cd6397 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -237,6 +237,11 @@ config BR2_PACKAGE_COLLECTD_FSCACHE
 	  Collects information about the file-system based caching
 	  infrastructure for network file-systems and other slow media.
 
+config BR2_PACKAGE_COLLECTD_HUGEPAGES
+	bool "hugepages"
+	help
+	  Reports the number of used and free hugepages on Linux.
+
 config BR2_PACKAGE_COLLECTD_INTERFACE
 	bool "interface"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 2b57e51..392c76f 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -59,6 +59,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
+	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
