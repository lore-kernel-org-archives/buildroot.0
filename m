From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 15:34:11 +0200
Subject: [Buildroot] [git commit] mplayer: Add support for ARC
Message-ID: <20140523200519.26D7C9CD77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9378e73600e71e8aba03c57572f75abb68a941ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for ARC architecture in Mplayer's configure script.
Same patch has been submitted to upstream MPlayer. This patch should be
removed after Buildroot will bump to next version of MPlayer (after 1.1.1).

Fixes http://autobuild.buildroot.net/results/f62/f62ace7ba49d492ea224bb8f3beb547389aab517/

[Peter: add autobuilder link]
Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in                          |    4 ++--
 package/mplayer/mplayer-0004-add-arc-support.patch |   13 +++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index f0dc9a5..8b5d05e 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_arc || BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
@@ -29,6 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_arc || BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	depends on !BR2_LARGEFILE
diff --git a/package/mplayer/mplayer-0004-add-arc-support.patch b/package/mplayer/mplayer-0004-add-arc-support.patch
new file mode 100644
index 0000000..c14ef23
--- /dev/null
+++ b/package/mplayer/mplayer-0004-add-arc-support.patch
@@ -0,0 +1,13 @@
+--- mplayer-1.1/configure	2013-12-03 00:32:10.815571460 -0800
++++ mplayer-1.1-arc/configure	2013-11-29 00:34:29.238297709 -0800
+@@ -2492,6 +2492,10 @@
+   generic)
+     arch='generic'
+     ;;
++  arc)
++    arch='arc'
++    iproc='arc'
++    ;;
+ 
+   *)
+     echo "The architecture of your CPU ($host_arch) is not supported by this configure script"
