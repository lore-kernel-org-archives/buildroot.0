From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Nov 2009 09:55:07 +0100
Subject: [Buildroot] [git commit master] Add support for the Cortex-A8 ARM
	target
Message-ID: <20091118085528.EA529777D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=83182dd28edfccd0cbfffd48f2bdfabc5939aedf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Laine Walker-Avina <lwalkera@ieee.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    2 ++
 target/Config.in.arch |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2bb1197..1da84d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,7 @@
 2009.11, Not yet released:
 
+	Toolchain: ARM cortex A8 support, GCC 4.4.2.
+
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
 
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e82c8f4..1e3c78c 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -84,6 +84,9 @@ config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+comment "cortex-A8 needs gcc >= 4.4.x"
+config BR2_cortex_a8
+	bool "cortex-A8"
 config BR2_sa110
 	bool "sa110"
 config BR2_sa1100
@@ -112,6 +115,7 @@ config BR2_ARM_TYPE
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
+	default ARM_CORTEXA8	if BR2_cortex_a8
 
 choice
 	prompt "Target ABI"
@@ -591,6 +595,7 @@ config BR2_GCC_TARGET_TUNE
 	default arm1136jf-s	if BR2_arm1136jf_s
 	default arm1176jz-s	if BR2_arm1176jz_s
 	default arm1176jzf-s	if BR2_arm1176jzf_s
+	default cortex-a8	if BR2_cortex_a8
 	default strongarm110	if BR2_sa110
 	default strongarm1100	if BR2_sa1100
 	default xscale		if BR2_xscale
@@ -703,6 +708,7 @@ config BR2_GCC_TARGET_ARCH
 	default armv6j		if BR2_arm1136jf_s
 	default armv6zk		if BR2_arm1176jz_s
 	default armv6zk		if BR2_arm1176jzf_s
+	default armv7-a		if BR2_cortex_a8
 	default armv4		if BR2_sa110
 	default armv4		if BR2_sa1100
 	default armv5te		if BR2_xscale
-- 
1.6.3.3
