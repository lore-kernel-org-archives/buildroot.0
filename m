From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:28 +0200
Subject: [Buildroot] [PATCH 05 of 13] manual/user guide/customization:
 re-order introduction
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <92c562e0015f64c55642.1411069168@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch re-orders the enumeration of typical project customization
actions:
- move the 'patching packages' section downwards.
- group the entries on post-build scripts and rootfs-overlays to match the
  actual section text.

Since indented enumerations use asterixes, update the top-level entries with
asterixes too for consistency.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize.txt |  29 +++++++++++++++--------------
 1 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -6,20 +6,21 @@
 
 Typical actions you may need to perform for a given project are:
 
-- configuring Buildroot (including build options and toolchain,
+* configuring Buildroot (including build options and toolchain,
   bootloader, kernel, package and filesystem image type selection)
-- configuring other components, like the Linux kernel and BusyBox
-- adding project-specific patches to some packages (using
+* configuring other components, like the Linux kernel and BusyBox
+* customizing the generated target filesystem
+  ** adding or overwriting files on the target filesystem (using
+     +BR2_ROOTFS_OVERLAY+)
+  ** modifying or deleting files on the target filesystem (using
+     +BR2_ROOTFS_POST_BUILD_SCRIPT+)
+  ** running arbitrary commands prior to generating the filesystem image
+     (using +BR2_ROOTFS_POST_BUILD_SCRIPT+)
+* running arbitrary commands after generating the filesystem image
+  (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
+* adding project-specific patches to some packages (using
   +BR2_GLOBAL_PATCH_DIR+)
-- adding or overwriting files on the target filesystem (using
-  +BR2_ROOTFS_OVERLAY+)
-- modifying or deleting files on the target filesystem (using
-  +BR2_ROOTFS_POST_BUILD_SCRIPT+)
-- running arbitrary commands prior to generating the filesystem image
-  (using +BR2_ROOTFS_POST_BUILD_SCRIPT+)
-- running arbitrary commands after generating the filesystem image
-  (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
-- adding project-specific packages
+* adding project-specific packages
 
 An important note regarding such 'project-specific' customizations:
 please carefully consider which changes are indeed project-specific and
@@ -45,6 +46,6 @@
 
 include::customize-post-image.txt[]
 
+include::customize-packages.txt[]
+
 include::customize-store.txt[]
-
-include::customize-packages.txt[]
