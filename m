From: kostap at marvell.com <kostap@marvell.com>
Date: Wed, 6 Feb 2019 18:06:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnfsidmap: new package
Message-ID: <20190206160601.6360-1-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Reqired for NFSv4 support.
Taken from git at github.com:openstack/manila-test-image.git
/patches/nfs-utils-enable-nfsv4.patch

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 package/Config.in                  |  1 +
 package/libnfsidmap/Config.in      |  7 +++++++
 package/libnfsidmap/libnfsidmap.mk | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libnfsidmap/Config.in
 create mode 100644 package/libnfsidmap/libnfsidmap.mk

diff --git a/package/Config.in b/package/Config.in
index 28d3ef82a7..b7867299f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1533,6 +1533,7 @@ menu "Networking"
 	source "package/libnetfilter_log/Config.in"
 	source "package/libnetfilter_queue/Config.in"
 	source "package/libnfnetlink/Config.in"
+	source "package/libnfsidmap/Config.in"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
 	source "package/libnl/Config.in"
diff --git a/package/libnfsidmap/Config.in b/package/libnfsidmap/Config.in
new file mode 100644
index 0000000000..12dbf505a5
--- /dev/null
+++ b/package/libnfsidmap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNFSIDMAP
+	bool "libnfsidmap"
+	help
+	  Library used by the NFSv4 server to do userid mapping.
+
+	  http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
+
diff --git a/package/libnfsidmap/libnfsidmap.mk b/package/libnfsidmap/libnfsidmap.mk
new file mode 100644
index 0000000000..2c3bd812de
--- /dev/null
+++ b/package/libnfsidmap/libnfsidmap.mk
@@ -0,0 +1,13 @@
+#
+# libnfsidmap
+#
+
+LIBNFSIDMAP_VERSION = 0.25
+LIBNFSIDMAP_SITE = http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
+LIBNFSIDMAP_SOURCE = libnfsidmap-$(LIBNFSIDMAP_VERSION).tar.gz
+LIBNFSIDMAP_INSTALL_STAGING = YES
+LIBNFSIDMAP_LICENSE = BSD-like
+LIBNFSIDMAP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
