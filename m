From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:18:25 +0100
Subject: [Buildroot] [git commit] pdbg: bump to latest upstream version to
 fix build issues
Message-ID: <20171122201733.8B9D28035D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6c9ad52b375c8ae70574b19576c1375ba431e42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This incorporates a fix supplied by Thomas to resolve build issues on
mips and blackfin.

The patch is dropped as it has been applied upstream.

Fixes:

  http://autobuild.buildroot.net/results/829bee459d7c27392b1c55ae3067607434f0b7f0/
  (mips64el)

  http://autobuild.buildroot.net/results/de51ba7e44a138aec877811d77d3d9b95bfce6b2/
  (blackfin)

  http://autobuild.buildroot.net/results/61ec486869b01f5c77e2cec57b60a1d3ca42af79/
  (mipsel)

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...bg-Remove-unused-__unused-from-compiler.h.patch | 39 ----------------------
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch b/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch
deleted file mode 100644
index e778f28..0000000
--- a/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5a85b8c78846b342bdeba37caed03b64b1dd2864 Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Tue, 3 Oct 2017 21:37:46 +1030
-Subject: [PATCH] libpdbg: Remove unused __unused from compiler.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The compiler.h header contains a macro that defines __unused. When
-building against uClibc this collides with uClibc_stdio.h:
-
-In file included from /usr/include/stdio.h:71:0,
-                 from libpdbg/fake.c:17:
-/usr/include/bits/uClibc_stdio.h:149:16: error: expected identifier or ???(??? before ???;??? token
-  void *__unused;    /* Placeholder for codeset binding. */
-                ^
-
-As it is unused in pdbg, remove it.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- libpdbg/compiler.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libpdbg/compiler.h b/libpdbg/compiler.h
-index 35bf16525761..86bd9673ac36 100644
---- a/libpdbg/compiler.h
-+++ b/libpdbg/compiler.h
-@@ -24,7 +24,6 @@
- /* Macros for various compiler bits and pieces */
- #define __packed		__attribute__((packed))
- #define __align(x)		__attribute__((__aligned__(x)))
--#define __unused		__attribute__((unused))
- #define __used			__attribute__((used))
- #define __section(x)		__attribute__((__section__(x)))
- #define __noreturn		__attribute__((noreturn))
--- 
-2.14.1
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 2aec718..6fef128 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e0b81fc65eb83692c5c07d7ae109882cefebf663444b7ea804d0544451c1a72f pdbg-77158819158d1d7053a737ac090d04fdfbfe9265.tar.gz
+sha256 e9143607b0d15693ace9f50b27f931020127a9d605c45f8609f1fe8608be7949  pdbg-527fe54e1c95e031efd3db008c3f4e096cb3ea58.tar.gz
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 70adb0a..f16a392 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 77158819158d1d7053a737ac090d04fdfbfe9265
+PDBG_VERSION = 527fe54e1c95e031efd3db008c3f4e096cb3ea58
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
