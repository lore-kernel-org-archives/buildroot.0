From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 15 May 2013 15:22:20 +0100
Subject: [Buildroot] [PATCH] external-toolchain: Allow MIPS64 for
	Codesourcery MIPS toolchains
Message-ID: <1368627740-4094-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The n64 ABI which is supported by the Codesourcery MIPS toolchains,
is only available with MIPS64 so allow these cores to be selected
and used with these toolchains.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 toolchain/toolchain-external/Config.in |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a93ada3..a13ee31 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -114,7 +114,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	bool "Sourcery CodeBench MIPS 2012.09"
-	depends on BR2_mips || BR2_mipsel
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -129,7 +129,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS64 big endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS32 O32 little endian glibc
@@ -137,7 +137,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
@@ -145,7 +145,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
 	    - MIPS64 big endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	    - MIPS32 little endian soft float glibc
@@ -153,7 +153,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
@@ -184,7 +184,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	bool "Sourcery CodeBench MIPS 2012.03"
-	depends on BR2_mips || BR2_mipsel
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -199,7 +199,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS64 big endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	    - MIPS32 O32 little endian glibc
@@ -207,7 +207,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
@@ -215,7 +215,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
 	    - MIPS64 big endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	    - MIPS32 little endian soft float glibc
@@ -223,7 +223,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
-	      Select a MIPS generic core
+	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -EL
-- 
1.7.1
