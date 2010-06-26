From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Jun 2010 07:44:16 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: only show the option
	when a Linux kernel is being built
Message-ID: <20100626054529.2C38481E0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=93e801470981010d8760db372f511e04481182d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2119

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    1 +
 fs/initramfs/Config.in |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 27582cb..ea399df 100644
--- a/CHANGES
+++ b/CHANGES
@@ -49,6 +49,7 @@
 	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
 	#2038: Bump ncurses to 5.7
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
+	#2119: Tries to build kernel, although disabled in config
 
 2010.05, Released May 30th, 2010:
 
diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index d53982c..c76b2de 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_INITRAMFS
 	bool "initramfs for initial ramdisk of linux kernel"
+	depends on BR2_LINUX_KERNEL
 	help
 	  Build a file which is usable for the gen_init_cpio tool
 	  at linux kernel build.
@@ -13,3 +14,5 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  Device Drivers -> Block devices -> Initramfs source file(s).
 	  The configuration variable is CONFIG_INITRAMFS_SOURCE
 
+comment "initramfs requires a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
-- 
1.7.1
