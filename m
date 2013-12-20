From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:32:56 +0100
Subject: [Buildroot] [PATCH 3/4] package/squashfs: add selection for the
	host variant
In-Reply-To: <cover.1387578655.git.yann.morin.1998@free.fr>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
Message-ID: <8beb1bb1ddfdc369e119c4d85e943222d42b01dd.1387578655.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

If any of the post-image scripts, or genimages, wants to handle squashfs
filesystems, we need to expose an option for squashfs-tools to be
user-selectable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/Config.in.host          | 1 +
 package/squashfs/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/squashfs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 34e84bf..71597bf 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/squashfs/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
diff --git a/package/squashfs/Config.in.host b/package/squashfs/Config.in.host
new file mode 100644
index 0000000..b353374
--- /dev/null
+++ b/package/squashfs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_SQUASHFS
+	bool "host squashfs"
+	help
+	  Tools to generate SquashFS filesystems.
+
+	  http://squashfs.sourceforge.net/
-- 
1.8.1.2
