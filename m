From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:13 -0300
Subject: [Buildroot] [PATCH 06/14] collectd: add chrony plugin support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-6-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the new chrony dependency-less plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 72e5793..5e84aa5 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -127,6 +127,11 @@ config BR2_PACKAGE_COLLECTD_CEPH
 	help
 	  Statistics from the Ceph distributed storage system.
 
+config BR2_PACKAGE_COLLECTD_CHRONY
+	bool "chrony"
+	help
+	  Collects NTP data from the chrony NTP server.
+
 config BR2_PACKAGE_COLLECTD_CGROUPS
 	bool "cgroups"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 11685cd..5018fb0 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -35,6 +35,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
 	$(if $(BR2_PACKAGE_COLLECTD_CEPH),--enable-ceph,--disable-ceph) \
+	$(if $(BR2_PACKAGE_COLLECTD_CHRONY),--enable-chrony,--disable-chrony) \
 	$(if $(BR2_PACKAGE_COLLECTD_CGROUPS),--enable-cgroups,--disable-cgroups) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONNTRACK),--enable-conntrack,--disable-conntrack) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONTEXTSWITCH),--enable-contextswitch,--disable-contextswitch) \
-- 
2.10.2
