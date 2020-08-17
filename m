From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:15:57 +0200
Subject: [Buildroot] [git commit] package/collectd: add buddyinfo option
Message-ID: <20200817100942.8E3BE82775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f80c62825773508843b0ed94c7ab4f979eda223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

buddyinfo is available since version 5.11.0 and
https://github.com/collectd/collectd/commit/cb19ecf90d89a79836b8b5236d2b66277dd79c5f

It is currently enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 5 +++++
 package/collectd/collectd.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ca45130c4d..4f54944cbc 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -131,6 +131,11 @@ config BR2_PACKAGE_COLLECTD_BIND
 	help
 	  Collects BIND DNS statistics.
 
+config BR2_PACKAGE_COLLECTD_BUDDYINFO
+	bool "buddyinfo"
+	help
+	  Statistics from buddyinfo file about memory fragmentation.
+
 config BR2_PACKAGE_COLLECTD_CAPABILITIES
 	bool "capabilities"
 	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64 # dmidecode
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index b36975daf0..2eed6b2c16 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -51,6 +51,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
+	$(if $(BR2_PACKAGE_COLLECTD_BUDDYINFO),--enable-buddyinfo,--disable-buddyinfo) \
 	$(if $(BR2_PACKAGE_COLLECTD_CAPABILITIES),--enable-capabilities,--disable-capabilities) \
 	$(if $(BR2_PACKAGE_COLLECTD_CEPH),--enable-ceph,--disable-ceph) \
 	$(if $(BR2_PACKAGE_COLLECTD_CHRONY),--enable-chrony,--disable-chrony) \
