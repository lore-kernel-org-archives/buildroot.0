From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 22:22:56 +1300
Subject: [Buildroot] [git commit] toolchain-external: bump CodeSourcery
	AMD64 to 2016.11-19
Message-ID: <20170127092308.70F67801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae84d5633101fef22f58bf8fc6c1783d97265621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-codesourcery-amd64/Config.in          | 12 ++++++------
 .../toolchain-external-codesourcery-amd64.hash               |  4 ++--
 .../toolchain-external-codesourcery-amd64.mk                 |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
index 86486c8..32d79eb 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	bool "Sourcery CodeBench AMD64 2015.11"
+	bool "Sourcery CodeBench AMD64 2016.11"
 	depends on BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -9,13 +9,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
-	  architectures, from Mentor Graphics. It uses gcc 5.2,
-	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
-	  4.2. It has support for the following variants:
+	  architectures, from Mentor Graphics. It uses gcc 6.2,
+	  binutils 2.26, glibc 2.24, gdb 7.11 and kernel headers
+	  4.7. It has support for the following variants:
 	    - AMD Puma/Jaguar (family 16h), glibc
 	    Default for x86_64, nothing special to do.
 	    - AMD Steamroller (family 15h), glibc
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
index ea5f300..291e6a5 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
+sha256 a6c23837dd45a33866c60a2fd8d7af40520cd84ff1059abda797952d7ee0fafd  amd-2016.11-19-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 d61ce0b5648ad63cca16fe233c82e7eaa6a3212a549d69a527e7a2d5350f7b4a  amd-2016.11-19-x86_64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
index 4b8e31c..1697e5e 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION = 2015.11-139
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION = 2016.11-19
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SOURCE = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_ACTUAL_SOURCE_TARBALL = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
 
