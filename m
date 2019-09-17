From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:36:47 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libnspr: bump to
 version 4.22
Message-ID: <20190917203626.12BB98EA38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dda7c60958ed815f500ea81c94f6681a63ec039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Rework all 3 patches to make that applicable to 4.22 version.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 385b5686a03f9abc8de3f7ad46cdfc624418df66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/0001-nios2.patch      | 30 +++++++++++++++---------------
 package/libnspr/0002-microblaze.patch | 32 ++++++++++++++++----------------
 package/libnspr/0003-nds32.patch      | 33 ++++++++++++++++-----------------
 package/libnspr/libnspr.hash          |  2 +-
 package/libnspr/libnspr.mk            |  2 +-
 5 files changed, 49 insertions(+), 50 deletions(-)

diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
index 2a967c4593..52fbbfdddd 100644
--- a/package/libnspr/0001-nios2.patch
+++ b/package/libnspr/0001-nios2.patch
@@ -1,17 +1,18 @@
-Add Nios-II support
+Bug 1578360 - Add Nios-II support
 
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 [Fabrice: update for nspr 4.20]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Giulio: update for nspr 4.22]
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 
-Index: b/nspr/pr/include/md/_linux.cfg
-===================================================================
---- a/nspr/pr/include/md/_linux.cfg
-+++ b/nspr/pr/include/md/_linux.cfg
-@@ -1112,6 +1112,51 @@
- #define PR_BYTES_PER_WORD_LOG2  3
- #define PR_BYTES_PER_DWORD_LOG2 3
+diff -r 3af4891397ab -r 8487beb203e9 nspr/pr/include/md/_linux.cfg
+--- a/nspr/pr/include/md/_linux.cfg	Mon Aug 19 16:17:52 2019 +0200
++++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:25:11 2019 +0200
+@@ -1157,6 +1157,51 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
  
 +#elif defined(__nios2__)
 +
@@ -61,14 +62,13 @@ Index: b/nspr/pr/include/md/_linux.cfg
  #else
  
  #error "Unknown CPU architecture"
-Index: b/nspr/pr/include/md/_linux.h
-===================================================================
---- a/nspr/pr/include/md/_linux.h
-+++ b/nspr/pr/include/md/_linux.h
-@@ -57,6 +57,8 @@
- #define _PR_SI_ARCHITECTURE "riscv32"
- #elif defined(__riscv) && (__riscv_xlen == 64)
+diff -r 3af4891397ab -r 8487beb203e9 nspr/pr/include/md/_linux.h
+--- a/nspr/pr/include/md/_linux.h	Mon Aug 19 16:17:52 2019 +0200
++++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:25:11 2019 +0200
+@@ -63,6 +63,8 @@
  #define _PR_SI_ARCHITECTURE "riscv64"
+ #elif defined(__arc__)
+ #define _PR_SI_ARCHITECTURE "arc"
 +#elif defined(__nios2__)
 +#define _PR_SI_ARCHITECTURE "nios2"
  #else
diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
index 4c23259d58..6558882bd7 100644
--- a/package/libnspr/0002-microblaze.patch
+++ b/package/libnspr/0002-microblaze.patch
@@ -1,15 +1,16 @@
-Add Microblaze support
+Bug 1578363 - Add Microblaze support
 
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 [Fabrice: update for nspr 4.20]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Giulio: update for nspr 4.22]
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 
-Index: b/nspr/pr/include/md/_linux.cfg
-===================================================================
---- a/nspr/pr/include/md/_linux.cfg
-+++ b/nspr/pr/include/md/_linux.cfg
-@@ -1157,6 +1157,56 @@
+diff -r 8487beb203e9 -r ab7d5c504daf nspr/pr/include/md/_linux.cfg
+--- a/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:25:11 2019 +0200
++++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:33:15 2019 +0200
+@@ -1202,6 +1202,56 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
@@ -66,16 +67,15 @@ Index: b/nspr/pr/include/md/_linux.cfg
  #else
  
  #error "Unknown CPU architecture"
