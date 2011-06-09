From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 12:26:28 +0200
Subject: [Buildroot] [git commit] uClibc: bump 0.9.32 version, use as default
Message-ID: <20110609105206.1029A85AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=339687aa2e27e95e8e98d25f3e73f98d291e2b4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in                         |    6 +++---
 ... => uClibc-0.9.32-linuxthreads-errno-fix.patch} |    0
 toolchain/uClibc/uClibc-0.9.32.config              |    2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename toolchain/uClibc/{uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch => uClibc-0.9.32-linuxthreads-errno-fix.patch} (100%)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 36b18a7..7f0f875 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_31
+	default BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -21,7 +21,7 @@ choice
 		bool "uClibc 0.9.31.x"
 
 	config BR2_UCLIBC_VERSION_0_9_32
-		bool "uClibc 0.9.32-rc3"
+		bool "uClibc 0.9.32.x"
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
@@ -40,7 +40,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30.3	if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
-	default 0.9.32-rc3	if BR2_UCLIBC_VERSION_0_9_32
+	default 0.9.32		if BR2_UCLIBC_VERSION_0_9_32
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch
rename to toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/toolchain/uClibc/uClibc-0.9.32.config
index aa00680..5a7b52a 100644
--- a/toolchain/uClibc/uClibc-0.9.32.config
+++ b/toolchain/uClibc/uClibc-0.9.32.config
@@ -220,6 +220,7 @@ UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
+UCLIBC_HAS_FTS=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 # UCLIBC_HAS_UTMPX is not set
@@ -260,6 +261,7 @@ DOSTRIP=y
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 # UCLIBC_MALLOC_DEBUGGING is not set
+# UCLIBC_HAS_BACKTRACE is not set
 WARNINGS="-Wall"
 # EXTRA_WARNINGS is not set
 # DOMULTI is not set
-- 
1.7.3.4
