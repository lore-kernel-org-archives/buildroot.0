From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 22:54:01 +0100
Subject: [Buildroot] [git commit] package/collectd: add option to enable UBI
 counters
Message-ID: <20210127213442.ED88283E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=261e6eebdd26a835c6067691ab131b9f1f70fcd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'ubi' collectd plugin was added in 5.11.0.
Add options in Buildroot to enable it.

Based on code by Bart De Vos.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/Config.in   | 10 ++++++++++
 package/collectd/collectd.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 3e854ba518..f02cedda49 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -525,6 +525,16 @@ config BR2_PACKAGE_COLLECTD_THERMAL
 	help
 	  Reads ACPI thermal zone information.
 
+config BR2_PACKAGE_COLLECTD_UBI
+	bool "ubi"
+	help
+	  UBI (Unsorted Block Images) is an erase block management layer
+	  for flash memory devices. UBI serves two purposes, tracking
+	  NAND flash bad blocks and providing wear leveling.
+	  This plugin collects some stats about UBI devices:
+	   * bad physical underlying blocks (bad_peb_count)
+	   * max erase counter value (max_ec)
+
 config BR2_PACKAGE_COLLECTD_UPTIME
 	bool "uptime"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 8fa278df7e..ccca9bf388 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -137,6 +137,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_THERMAL),--enable-thermal,--disable-thermal) \
 	$(if $(BR2_PACKAGE_COLLECTD_THRESHOLD),--enable-threshold,--disable-threshold) \
 	$(if $(BR2_PACKAGE_COLLECTD_TIMEDIFF),--enable-match_timediff,--disable-match_timediff) \
+	$(if $(BR2_PACKAGE_COLLECTD_UBI),--enable-ubi,--disable-ubi) \
 	$(if $(BR2_PACKAGE_COLLECTD_UNIXSOCK),--enable-unixsock,--disable-unixsock) \
 	$(if $(BR2_PACKAGE_COLLECTD_UPTIME),--enable-uptime,--disable-uptime) \
 	$(if $(BR2_PACKAGE_COLLECTD_USERS),--enable-users,--disable-users) \
