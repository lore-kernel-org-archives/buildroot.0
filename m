From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 16 Feb 2021 14:54:29 +0100
Subject: [Buildroot] [PATCH] package/collectd: add option to enable UBI
 counters
In-Reply-To: <20210216135432.4830-1-patrickdepinguin@gmail.com>
References: <20210216135432.4830-1-patrickdepinguin@gmail.com>
Message-ID: <20210216135432.4830-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The 'ubi' collectd plugin was added in 5.11.0.
Add options in Buildroot to enable it.

Based on code by Bart De Vos.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.26.2
