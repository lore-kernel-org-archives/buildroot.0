From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 23:28:27 +0200
Subject: [Buildroot] [git commit] mplayer: enable building on ARM64
Message-ID: <20150917213120.4E13781ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc839e436a2a745bc7996545b1f60df5670df63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/0007-mplayer-enable-aarch64.patch |   22 +++++++++++++++++++++
 package/mplayer/Config.in                         |    2 +-
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/0007-mplayer-enable-aarch64.patch b/package/mplayer/0007-mplayer-enable-aarch64.patch
new file mode 100644
index 0000000..dc59f5f
--- /dev/null
+++ b/package/mplayer/0007-mplayer-enable-aarch64.patch
@@ -0,0 +1,22 @@
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
+
+
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
 
