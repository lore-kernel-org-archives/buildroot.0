From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 07:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] Update uclibc snapshot config
	to avoid build breakage
Message-ID: <20101119080414.D14E88D303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=799a4c307e9b01fc7a05f66211de1b7aa239dde3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-snapshot.config |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 43dc3cd..bc3074e 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -107,7 +107,7 @@ UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV3_LEGACY=y
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
-# UCLIBC_SUSV4_LEGACY is not set
+UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
@@ -115,7 +115,7 @@ UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
 UCLIBC_HAS_GETPT=y
-# UCLIBC_HAS_LIBUTIL is not set
+UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
@@ -160,8 +160,8 @@ UCLIBC_USE_NETLINK=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 UCLIBC_HAS_COMPAT_RES_STATE=y
 # UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
-# UCLIBC_HAS_LIBRESOLV_STUB is not set
-# UCLIBC_HAS_LIBNSL_STUB is not set
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
 
 #
 # String and Stdio Support
@@ -219,6 +219,7 @@ UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
 # UCLIBC_HAS_WORDEXP is not set
 # UCLIBC_HAS_NFTW is not set
+# UCLIBC_HAS_FTW is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 # UCLIBC_HAS_UTMPX is not set
-- 
1.7.2.2
