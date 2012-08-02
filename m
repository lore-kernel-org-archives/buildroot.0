From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:43 -0000
Subject: [Buildroot] [git commit branch/next] uClibc: bump 0.9.33.x stable
	version
Message-ID: <20120802195231.EACF396EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=362256a31e72691cf46e8b83c549d7a3ab2329fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in                         |    2 +-
 ...33.1-mmap64-include-stdint.h-for-uint64_t.patch |   28 --------------------
 toolchain/uClibc/uClibc-0.9.33.1-version.patch     |   23 ----------------
 ... uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch} |    0
 ....33.1-dup3.patch => uClibc-0.9.33.2-dup3.patch} |    0
 5 files changed, 1 insertions(+), 52 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 160ead4..d8b8a2a 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -37,7 +37,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
-	default 0.9.33.1	if BR2_UCLIBC_VERSION_0_9_33
+	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch b/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch
deleted file mode 100644
index 8b08a2c..0000000
--- a/toolchain/uClibc/uClibc-0.9.33.1-mmap64-include-stdint.h-for-uint64_t.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 47009e1e1c6b721c38b5ffa2eeb9202fb8db298a Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Wed, 11 Apr 2012 16:01:29 -0400
-Subject: [PATCH 1/2] mmap64: include stdint.h for uint64_t
-
-Some targets include this implicitly, but pull it in explicitly for those
-which don't to fix building for them.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- libc/sysdeps/linux/common/mmap64.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/mmap64.c b/libc/sysdeps/linux/common/mmap64.c
-index 3c97c84..cebf961 100644
---- a/libc/sysdeps/linux/common/mmap64.c
-+++ b/libc/sysdeps/linux/common/mmap64.c
-@@ -10,6 +10,7 @@
- #ifdef __UCLIBC_HAS_LFS__
- 
- #include <errno.h>
-+#include <stdint.h>
- #include <unistd.h>
- #include <sys/mman.h>
- #include <sys/syscall.h>
--- 
-1.7.3.4
-
diff --git a/toolchain/uClibc/uClibc-0.9.33.1-version.patch b/toolchain/uClibc/uClibc-0.9.33.1-version.patch
deleted file mode 100644
index 37f8565..0000000
--- a/toolchain/uClibc/uClibc-0.9.33.1-version.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[PATCH] fix version number
-
-Somehow the 0.9.33.1 tarball thinks it is 0.9.33.2-git, as pointed out
-by Mike Frysinger.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Rules.mak |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: uClibc-0.9.33.1/Rules.mak
-===================================================================
---- uClibc-0.9.33.1.orig/Rules.mak
-+++ uClibc-0.9.33.1/Rules.mak
-@@ -105,7 +105,7 @@
- MAJOR_VERSION := 0
- MINOR_VERSION := 9
- SUBLEVEL      := 33
--EXTRAVERSION  :=.2-git
-+EXTRAVERSION  :=.1
- VERSION       := $(MAJOR_VERSION).$(MINOR_VERSION).$(SUBLEVEL)
- ABI_VERSION   := $(MAJOR_VERSION)
- ifneq ($(EXTRAVERSION),)
diff --git a/toolchain/uClibc/uClibc-0.9.33.1-define-MSG_CMSG_CLOEXEC.patch b/toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.1-define-MSG_CMSG_CLOEXEC.patch
rename to toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.1-dup3.patch b/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.1-dup3.patch
rename to toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
