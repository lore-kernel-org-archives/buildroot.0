From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:43 -0300
Subject: [Buildroot] [PATCH v2 30/37] linux/Config.*: re-wrap help text
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-31-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 linux/Config.ext.in | 15 +++++++++------
 linux/Config.in     | 43 +++++++++++++++++++++++--------------------
 2 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 011dffb0b1..acc8a04742 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -117,14 +117,17 @@ config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
 	string "aufs-standalone version"
 	default ""
 	help
-	  The version you choose must match that of your kernel. Usually,
-	  the sha1 of the cset you want to use; avoid using a branch name
-	  as this yields non-reproducible builds.
+	  The version you choose must match that of your kernel.
+	  Usually, the sha1 of the cset you want to use; avoid using a
+	  branch name as this yields non-reproducible builds.
 
-	  See the following resources to see what versions are available:
+	  See the following resources to see what versions are
+	  available:
 
-	  For aufs3.x: https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
-	  For aufs4.x: https://github.com/sfjro/aufs4-standalone/branches/all
+	  For aufs3.x:
+	  https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
+	  For aufs4.x:
+	  https://github.com/sfjro/aufs4-standalone/branches/all
 
 endif # aufs
 
diff --git a/linux/Config.in b/linux/Config.in
index 934142c535..d9c5b62863 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -61,13 +61,13 @@ config BR2_LINUX_KERNEL_CUSTOM_VERSION
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	bool "Custom tarball"
 	help
-	  This option allows to specify a URL pointing to a kernel source
-	  tarball. This URL can use any protocol recognized by Buildroot,
-	  like http://, ftp://, file:// or scp://.
+	  This option allows to specify a URL pointing to a kernel
+	  source tarball. This URL can use any protocol recognized by
+	  Buildroot, like http://, ftp://, file:// or scp://.
 
-	  When pointing to a local tarball using file://, you may want to
-	  use a make variable like $(TOPDIR) to reference the root of the
-	  Buildroot tree.
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -109,8 +109,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION \
 		if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""  # legacy
 	help
-	  Revision to use in the typical format used by Git/Mercurial/Subversion
-	  E.G. a sha id, a tag, branch, ..
+	  Revision to use in the typical format used by
+	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
 
 endif
 
@@ -175,7 +175,8 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 	  Path to the kernel configuration file
 
 	  Note: this can be a defconfig file or a complete .config file,
-	  which can later be saved back with make linux-update-(def)config.
+	  which can later be saved back with make
+	  linux-update-(def)config.
 
 config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 	string "Additional configuration fragment files"
@@ -284,9 +285,9 @@ endchoice
 choice
 	prompt "Kernel compression format"
 	help
-	  This selection will just ensure that the correct host tools are built.
-	  The actual compression for the kernel should be selected in the
-	  kernel configuration menu.
+	  This selection will just ensure that the correct host tools
+	  are built. The actual compression for the kernel should be
+	  selected in the kernel configuration menu.
 
 config BR2_LINUX_KERNEL_GZIP
 	bool "gzip compression"
@@ -317,8 +318,9 @@ config BR2_LINUX_KERNEL_IMAGE_NAME
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	help
 	  The filename of the kernel image, if it is different from the
-	  make target (above). Only Xtensa uses a filename different from
-	  the make target. Defaults to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME.
+	  make target (above). Only Xtensa uses a filename different
+	  from the make target. Defaults to
+	  BR2_LINUX_KERNEL_IMAGE_TARGET_NAME.
 
 	  If unsure, leave it empty.
 
@@ -327,18 +329,19 @@ config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
 	depends on BR2_arm || BR2_armeb
 	depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
 	help
-	  If your ARM system's Linux kernel is configured with the new (3.7+)
-	  multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your
-	  kernel config), then it is necessary to specify a kernel load address
-	  when building the uImage. This should be a hexadecimal string
-	  beginning with 0x, for example: 0x00008000.
+	  If your ARM system's Linux kernel is configured with the new
+	  (3.7+) multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y
+	  in your kernel config), then it is necessary to specify a
+	  kernel load address when building the uImage. This should be a
+	  hexadecimal string beginning with 0x, for example: 0x00008000.
 
 	  If unsure, let this option empty.
 
 config BR2_LINUX_KERNEL_DTS_SUPPORT
 	bool "Build a Device Tree Blob (DTB)"
 	help
-	  Compile one or more device tree sources into device tree blobs.
+	  Compile one or more device tree sources into device tree
+	  blobs.
 	  Select the dts files to compile in the options below.
 
 if BR2_LINUX_KERNEL_DTS_SUPPORT
-- 
2.14.1
