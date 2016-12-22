From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:17 -0300
Subject: [Buildroot] [PATCH 10/14] collectd: add hugepages plugin support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-10-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the new hugepages dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
