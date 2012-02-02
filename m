From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 10:06:44 +0100
Subject: [Buildroot] [git commit] uClibc: tweak 0.9.33 / snapshot configs
Message-ID: <20120202090835.EDA739099E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a4937957148f4d82b35923c55619fe37407d7d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With default values so it doesn't stop build and ask user. Also disable
2.4 modules support by default like upstream does.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.33.config   |    8 +++++++-
 toolchain/uClibc/uClibc-snapshot.config |    8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index a3fe200..2a6754c 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -49,6 +49,7 @@
 # CONFIG_ARM_XSCALE is not set
 # CONFIG_ARM_IWMMXT is not set
 
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 
 TARGET_SUBARCH=""
@@ -93,6 +94,7 @@ LDSO_PRELOAD_ENV_SUPPORT=y
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
+LDSO_LD_LIBRARY_PATH=y
 # LDSO_NO_CLEANUP is not set
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
@@ -139,7 +141,8 @@ UCLIBC_GRP_BUFFER_SIZE=256
 #
 # Support various families of functions
 #
-UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_MODULE_26=y
+# UCLIBC_LINUX_MODULE_24 is not set
 UCLIBC_LINUX_SPECIFIC=y
 UCLIBC_HAS_GNU_ERROR=y
 UCLIBC_BSD_SPECIFIC=y
@@ -154,6 +157,8 @@ UCLIBC_HAS_EPOLL=y
 UCLIBC_HAS_XATTR=y
 UCLIBC_HAS_PROFILING=y
 UCLIBC_HAS_CRYPT_IMPL=y
+# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
+# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
 UCLIBC_HAS_CRYPT=y
 UCLIBC_HAS_NETWORK_SUPPORT=y
 UCLIBC_HAS_SOCKET=y
@@ -205,6 +210,7 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index a3fe200..2a6754c 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -49,6 +49,7 @@
 # CONFIG_ARM_XSCALE is not set
 # CONFIG_ARM_IWMMXT is not set
 
+# COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
 
 TARGET_SUBARCH=""
@@ -93,6 +94,7 @@ LDSO_PRELOAD_ENV_SUPPORT=y
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
+LDSO_LD_LIBRARY_PATH=y
 # LDSO_NO_CLEANUP is not set
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
@@ -139,7 +141,8 @@ UCLIBC_GRP_BUFFER_SIZE=256
 #
 # Support various families of functions
 #
-UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_MODULE_26=y
+# UCLIBC_LINUX_MODULE_24 is not set
 UCLIBC_LINUX_SPECIFIC=y
 UCLIBC_HAS_GNU_ERROR=y
 UCLIBC_BSD_SPECIFIC=y
@@ -154,6 +157,8 @@ UCLIBC_HAS_EPOLL=y
 UCLIBC_HAS_XATTR=y
 UCLIBC_HAS_PROFILING=y
 UCLIBC_HAS_CRYPT_IMPL=y
+# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
+# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
 UCLIBC_HAS_CRYPT=y
 UCLIBC_HAS_NETWORK_SUPPORT=y
 UCLIBC_HAS_SOCKET=y
@@ -205,6 +210,7 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
