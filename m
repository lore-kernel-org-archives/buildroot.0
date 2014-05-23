From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 23 May 2014 17:13:32 +0400
Subject: [Buildroot] [PATCH] mplayer: Add support for ARC
Message-ID: <1400850812-24686-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for ARC architecture in Mplayer's configure script.
Same patch has been submitted to upstream MPlayer. This patch should be
removed after Buildroot will bump to next version of MPlayer (after 1.1.1).

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/mplayer/Config.in                          |  4 ++--
 package/mplayer/mplayer-0004-add-arc-support.patch | 13 +++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 package/mplayer/mplayer-0004-add-arc-support.patch

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
-- 
1.8.4.1
