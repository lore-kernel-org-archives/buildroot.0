From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun,  2 Feb 2014 12:22:31 -0500
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add a host variant
Message-ID: <1391361752-2112-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

This was useful to us, to get reproducable versions of host
utils for post-build scripts - so maybe it will be useful
to others as well.
---
 package/Config.in.host            |    1 +
 package/util-linux/Config.in.host |    8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 package/util-linux/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 34e84bf..41c0071 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,5 +14,6 @@ source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
+source "package/util-linux/Config.in.host"
 
 endmenu
diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
new file mode 100644
index 0000000..f73dc43
--- /dev/null
+++ b/package/util-linux/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_UTIL_LINUX
+	bool "host util-linux"
+	help
+	  Various useful/essential linux libraries and utilities.
+
+	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
+
+	  http://www.kernel.org/pub/linux/utils/util-linux/
-- 
1.7.9.5
