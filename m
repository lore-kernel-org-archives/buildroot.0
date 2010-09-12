From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Sep 2010 00:23:47 +0200
Subject: [Buildroot] [git commit master 1/1] Config.in.arch: ARM cortex A9
	support
Message-ID: <20100912222428.8FCAB8A63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=92870a7a7c94260a62a3033408d490b740701100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by falls huang.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    2 ++
 target/Config.in.arch |    7 ++++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 70459d2..fce3259 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,8 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
+	Toolchain: ARM cortex A9 support
+
 	Updated/fixed packages: berkeleydb, busybox, dropbear,
 	iptables, kismet, openvpn, qt, usbutils
 
diff --git a/target/Config.in.arch b/target/Config.in.arch
index ce64068..484f5b4 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -102,9 +102,11 @@ config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
-comment "cortex-A8 needs gcc >= 4.4.x"
+comment "cortex-A8/A9 needs gcc >= 4.4.x"
 config BR2_cortex_a8
 	bool "cortex-A8"
+config BR2_cortex_a9
+	bool "cortex-A9"
 config BR2_sa110
 	bool "sa110"
 config BR2_sa1100
@@ -134,6 +136,7 @@ config BR2_ARM_TYPE
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
 	default ARM_CORTEXA8	if BR2_cortex_a8
+	default ARM_CORTEXA9	if BR2_cortex_a9
 
 choice
 	prompt "Target ABI"
@@ -621,6 +624,7 @@ config BR2_GCC_TARGET_TUNE
 	default arm1176jz-s	if BR2_arm1176jz_s
 	default arm1176jzf-s	if BR2_arm1176jzf_s
 	default cortex-a8	if BR2_cortex_a8
+	default cortex-a9	if BR2_cortex_a9
 	default strongarm110	if BR2_sa110
 	default strongarm1100	if BR2_sa1100
 	default xscale		if BR2_xscale
@@ -737,6 +741,7 @@ config BR2_GCC_TARGET_ARCH
 	default armv6zk		if BR2_arm1176jz_s
 	default armv6zk		if BR2_arm1176jzf_s
 	default armv7-a		if BR2_cortex_a8
+	default armv7-a		if BR2_cortex_a9
 	default armv4		if BR2_sa110
 	default armv4		if BR2_sa1100
 	default armv5te		if BR2_xscale
-- 
1.7.1
