From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:56 -0300
Subject: [Buildroot] [PATCH 31/36] toolchain/{*/Config.in,
 *.in}: re-wrap help text
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-32-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 toolchain/toolchain-common.in                                 | 10 ++++++----
 toolchain/toolchain-external/Config.in                        | 11 ++++++-----
 .../toolchain-external-codescape-img-mips/Config.in           |  6 ++++--
 .../toolchain-external-codescape-mti-mips/Config.in           |  6 ++++--
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 8941e0f3cd..6b07fb88ae 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -65,7 +65,8 @@ config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
 	  The gconv libraries are used to convert between different
 	  character sets (charsets).
 
-	  Say 'y' if you need to store and/or display different charsets.
+	  Say 'y' if you need to store and/or display different
+	  charsets.
 
 config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
 	string "Gconv libraries to copy"
@@ -103,10 +104,11 @@ config BR2_TARGET_OPTIMIZATION
 config BR2_TARGET_LDFLAGS
 	string "Target linker options"
 	help
-	  Extra options to pass to the linker when building for the target.
+	  Extra options to pass to the linker when building for the
+	  target.
 
-	  Note that options with a '$' sign (eg. -Wl,-rpath='$ORIGIN/../lib')
-	  are not supported.
+	  Note that options with a '$' sign (eg.
+	  -Wl,-rpath='$ORIGIN/../lib') are not supported.
 
 config BR2_ECLIPSE_REGISTER
 	bool "Register toolchain within Eclipse Buildroot plug-in"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c4063b177b..6759e5cefa 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -53,15 +53,16 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 	bool "Toolchain to be downloaded and installed"
 	help
-	  Select this option if you want Buildroot to download and install the
-	  toolchain. If you have selected a custom toolchain, specify the URL
-	  in BR2_TOOLCHAIN_EXTERNAL_URL.
+	  Select this option if you want Buildroot to download and
+	  install the toolchain. If you have selected a custom
+	  toolchain, specify the URL in BR2_TOOLCHAIN_EXTERNAL_URL.
 
 config BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
 	bool "Pre-installed toolchain"
 	help
-	  Select this option if you want to use a pre-installed toolchain.
-	  Specify the path to this toolchain in BR2_TOOLCHAIN_EXTERNAL_PATH.
+	  Select this option if you want to use a pre-installed
+	  toolchain. Specify the path to this toolchain in
+	  BR2_TOOLCHAIN_EXTERNAL_PATH.
 
 endchoice
 
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 8b2eab0ad2..2bfa567672 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -30,12 +30,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
 	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
+	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
+	      microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
 	      Disable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI, microMIPS
+	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI,
+	      microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
 	      Enable 'Use soft-float'
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index db191fd1be..5d466a58f4 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -41,12 +41,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
 	      Enable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
+	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
+	      microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
 	      Enable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI, microMIPS
+	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI,
+	      microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
 	      Disable 'Use soft-float'
-- 
2.14.1
