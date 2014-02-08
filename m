From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:16:57 +0100
Subject: [Buildroot] [git commit] package/squashfs: add selection for the
	host variant
Message-ID: <20140208222132.455669C849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2852f787d0eca3d95b605255e3b58c85760c6d32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If any of the post-image scripts wants to handle squashfs filesystems,
we need to expose an option for squashfs-tools to be user-selectable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host          |    1 +
 package/squashfs/Config.in.host |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 599ab9e..ac6091f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/parted/Config.in.host"
 source "package/sam-ba/Config.in.host"
+source "package/squashfs/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 source "package/util-linux/Config.in.host"
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
