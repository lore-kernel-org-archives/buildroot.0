From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Mar 2021 07:44:45 -0000
Subject: [Buildroot] [git commit] package/collectd: add 'synproxy' option
Message-ID: <20210308072134.612FF8896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=312cf8e1206aa991f55e16648c0bd813cf43f283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The synproxy plugin exists since 5.8.0 and is enabled by default in
collectd.

Add an option in Buildroot, disabled by default.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
