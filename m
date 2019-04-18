From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 18 Apr 2019 17:46:55 +0800
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix build error due to
 architecture name is incomplete
Message-ID: <20190418094655.6526-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
  http://autobuild.buildroot.net/results/128/12803a705586e82fdfb49013da2eb3b9879ccd45/

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 Makefile                   | 1 +
 arch/Config.in.nds32       | 2 +-
 package/binutils/Config.in | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 522c0b0606..86e444da98 100644
--- a/Makefile
+++ b/Makefile
@@ -439,6 +439,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/arceb/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64.*/arm64/ \
+	-e s/nds32.*/nds32/ \
 	-e s/or1k/openrisc/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64.*/powerpc/ \
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
index 9c5db20e6f..f268883662 100644
--- a/arch/Config.in.nds32
+++ b/arch/Config.in.nds32
@@ -1,5 +1,5 @@
 config BR2_ARCH
-	default "nds32"
+	default "nds32le"
 
 config BR2_GCC_TARGET_ARCH
 	default "v3"
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 2bf7929ac8..e17a8ec65a 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	depends on !BR2_nios2 && !BR2_nds32
+	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
@@ -21,5 +21,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 endif
 
 comment "binutils needs a toolchain w/ wchar"
-	depends on !BR2_nios2 && !BR2_nds32
+	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR
-- 
2.18.0
