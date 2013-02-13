From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:08 +0100
Subject: [Buildroot] [PATCH 7/9] manual: misc. post-{build,
	image} scripts fixes
In-Reply-To: <cover.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
Message-ID: <76731c24e8bd3e8099cc5f5ef54ad918b1770e32.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* update post-build scripts mechanism that now support several scripts
* fix formatting

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-rootfs.txt | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 4a4d620..95dfc16 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -25,18 +25,18 @@ there are a few ways to customize the resulting target filesystem.
   directories, +.empty+ files and files ending with +~+ are excluded.
   _Among these first 3 methods, this one should be preferred_.
 
-* In the Buildroot configuration, you can specify the path to a
-  *post-build script*, that gets called 'after' Buildroot builds all the
-  selected software, but 'before' the rootfs packages are
-  assembled. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ will allow you to
-  specify the location of your post-build script. This option can be
+* In the Buildroot configuration, you can specify the pathes to a
+  *post-build scripts*, that get called in order, *after* _Buildroot builds
+  all the selected software_, but *before* _the rootfs packages are
+  assembled_. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ will allow you to
+  specify the location of your post-build scripts. This option can be
   found in the +System configuration+ menu. The destination root
-  filesystem folder is given as the first argument to this script,
-  and this script can then be used to remove or modify any file in your
+  filesystem folder is given as the first argument to these scripts,
+  and these scripts can then be used to remove or modify any file in your
   target filesystem. You should, however, use this feature with care.
   Whenever you find that a certain package generates wrong or unneeded
-  files, you should fix that package rather than work around it with a
-  post-build cleanup script.
+  files, you should fix that package rather than work around it with some
+  post-build cleanup scripts.
   You may also use these variables in your post-build script:
     - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
@@ -55,23 +55,25 @@ there are a few ways to customize the resulting target filesystem.
   installation. Note that this method is *not recommended*, as it
   duplicates the entire skeleton, which prevents from taking advantage
   of the fixes or improvements brought to the default Buildroot
-  skeleton. The recommended method is to use the _post-build script_
+  skeleton. The recommended method is to use the _post-build scripts_
   mechanism described in the previous item.
 
-Note also that if you want to perform some specific actions *after*
-all filesystem images have been created (for example to automatically
+Note also that you can use the *post-image scripts*
+if you want to perform some specific actions *after* _all
+filesystem images have been created_ (for example to automatically
 extract your root filesystem tarball in a location exported by your
 NFS server, or to create a special firmware image that bundles your
 root filesystem and kernel image, or any other custom action), you can
 specify a space-separated list of scripts in the
-+BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option.
++BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option. This option can be
+found in the +System configuration+ menu as well.
 
 Each of those scripts will be called with the path to the +images+
 output directory as first and unique argument, and will be executed
 with the main Buildroot source directory as the current
 directory. Those scripts will be executed as the user that executes
 Buildroot, which should normally not be the root user. Therefore, any
-action requiring root permissions in one of these post-image script
+action requiring root permissions in one of these _post-image scripts_
 will require special handling (usage of fakeroot or sudo), which is
 left to the script developer.
 
-- 
1.8.1.3