-Index: b/nspr/pr/include/md/_linux.h
-===================================================================
---- a/nspr/pr/include/md/_linux.h
-+++ b/nspr/pr/include/md/_linux.h
-@@ -57,6 +57,8 @@
- #define _PR_SI_ARCHITECTURE "riscv32"
- #elif defined(__riscv) && (__riscv_xlen == 64)
- #define _PR_SI_ARCHITECTURE "riscv64"
-+#elif defined(__microblaze__)
-+#define _PR_SI_ARCHITECTURE "microblaze"
+diff -r 8487beb203e9 -r ab7d5c504daf nspr/pr/include/md/_linux.h
+--- a/nspr/pr/include/md/_linux.h	Tue Sep 03 11:25:11 2019 +0200
++++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:33:15 2019 +0200
+@@ -65,6 +65,8 @@
+ #define _PR_SI_ARCHITECTURE "arc"
  #elif defined(__nios2__)
  #define _PR_SI_ARCHITECTURE "nios2"
++#elif defined(__microblaze__)
++#define _PR_SI_ARCHITECTURE "microblaze"
  #else
+ #error "Unknown CPU architecture"
+ #endif
diff --git a/package/libnspr/0003-nds32.patch b/package/libnspr/0003-nds32.patch
index 3b67a3f787..49d0d81aca 100644
--- a/package/libnspr/0003-nds32.patch
+++ b/package/libnspr/0003-nds32.patch
@@ -1,15 +1,16 @@
-Add nds32 support
+Bug 1578364 - Add Nds32 support
 
-Signed-off-by:Nylon Chen <nylon7@andestech.com>
+Signed-off-by: Nylon Chen <nylon7@andestech.com>
+[Giulio: update for nspr 4.22]
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 
-Index: b/nspr/pr/include/md/_linux.cfg
-===================================================================
---- a/nspr/pr/include/md/_linux.cfg
-+++ b/nspr/pr/include/md/_linux.cfg
-@@ -1207,6 +1207,51 @@
+diff -r ab7d5c504daf -r d212d80704a2 nspr/pr/include/md/_linux.cfg
+--- a/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:33:15 2019 +0200
++++ b/nspr/pr/include/md/_linux.cfg	Tue Sep 03 11:36:05 2019 +0200
+@@ -1252,6 +1252,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
-
+ 
 +#elif defined(__nds32__)
 +
 +#define IS_LITTLE_ENDIAN 1
@@ -56,17 +57,15 @@ Index: b/nspr/pr/include/md/_linux.cfg
 +#define PR_BYTES_PER_DWORD_LOG2  3
 +
  #else
-
+ 
  #error "Unknown CPU architecture"
-
-Index: b/nspr/pr/include/md/_linux.h
-===================================================================
---- a/nspr/pr/include/md/_linux.h
-+++ b/nspr/pr/include/md/_linux.h
-@@ -65,6 +65,8 @@
- #define _PR_SI_ARCHITECTURE "microblaze"
- #elif defined(__nios2__)
+diff -r ab7d5c504daf -r d212d80704a2 nspr/pr/include/md/_linux.h
+--- a/nspr/pr/include/md/_linux.h	Tue Sep 03 11:33:15 2019 +0200
++++ b/nspr/pr/include/md/_linux.h	Tue Sep 03 11:36:05 2019 +0200
+@@ -67,6 +67,8 @@
  #define _PR_SI_ARCHITECTURE "nios2"
+ #elif defined(__microblaze__)
+ #define _PR_SI_ARCHITECTURE "microblaze"
 +#elif defined(__nds32__)
 +#define _PR_SI_ARCHITECTURE "nds32"
  #else
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 33710b65a9..321b67956a 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
-sha256	2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e  nspr-4.20.tar.gz
+sha256	c9e4b6cc24856ec93202fe13704b38b38ba219f0f2aeac93090ce2b6c696d430  nspr-4.22.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 763c5393b0..29005d526a 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.20
+LIBNSPR_VERSION = 4.22
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
