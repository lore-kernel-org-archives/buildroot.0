From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 14:47:42 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump Codescape
	toolchains to 2016.05
Message-ID: <20160704125233.03CE980109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddf286736f86defbbb44c2059fce1d95c2296f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in               | 6 ++++--
 toolchain/toolchain-external/toolchain-external.hash | 6 +++---
 toolchain/toolchain-external/toolchain-external.mk   | 8 ++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2ac7f30..16b877a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -280,7 +280,7 @@ comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 an
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2015.10"
+	bool "Codescape IMG GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_mips_32r6 || (BR2_mips_64r6 && !BR2_MIPS_SOFT_FLOAT)
@@ -289,6 +289,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
@@ -342,7 +343,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	      Disable 'Use soft-float'
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	bool "Codescape MTI GNU Linux Toolchain 2015.10"
+	bool "Codescape MTI GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_mips_32r2 || (BR2_mips_64r2 && !BR2_MIPS_SOFT_FLOAT)
@@ -351,6 +352,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index fe45f19..9d74cb7 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -46,9 +46,9 @@ sha256 a7b8f842fdc9d9be22ca4e0c999429780fc6f16ea798b032421b5ec0cfa53b3e  gcc-lin
 sha256 1c85af550bedd378be583317b4abbdc96342b42c19fb19873c13d3093ff694ad  gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04/
-sha256 9222d7b08b908ce0d5fa80a3623f8c51251be51af02629600b89693f09f566c8  Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-sha256 6eca906933424146e2059641a2ec85f1b163c1a3942a31c39472aba5a3f116be  Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
+sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+sha256 10b8ab6d7c492abc19ecabafedc6bc5f12ff88107a3cb76dc452b3a9522d9c56  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e675045..a31a04b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -370,14 +370,14 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
