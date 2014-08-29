From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Aug 2014 21:50:39 +0200
Subject: [Buildroot] [PATCH 1 of 3 v2 for 2014.08] manual/user
 guide/customization: expand introduction text
In-Reply-To: <patchbomb.1409341838@localhost>
References: <patchbomb.1409341838@localhost>
Message-ID: <9f010677060ce487d229.1409341839@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch expands the introduction text of chapter 'Project-specific
customization' by listing the type of customizations that can be performed
by a project.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: reword 'from a clean buildroot tree' --> 'after running make clean' to
    avoid confusion (Samuel)

 docs/manual/customize.txt |  25 +++++++++++++++++++++----
 1 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -3,11 +3,28 @@
 
 == Project-specific customization
 
-The following sections describe the various way in which you can
-customize Buildroot for a given project.
+Typical actions you may need to perform for a given project are:
 
-For instructions on how to add new packages to Buildroot, refer to
-xref:adding-packages[]
+- configuring Buildroot (including build options and toolchain,
+  bootloader, kernel, package and filesystem image type selection)
+- configuring other components, like the Linux kernel and BusyBox
+- adding project-specific patches to some packages (using
+  +BR2_GLOBAL_PATCH_DIR+)
+- adding or overwriting files on the target filesystem (using
+  +BR2_ROOTFS_OVERLAY+)
+- modifying or deleting files on the target filesystem (using
+  +BR2_ROOTFS_POST_BUILD_SCRIPT+)
+- running arbitrary commands prior to generating the filesystem image
+  (using +BR2_ROOTFS_POST_BUILD_SCRIPT+)
+- running arbitrary commands after generating the filesystem image
+  (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
+- adding project-specific packages
+
+This chapter describes how to make such project-specific customizations
+in Buildroot and how to store them in a way that you can build the same
+image in a reproducible way, even after running 'make clean'. By
+following the recommended strategy, you can even use the same Buildroot
+tree to build multiple distinct projects!
 
 include::customize-rootfs.txt[]
 
