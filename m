From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Nov 2018 17:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] libnspr: bump to version 4.20
Message-ID: <20181110161511.5630-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for riscv was added in this version

Fixes:
 - http://autobuild.buildroot.org/results/a98db13ea105d627f2a4770969b31550926c2791

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnspr/0001-nios2.patch      | 8 +++++---
 package/libnspr/0002-microblaze.patch | 8 +++++---
 package/libnspr/libnspr.hash          | 4 ++--
 package/libnspr/libnspr.mk            | 2 +-
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
index e10e7e9a66..c08fbb272b 100644
--- a/package/libnspr/0001-nios2.patch
+++ b/package/libnspr/0001-nios2.patch
@@ -2,6 +2,8 @@ Add Nios-II support
 
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+[Fabrice: update for nspr 4.20]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 Index: b/nspr/pr/include/md/_linux.cfg
 ===================================================================
@@ -64,9 +66,9 @@ Index: b/nspr/pr/include/md/_linux.h
 --- a/nspr/pr/include/md/_linux.h
 +++ b/nspr/pr/include/md/_linux.h
 @@ -57,6 +57,8 @@
- #define _PR_SI_ARCHITECTURE "m32r"
- #elif defined(__or1k__)
- #define _PR_SI_ARCHITECTURE "or1k"
+ #define _PR_SI_ARCHITECTURE "riscv32"
+ #elif defined(__riscv) && (__riscv_xlen == 64)
+ #define _PR_SI_ARCHITECTURE "riscv64"
 +#elif defined(__nios2__)
 +#define _PR_SI_ARCHITECTURE "nios2"
  #else
diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
index 7cf1f0dfac..46a4485277 100644
--- a/package/libnspr/0002-microblaze.patch
+++ b/package/libnspr/0002-microblaze.patch
@@ -2,6 +2,8 @@ Add Microblaze support
 
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+[Fabrice: update for nspr 4.20]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 Index: b/nspr/pr/include/md/_linux.cfg
 ===================================================================
@@ -69,9 +71,9 @@ Index: b/nspr/pr/include/md/_linux.h
 --- a/nspr/pr/include/md/_linux.h
 +++ b/nspr/pr/include/md/_linux.h
 @@ -57,6 +57,8 @@
- #define _PR_SI_ARCHITECTURE "m32r"
- #elif defined(__or1k__)
- #define _PR_SI_ARCHITECTURE "or1k"
+ #define _PR_SI_ARCHITECTURE "riscv32"
+ #elif defined(__riscv) && (__riscv_xlen == 64)
+ #define _PR_SI_ARCHITECTURE "riscv64"
 +#elif defined(__microblaze__)
 +#define _PR_SI_ARCHITECTURE "microblaze"
  #elif defined(__nios2__)
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 3067afd720..33710b65a9 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.19/src/SHA256SUMS
-sha256	2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729  nspr-4.19.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
+sha256	2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e  nspr-4.20.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index d91393f6e8..763c5393b0 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.19
+LIBNSPR_VERSION = 4.20
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.17.1
