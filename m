From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 22:04:38 +0200
Subject: [Buildroot] [git commit] boot/beaglev-ddrlnit: rename to
 beaglev-ddrinit to match renamed upstream repo
Message-ID: <20210510193652.6F35586E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b551f68a55d74f4fe7e814ebdf1101453f1255d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And adjust DEVELOPERS and beaglev_defconfig to match.

The typo in the repo name has now been fixed:

https://github.com/starfive-tech/beagle_ddrinit/issues/6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                           |  2 +-
 boot/{beaglev-ddrlnit => beaglev-ddrinit}/Config.in  |  6 +++---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash            |  2 ++
 .../beaglev-ddrinit.mk}                              | 20 ++++++++++----------
 boot/beaglev-ddrlnit/beaglev-ddrlnit.hash            |  2 --
 configs/beaglev_defconfig                            |  2 +-
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bbbb0ecfa8..b688c8a8c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,7 +2604,7 @@ N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
 F:	board/stmicroelectronics/stm32mp157c-dk2/
-F:	boot/beaglev-ddrlnit/
+F:	boot/beaglev-ddrinit/
 F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
diff --git a/boot/beaglev-ddrlnit/Config.in b/boot/beaglev-ddrinit/Config.in
similarity index 61%
rename from boot/beaglev-ddrlnit/Config.in
rename to boot/beaglev-ddrinit/Config.in
index e9d6e08ab9..7ca92a7b9b 100644
--- a/boot/beaglev-ddrlnit/Config.in
+++ b/boot/beaglev-ddrinit/Config.in
@@ -1,9 +1,9 @@
-config BR2_TARGET_BEAGLEV_DDRLNIT
-	bool "beaglev-ddrlnit"
+config BR2_TARGET_BEAGLEV_DDRINIT
+	bool "beaglev-ddrinit"
 	depends on BR2_riscv
 	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
 	help
 	  This package builds the DDRinit firmware used on the BeagleV
 	  platform.
 
-	  https://github.com/starfive-tech/beagle_ddrlnit
+	  https://github.com/starfive-tech/beagle_ddrinit
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
new file mode 100644
index 0000000000..5bbbe28f07
--- /dev/null
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  0809b72e1e8e40f82acdcfd4c8a6a120e14bd9ed395592e075bb54acc8c07271  beaglev-ddrinit-15b80de81263996affb2a29332aa681925709983.tar.gz
diff --git a/boot/beaglev-ddrlnit/beaglev-ddrlnit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
similarity index 55%
rename from boot/beaglev-ddrlnit/beaglev-ddrlnit.mk
rename to boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 042878f1c2..02df0613ee 100644
--- a/boot/beaglev-ddrlnit/beaglev-ddrlnit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -1,27 +1,27 @@
 ################################################################################
 #
-# beaglev-ddrlnit
+# beaglev-ddrinit
 #
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRLNIT_VERSION = 15b80de81263996affb2a29332aa681925709983
-BEAGLEV_DDRLNIT_SITE = $(call github,starfive-tech,beagle_ddrlnit,$(BEAGLEV_DDRLNIT_VERSION))
-BEAGLEV_DDRLNIT_INSTALL_TARGET = NO
-BEAGLEV_DDRLNIT_INSTALL_IMAGES = YES
-BEAGLEV_DDRLNIT_DEPENDENCIES = host-riscv64-elf-toolchain
+BEAGLEV_DDRINIT_VERSION = 15b80de81263996affb2a29332aa681925709983
+BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
+BEAGLEV_DDRINIT_INSTALL_TARGET = NO
+BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
+BEAGLEV_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
 # unfortunately, no real license file, but several sources files are
 # under GPL-2.0+, making the whole work GPL-2.0+
-BEAGLEV_DDRLNIT_LICENSE = GPL-2.0+
+BEAGLEV_DDRINIT_LICENSE = GPL-2.0+
 
-define BEAGLEV_DDRLNIT_BUILD_CMDS
+define BEAGLEV_DDRINIT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
 		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
 		SUFFIX=buildroot \
-		GIT_VERSION=$(BEAGLEV_DDRLNIT_VERSION)
+		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
 endef
 
-define BEAGLEV_DDRLNIT_INSTALL_IMAGES_CMDS
+define BEAGLEV_DDRINIT_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
 		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
 endef
diff --git a/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash b/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash
deleted file mode 100644
index fe699b038d..0000000000
--- a/boot/beaglev-ddrlnit/beaglev-ddrlnit.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  dee7f8003ee02d7799d07b598dd5823e10b42f50fae6135b2320a8d7e1fa77bf  beaglev-ddrlnit-15b80de81263996affb2a29332aa681925709983.tar.gz
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 59051e7a6d..8943ce9c34 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_BEAGLEV_DDRLNIT=y
+BR2_TARGET_BEAGLEV_DDRINIT=y
 BR2_TARGET_BEAGLEV_SECONDBOOT=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
