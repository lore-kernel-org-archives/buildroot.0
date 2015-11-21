From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:15 +0100
Subject: [Buildroot] [PATCH 2/7] toolchain-external: bump CodeSourcery AMD64
	to 2015.11
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1448123780-30067-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a stronger hash.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/Config.in               | 12 ++++++------
 toolchain/toolchain-external/toolchain-external.hash |  6 ++----
 toolchain/toolchain-external/toolchain-external.mk   |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1a08085..523e773 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -693,7 +693,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	      Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	bool "Sourcery CodeBench AMD64 2014.05"
+	bool "Sourcery CodeBench AMD64 2015.11"
 	depends on BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -702,13 +702,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
-	  architectures, from Mentor Graphics. It uses gcc 4.8.3,
-	  binutils 2.24.51, glibc 2.18, gdb 7.7.50 and kernel headers
-	  3.13.0. It has support for the following variants:
+	  architectures, from Mentor Graphics. It uses gcc 5.2,
+	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
+	  4.2. It has support for the following variants:
 	    - AMD Puma/Jaguar (family 16h), glibc
 	    Default for x86_64, nothing special to do.
 	    - AMD Steamroller (family 15h), glibc
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 2d41389..8a3e85b 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -6,10 +6,6 @@ md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-li
 # From: https://sourcery.mentor.com/GNUToolchain/release2791
 md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
-# Sourcery CodeBench Lite for AMD64
-# From https://sourcery.mentor.com/GNUToolchain/release2777
-md5	a1f8650d1a5ff726cca0893522fd8745	amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-
 ######################################
 # Next hashes are all locally computed
 
@@ -41,6 +37,8 @@ sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas
 sha256 5f308a3fe0752f181fd0d33a70a17efb8300d0e34a94ed18a1a0304dc18e150e  ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 6ac2f0d9ec56242ecbe4315533f3e00a675909850a41bdafc052fbfe27ece300  ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+# AMD64
+sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # Aarch64
 sha256 8ea78c5988b2bb507534f1ad46aa46659f66b39d55f2fc40e163a90b4195e70f  aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8176370..d7788eb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -387,7 +387,7 @@ TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = amd-2014.05-25-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
-- 
2.4.3
