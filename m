From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 19:27:09 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: bumpimg default GCC
	version to 4.6.3
Message-ID: <20121209203933.44D7B9A158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c22945d7560c4a5cf184441b8bba7e48c5d099e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps the GCC version from 4.4.6 to 4.6.3 to for
*.config-eglibc
*.config-glibc
*.config-uClibc
be equal to the default GCC setting in buildroot as well in addition to
commit b855154ee8683e87afa08c6cc50b716d22879922.

Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng.config-eglibc                     |   26 ++++++++++++++++----
 .../crosstool-ng.config-glibc                      |   26 ++++++++++++++++----
 .../crosstool-ng.config-uClibc                     |   26 ++++++++++++++++----
 3 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 1b523ec..11eb602 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # crosstool-NG 1.17.0 Configuration
-# Mon Dec  3 20:10:26 2012
+# Sat Dec  8 12:57:07 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_svn=y
@@ -265,10 +265,10 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
-# CT_CC_V_4_6_3 is not set
+CT_CC_V_4_6_3=y
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
 # CT_CC_V_4_6_0 is not set
@@ -277,7 +277,7 @@ CT_CC_gcc=y
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
 # CT_CC_V_4_4_7 is not set
-CT_CC_V_4_4_6=y
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 # CT_CC_V_4_4_3 is not set
@@ -294,12 +294,18 @@ CT_CC_V_4_4_6=y
 # CT_CC_V_4_2_2 is not set
 CT_CC_GCC_4_2_or_later=y
 CT_CC_GCC_4_3_or_later=y
-CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+CT_CC_GCC_4_5_or_later=y
+CT_CC_GCC_4_6=y
+CT_CC_GCC_4_6_or_later=y
 CT_CC_GCC_HAS_GRAPHITE=y
+CT_CC_GCC_HAS_LTO=y
 CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
+CT_CC_GCC_HAS_BUILD_ID=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
+CT_CC_GCC_USE_MPC=y
+CT_CC_GCC_HAS_LIBQUADMATH=y
 # CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
@@ -326,6 +332,7 @@ CT_CC_STATIC_LIBSTDCXX=y
 # Optimisation features
 #
 CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_GCC_USE_LTO=y
 
 #
 # Settings for libraries running on target
@@ -334,6 +341,7 @@ CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
+# CT_CC_GCC_LIBQUADMATH is not set
 
 #
 # Misc. obscure options.
@@ -342,6 +350,7 @@ CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
 CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
+# CT_CC_GCC_BUILD_ID is not set
 
 #
 # C-library
@@ -445,11 +454,13 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
+CT_MPC_NEEDED=y
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+CT_MPC=y
 # CT_GMP_V_5_0_2 is not set
 # CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
@@ -475,6 +486,11 @@ CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
 CT_CLOOG_VERSION="0.15.9"
+CT_MPC_V_0_9=y
+# CT_MPC_V_0_8_2 is not set
+# CT_MPC_V_0_8_1 is not set
+# CT_MPC_V_0_7 is not set
+CT_MPC_VERSION="0.9"
 
 #
 # Companion libraries common options
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 026c7fd..c30a115 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # crosstool-NG 1.17.0 Configuration
-# Mon Dec  3 20:16:52 2012
+# Sat Dec  8 12:56:02 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_svn=y
@@ -265,10 +265,10 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
-# CT_CC_V_4_6_3 is not set
+CT_CC_V_4_6_3=y
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
 # CT_CC_V_4_6_0 is not set
@@ -277,7 +277,7 @@ CT_CC_gcc=y
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
 # CT_CC_V_4_4_7 is not set
-CT_CC_V_4_4_6=y
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 # CT_CC_V_4_4_3 is not set
@@ -294,12 +294,18 @@ CT_CC_V_4_4_6=y
 # CT_CC_V_4_2_2 is not set
 CT_CC_GCC_4_2_or_later=y
 CT_CC_GCC_4_3_or_later=y
-CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+CT_CC_GCC_4_5_or_later=y
+CT_CC_GCC_4_6=y
+CT_CC_GCC_4_6_or_later=y
 CT_CC_GCC_HAS_GRAPHITE=y
+CT_CC_GCC_HAS_LTO=y
 CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
+CT_CC_GCC_HAS_BUILD_ID=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
+CT_CC_GCC_USE_MPC=y
+CT_CC_GCC_HAS_LIBQUADMATH=y
 # CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
