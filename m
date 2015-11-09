From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Nov 2015 17:32:10 +0000
Subject: [Buildroot] [PATCH v3 3/3] toolchain/external: Codescape toolchains
	also exist for x86_64
In-Reply-To: <1447090330-28133-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1447090330-28133-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1447090330-28133-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@free.fr>

Since their prefix exactly matches our $(HOSTARCH), just use that.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - No changes.

 toolchain/toolchain-external/Config.in             |    2 --
 .../toolchain-external/toolchain-external.hash     |    2 ++
 toolchain/toolchain-external/toolchain-external.mk |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 127d407..2f5a5a1 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -244,7 +244,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
 	depends on BR2_mips_32r2 || BR2_mips_64r2
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
@@ -295,7 +294,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506
 	depends on BR2_mips_32r6 || BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index e88e4b5..a374d38 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -59,7 +59,9 @@ sha256 b9137008744d9009877f662dbac7481d673cdcb1798e727e325a37c98a0f63da  gcc-lin
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
 sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+sha256 645d0dcac30632901dce5dc0eca69c436711f70f393e72e52f3fb78b76b581ff  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz
 sha256 545923cf40101b5de6b1e0fdf124aceba7ab27daf6c755aecf01d2c886715409  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+sha256 46bb29610b6105b95734cdd573a258371dd3722ffba0e7b264ae7679406a60b3  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86_64.tar.gz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index dc91911..4c13941 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -343,11 +343,11 @@ endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.$(HOSTARCH).tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.$(HOSTARCH).tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-- 
1.7.1
