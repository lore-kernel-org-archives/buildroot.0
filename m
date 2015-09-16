From: jpinto <Joao.Pinto@synopsys.com>
Date: Wed, 16 Sep 2015 12:24:41 +0100
Subject: [Buildroot] [PATCH] mplayer: enable building on ARM64
Message-ID: <b4065180404deb324af702186c37e497bc1740b8.1442402281.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 0007-mplayer-enable-aarch64.patch | 20 ++++++++++++++++++++
 Config.in                         |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 0007-mplayer-enable-aarch64.patch

diff --git a/0007-mplayer-enable-aarch64.patch b/0007-mplayer-enable-aarch64.patch
new file mode 100644
index 0000000..a41ab2a
--- /dev/null
+++ b/0007-mplayer-enable-aarch64.patch
@@ -0,0 +1,20 @@
+Add support for ARM64 architecture
+
+This patch adds aarch64 as a supported architecture to the configure script.
+
+Signed-off-by: Joao Pinto <jpinto@synopsys.com>
+---
+
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
diff --git a/Config.in b/Config.in
index 79ff3b1..7a8b03f 100644
--- a/Config.in
+++ b/Config.in
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
