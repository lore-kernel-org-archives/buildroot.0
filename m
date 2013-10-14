From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 14 Oct 2013 10:52:25 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct endianness
	for the target
Message-ID: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, an external-toolchain on a mipsel/mips64el target
didn't select the appriopriate endianness but
it asked the user to set the correct CFLAGS on his/her own.
We fix this by appending "-EL" to the toolchain wrapper options
if the user has selected a mipsel/mips64el target.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 toolchain/toolchain-external/Config.in             | 24 ++++++----------------
 .../toolchain-external/ext-toolchain-wrapper.c     |  3 +++
 toolchain/toolchain-external/toolchain-external.mk |  7 ++++++-
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0d42041..6674b3d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -213,12 +213,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -229,12 +227,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS64 generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -242,7 +238,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -250,7 +246,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
@@ -284,12 +280,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -300,12 +294,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -313,7 +305,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -321,7 +313,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
@@ -355,12 +347,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 O32 little endian glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -371,12 +361,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS64 little endian soft float glibc
 	      Select a MIPS generic core
 	      Select the n64 ABI
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL
 	    - MIPS32 big endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
@@ -384,7 +372,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian microMIPS glibc
 	      Select a MIPS generic core
 	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
@@ -392,7 +380,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	    - MIPS32 little endian soft float microMIPS glibc
 	      Select a MIPS generic core
 	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
 	    - MIPS32 big endian uclibc
 	      Not usable in Buildroot yet.
 	    - MIPS32 little endian uclibc
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 727e322..fdfa29c 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -63,6 +63,9 @@ static char *predef_args[] = {
 #ifdef BR_BINFMT_FLAT
 	"-Wl,-elf2flt",
 #endif
+#ifdef BR_MIPS_TARGET_LITTLE_ENDIAN
+	"-EL",
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b5b1ce7..073e38a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -207,7 +207,12 @@ ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_BINFMT_FLAT
 endif
-
+ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
+ifeq ($(BR2_ENDIAN),"LITTLE")
+TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
+TOOLCHAIN_EXTERNAL_CFLAGS += -EL
+endif
+endif
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
-- 
1.8.3.2
