From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:18:27 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: expand
	introduction text
Message-ID: <20140830072020.5D6C69D2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a194faa44d2aec31422947b98b0ebca41f36d82f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch expands the introduction text of chapter 'Project-specific
customization' by listing the type of customizations that can be performed
by a project.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize.txt |   25 +++++++++++++++++++++----
 1 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 8dc428d..c876be8 100644
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
 
