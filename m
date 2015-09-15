From: jpinto <Joao.Pinto@synopsys.com>
Date: Tue, 15 Sep 2015 18:00:04 +0100
Subject: [Buildroot] [PATCH v2] Buildroot' patch to add support for aarch64
	in mplayer configure script
Message-ID: <e6993588b5107e1110e43ed583416f4784933eef.1442336078.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: jpinto <jpinto@synopsys.com>
---
 package/mplayer/0007-enable-aarch64.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/mplayer/0007-enable-aarch64.patch

diff --git a/package/mplayer/0007-enable-aarch64.patch b/package/mplayer/0007-enable-aarch64.patch
new file mode 100644
index 0000000..7f75756
--- /dev/null
+++ b/package/mplayer/0007-enable-aarch64.patch
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

---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
