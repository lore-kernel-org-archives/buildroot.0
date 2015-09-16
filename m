From: jpinto <Joao.Pinto@synopsys.com>
Date: Wed, 16 Sep 2015 10:10:48 +0100
Subject: [Buildroot] [PATCH v3] Enable mplayer to be built in arm64
	architectures
Message-ID: <7b568f198d2a7b9f6d9c99f2e503641eae0d4ecf.1442394054.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure: Added support for aarch64
Config.in: Added support for aarch64

This patch adds support for ARM64 systems to Mplayer 1.1.1 available
at buildroot.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Tested-by: Joao Pinto <jpinto@synopsys.com>

---
diff --git a/package/mplayer/0007-mplayer-enable-aarch64.patch b/package/mplayer/0007-mplayer-enable-aarch64.patch
new file mode 100644
index 0000000..7f75756
--- /dev/null
+++ b/package/mplayer/0007-mplayer-enable-aarch64.patch
@@ -0,0 +1,13 @@
+--- b/configure	2015-09-15 17:30:46.187307557 +0100
++++ a/configure	2015-09-15 17:31:11.729307537 +0100
+@@ -2496,6 +2496,10 @@
+     arch='arc'
+     iproc='arc'
+     ;;
++  aarch64)
++    arch='arm64'
++    iproc='arm64'
++    ;;
+ 
+   *)
+     echo "The architecture of your CPU ($host_arch) is not supported by this configure script"
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 79ff3b1..7a8b03f 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	default y
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
+		|| BR2_microblaze || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
  
-- 
1.8.1.5
