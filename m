From: jeffball59 at gmail.com <jeffball59@gmail.com>
Date: Sun,  9 Feb 2014 16:10:44 -0500
Subject: [Buildroot] [PATCH 1/1] Modified the documentation on customizing a
	rootfs to be less ambiguous
In-Reply-To: <y>
References: <y>
Message-ID: <1391980244-8855-1-git-send-email-jeffball59@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeff Stewart <jeffball59@gmail.com>

While reading the documentation I was a little confused over the recommended
method for customizing the target file system.  After sorting it out in the
IRC channel, I modified the documentation to be a little less ambiguous.

Signed-off-by: Jeff Stewart <jeffball59@gmail.com>
---
 docs/manual/customize-rootfs.txt |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 2cbae99..c23b1af 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -23,7 +23,7 @@ there are a few ways to customize the resulting target filesystem.
   over the target filesystem after it has been built.  Set
   +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+, +.hg+
   directories, +.empty+ files and files ending with +~+ are excluded.
-  _Among these first 3 methods, this one should be preferred_.
+  _Among the customization methods, this one should be preferred_.
 
 * In the Buildroot configuration, you can specify the paths to one or
   more *post-build scripts*. These scripts are called in the given order,
@@ -56,8 +56,8 @@ there are a few ways to customize the resulting target filesystem.
   installation. Note that this method is *not recommended*, as it
   duplicates the entire skeleton, which prevents from taking advantage
   of the fixes or improvements brought to the default Buildroot
-  skeleton. The recommended method is to use the _post-build scripts_
-  mechanism described in the previous item.
+  skeleton. The _post-build scripts_ mechanism described in the previous
+  item is recommend over this mechanism.
 
 Note also that you can use the *post-image scripts*
 if you want to perform some specific actions 'after' all
-- 
1.7.10.4
