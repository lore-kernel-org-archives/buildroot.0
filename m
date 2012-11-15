From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:48 +0100
Subject: [Buildroot] [git commit] manual: customize-rootfs.txt: refactoring,
	misc. fixes and update
Message-ID: <20121115230538.0C38D99E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=483a1f82811a744e4683395986beceb0486a0c1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/customize-rootfs.txt |   30 ++++++++++++++++++------------
 1 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 7ac5195..d6224ff 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -4,7 +4,8 @@
 Customizing the generated target filesystem
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-There are a few ways to customize the resulting target filesystem:
+Besides changing one or another configuration through +make *config+,
+there are a few ways to customize the resulting target filesystem:
 
 * Customize the target filesystem directly and rebuild the image.  The
   target filesystem is available under +output/target/+.  You can
@@ -12,28 +13,33 @@ There are a few ways to customize the resulting target filesystem:
   rebuild the target filesystem image. This method allows you to do
   anything to the target filesystem, but if you decide to completely
   rebuild your toolchain and tools, these changes will be lost.
+  _Changes are not resistent to the +make clean+ command_.
 
 * Create your own 'target skeleton'. You can start with the default
   skeleton available under +system/skeleton+ and then customize it to
   suit your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
   +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
-  location of your custom skeleton. At build time, the contents of the
+  location of your custom skeleton. These options can be found in the
+  +System configuration+ menu. At build time, the contents of the
   skeleton are copied to output/target before any package
   installation.
 
 * In the Buildroot configuration, you can specify the path to a
-  post-build script, that gets called 'after' Buildroot builds all the
+  *post-build script*, that gets called 'after' Buildroot builds all the
   selected software, but 'before' the rootfs packages are
-  assembled. The destination root filesystem folder is given as the
-  first argument to this script, and this script can then be used to
-  copy programs, static data or any other needed file to your target
-  filesystem. You should, however, use this feature with care.
-  Whenever you find that a certain package generates wrong or unneeded
-  files, you should fix that package rather than work around it with a
-  post-build cleanup script.
+  assembled. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ will allow you to
+  specify the location of your post-build script. This option can be
+  found in the +System configuration+ menu. The destination root
+  filesystem folder *is given as the first argument to this script,
+  and this script can then be used to copy programs, static data or
+  any other needed file to your target filesystem. You should,
+  however, use this feature with care. Whenever you find that a
+  certain package generates wrong or unneeded files, you should fix
+  that package rather than work around it with a post-build cleanup
+  script. _Among these first 3 methods, this one should be prefere_d.
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
   target root filesystem in +package/customize/source+, and then
-  enable this special package in the configuration system.
-
+  enable this special package in the configuration system. _This
+  method is marked as deprecated_.