@@ -326,6 +332,7 @@ CT_CC_STATIC_LIBSTDCXX=y
 # Optimisation features
 #
 CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_GCC_USE_LTO=y
 
 #
 # Settings for libraries running on target
@@ -334,6 +341,7 @@ CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
+# CT_CC_GCC_LIBQUADMATH is not set
 
 #
 # Misc. obscure options.
@@ -342,6 +350,7 @@ CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
 CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
+# CT_CC_GCC_BUILD_ID is not set
 
 #
 # C-library
@@ -434,11 +443,13 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
+CT_MPC_NEEDED=y
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+CT_MPC=y
 # CT_GMP_V_5_0_2 is not set
 # CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
@@ -464,6 +475,11 @@ CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
 CT_CLOOG_VERSION="0.15.9"
+CT_MPC_V_0_9=y
+# CT_MPC_V_0_8_2 is not set
+# CT_MPC_V_0_8_1 is not set
+# CT_MPC_V_0_7 is not set
+CT_MPC_VERSION="0.9"
 
 #
 # Companion libraries common options
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index 8ad481f..e93128b 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # crosstool-NG 1.17.0 Configuration
-# Mon Dec  3 20:17:58 2012
+# Sat Dec  8 12:50:22 2012
 #
 CT_CONFIGURE_has_xz=y
 CT_CONFIGURE_has_svn=y
@@ -264,10 +264,10 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 # C compiler
 #
 CT_CC="gcc"
-CT_CC_VERSION="4.4.6"
+CT_CC_VERSION="4.6.3"
 CT_CC_gcc=y
 # CT_CC_V_4_7_2 is not set
-# CT_CC_V_4_6_3 is not set
+CT_CC_V_4_6_3=y
 # CT_CC_V_4_6_2 is not set
 # CT_CC_V_4_6_1 is not set
 # CT_CC_V_4_6_0 is not set
@@ -276,7 +276,7 @@ CT_CC_gcc=y
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
 # CT_CC_V_4_4_7 is not set
-CT_CC_V_4_4_6=y
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 # CT_CC_V_4_4_3 is not set
@@ -293,12 +293,18 @@ CT_CC_V_4_4_6=y
 # CT_CC_V_4_2_2 is not set
 CT_CC_GCC_4_2_or_later=y
 CT_CC_GCC_4_3_or_later=y
-CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+CT_CC_GCC_4_5_or_later=y
+CT_CC_GCC_4_6=y
+CT_CC_GCC_4_6_or_later=y
 CT_CC_GCC_HAS_GRAPHITE=y
+CT_CC_GCC_HAS_LTO=y
 CT_CC_GCC_HAS_PKGVERSION_BUGURL=y
+CT_CC_GCC_HAS_BUILD_ID=y
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
+CT_CC_GCC_USE_MPC=y
+CT_CC_GCC_HAS_LIBQUADMATH=y
 # CT_CC_LANG_FORTRAN is not set
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
@@ -325,6 +331,7 @@ CT_CC_STATIC_LIBSTDCXX=y
 # Optimisation features
 #
 CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_GCC_USE_LTO=y
 
 #
 # Settings for libraries running on target
@@ -333,6 +340,7 @@ CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
+# CT_CC_GCC_LIBQUADMATH is not set
 
 #
 # Misc. obscure options.
@@ -341,6 +349,7 @@ CT_CC_CXA_ATEXIT=y
 # CT_CC_GCC_DISABLE_PCH is not set
 CT_CC_GCC_SJLJ_EXCEPTIONS=m
 CT_CC_GCC_LDBL_128=m
+# CT_CC_GCC_BUILD_ID is not set
 
 #
 # C-library
@@ -416,11 +425,13 @@ CT_GMP_NEEDED=y
 CT_MPFR_NEEDED=y
 CT_PPL_NEEDED=y
 CT_CLOOG_NEEDED=y
+CT_MPC_NEEDED=y
 CT_COMPLIBS=y
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
 CT_CLOOG=y
+CT_MPC=y
 # CT_GMP_V_5_0_2 is not set
 # CT_GMP_V_5_0_1 is not set
 CT_GMP_V_4_3_2=y
@@ -446,6 +457,11 @@ CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_7 is not set
 # CT_CLOOG_V_0_15_6 is not set
 CT_CLOOG_VERSION="0.15.9"
+CT_MPC_V_0_9=y
+# CT_MPC_V_0_8_2 is not set
+# CT_MPC_V_0_8_1 is not set
+# CT_MPC_V_0_7 is not set
+CT_MPC_VERSION="0.9"
 
 #
 # Companion libraries common options
