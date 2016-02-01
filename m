From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:38:02 +0100
Subject: [Buildroot] [git commit] toolchain-external: bump Linaro ARM to
	2015.11-2
Message-ID: <20160201224711.613CD7F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7199d7a9dfa6d07811f1f767acc6e4e6c723f42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Runtime tested with Qemu 2.3.1 using a configuration based on
qemu_arm_vexpress_defconfig with BR2_ARM_ENABLE_VFP and
BR2_ARM_EABIHF selected

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: only add the symlink with the old 2014.09 Linaro toolchain,
for the newer ones, it is no longer needed. This has been runtime
tested in Qemu.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in               | 2 +-
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a873e41..a195421 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -37,7 +37,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 
 # See the note above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2015.08"
+	bool "Linaro ARM 2015.11"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64"
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index bc913c4..6c211bf 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -32,7 +32,7 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 
 # ARM and Aarch64 toolchains from Linaro
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-sha256 34812c5d0556db86259ac6eb3f8bcf4ce8eca3fa8d7180875958492a42e9853f  gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf.tar.xz
+sha256 ff2d231749e59968cb5e7032b4f4e4ae82ff9f11c23967863e627a6c59cb3bc0  gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 24b86799a6c64380c740bf31a700b46e854fc0a821da2341e9868f0196c864de  gcc-linaro-5.1-2015.08-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e5efb0b..fb1dff2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -297,11 +297,11 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.1-2015.08/arm-linux-gnueabihf
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
 endif
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
