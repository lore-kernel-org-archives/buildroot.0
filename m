From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:38:09 -0300
Subject: [Buildroot] [PATCH] uclibc: fix configs for 0.9.32 & snapshot
Message-ID: <1293565090-6483-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* 0.9.32 config needs UCLIBC_HAS___PROGNAME defined or we stall when
  program invocation name is enabled.
* Mirror 0.9.32's config to snapshot for consistency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-0.9.32.config   |    1 +
 toolchain/uClibc/uClibc-snapshot.config |   34 ++++++++++++++++--------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index e599198..9c83d68 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -112,6 +112,7 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+# UCLIBC_HAS___PROGNAME is not set
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index e5d2bea..9c83d68 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -70,6 +70,7 @@ UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
 # DO_XSI_MATH is not set
 # UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
 KERNEL_HEADERS="/usr/src/linux/include"
 HAVE_DOT_CONFIG=y
 
@@ -92,9 +93,9 @@ LDSO_SEARCH_INTERP_PATH=y
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
-# LINUXTHREADS_OLD is not set
+LINUXTHREADS_OLD=y
 # LINUXTHREADS_NEW is not set
-UCLIBC_HAS_THREADS_NATIVE=y
+# UCLIBC_HAS_THREADS_NATIVE is not set
 UCLIBC_HAS_THREADS=y
 # PTHREADS_DEBUG_SUPPORT is not set
 UCLIBC_HAS_SYSLOG=y
@@ -111,6 +112,7 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+# UCLIBC_HAS___PROGNAME is not set
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
@@ -151,10 +153,10 @@ UCLIBC_HAS_CRYPT=y
 UCLIBC_HAS_NETWORK_SUPPORT=y
 UCLIBC_HAS_SOCKET=y
 UCLIBC_HAS_IPV4=y
-UCLIBC_HAS_IPV6=y
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_HAS_FULL_RPC is not set
+# UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
 # UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
@@ -173,13 +175,8 @@ UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
 # UCLIBC_HAS_CTYPE_CHECKED is not set
 UCLIBC_HAS_CTYPE_ENFORCED=y
-UCLIBC_HAS_WCHAR=y
-UCLIBC_HAS_LOCALE=y
-# UCLIBC_BUILD_ALL_LOCALE is not set
-UCLIBC_BUILD_MINIMAL_LOCALE=y
-# UCLIBC_PREGENERATED_LOCALE_DATA is not set
-UCLIBC_BUILD_MINIMAL_LOCALES="en_US"
-UCLIBC_HAS_XLOCALE=y
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 # UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
@@ -219,8 +216,8 @@ UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
 # UCLIBC_HAS_WORDEXP is not set
-# UCLIBC_HAS_NFTW is not set
-# UCLIBC_HAS_FTW is not set
+UCLIBC_HAS_NFTW=y
+UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 # UCLIBC_HAS_UTMPX is not set
@@ -239,7 +236,12 @@ HARDWIRED_ABSPATH=y
 # UCLIBC_BUILD_PIE is not set
 # UCLIBC_HAS_ARC4RANDOM is not set
 # HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
+UCLIBC_HAS_SSP=y
+# UCLIBC_HAS_SSP_COMPAT is not set
+# SSP_QUICK_CANARY is not set
+PROPOLICE_BLOCK_ABRT=y
+# PROPOLICE_BLOCK_SEGV is not set
+# UCLIBC_BUILD_SSP is not set
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
 UCLIBC_BUILD_NOEXECSTACK=y
-- 
1.7.2.2
