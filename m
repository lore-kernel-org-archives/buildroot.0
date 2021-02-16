From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 21:01:28 +0100
Subject: [Buildroot] [git commit] package/collectd: add 'synproxy' option
Message-ID: <20210216194300.C1911853AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a6cdaf5876c0e4605eec32e528f13ee77f1136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The synproxy plugin exists since 5.8.0 and is enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 679285d997..82c24fdbc3 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -513,6 +513,11 @@ config BR2_PACKAGE_COLLECTD_SWAP
 	help
 	  Collects the amount of memory currently written to disk.
 
+config BR2_PACKAGE_COLLECTD_SYNPROXY
+	bool "synproxy"
+	help
+	  Synproxy stats plugin.
+
 config BR2_PACKAGE_COLLECTD_TABLE
 	bool "table"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d57e6b8c1d..7db753b342 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -132,6 +132,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),--enable-smart,--disable-smart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),--enable-snmp,--disable-snmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_SWAP),--enable-swap,--disable-swap) \
+	$(if $(BR2_PACKAGE_COLLECTD_SYNPROXY),--enable-synproxy,--disable-synproxy) \
 	$(if $(BR2_PACKAGE_COLLECTD_SYSLOG),--enable-syslog,--disable-syslog) \
 	$(if $(BR2_PACKAGE_COLLECTD_TABLE),--enable-table,--disable-table) \
 	$(if $(BR2_PACKAGE_COLLECTD_TAIL),--enable-tail,--disable-tail) \
