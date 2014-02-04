From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 09:51:11 +0100
Subject: [Buildroot] [git commit] libnspr: add microblaze support
Message-ID: <20140204085346.D30349C783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=443af537d29912ac868531e0c4078e91cb1d6c39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes autobuild failures

http://autobuild.buildroot.net/results/493/4932900522e87da84a47fbf2d796c2fbb3f7e741/build-end.log

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ibnspr-nios2.patch => libnspr-0001-nios2.patch} |    0
 ...r-nios2.patch => libnspr-0002-microblaze.patch} |   25 ++++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/libnspr/libnspr-nios2.patch b/package/libnspr/libnspr-0001-nios2.patch
similarity index 100%
copy from package/libnspr/libnspr-nios2.patch
copy to package/libnspr/libnspr-0001-nios2.patch
diff --git a/package/libnspr/libnspr-nios2.patch b/package/libnspr/libnspr-0002-microblaze.patch
similarity index 77%
rename from package/libnspr/libnspr-nios2.patch
rename to package/libnspr/libnspr-0002-microblaze.patch
index cffb2ef..93a0be5 100644
--- a/package/libnspr/libnspr-nios2.patch
+++ b/package/libnspr/libnspr-0002-microblaze.patch
@@ -1,18 +1,23 @@
-Add Nios-II support
+Add Microblaze support
 
-Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 
 diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg
 --- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:04.556139100 -0300
 +++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.cfg	2013-11-10 21:15:29.332138283 -0300
-@@ -914,6 +914,51 @@
+@@ -914,6 +914,56 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
-+#elif defined(nios2)
++#elif defined(__microblaze__)
 +
++#if defined(__BIG_ENDIAN__)
++#define IS_BIG_ENDIAN 1
++#undef  IS_LITTLE_ENDIAN
++#else
 +#define IS_LITTLE_ENDIAN 1
 +#undef  IS_BIG_ENDIAN
++#endif
 +
 +#define PR_BYTES_PER_BYTE   1
 +#define PR_BYTES_PER_SHORT  2
@@ -58,14 +63,14 @@ diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.cfg libnspr-4.
  
  #error "Unknown CPU architecture"
 diff -Naur libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h
---- libnspr-4.9.6-ori/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:04.556139100 -0300
-+++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h	2013-11-10 21:15:33.245138154 -0300
+--- libnspr-4.9.6.orig/mozilla/nsprpub/pr/include/md/_linux.h	2014-01-10 14:39:20.674107805 -0600
++++ libnspr-4.9.6/mozilla/nsprpub/pr/include/md/_linux.h	2014-01-10 14:44:04.442112985 -0600
 @@ -55,6 +55,8 @@
  #define _PR_SI_ARCHITECTURE "avr32"
  #elif defined(__m32r__)
  #define _PR_SI_ARCHITECTURE "m32r"
-+#elif defined(nios2)
-+#define _PR_SI_ARCHITECTURE "nios2"
++#elif defined(__microblaze__)
++#define _PR_SI_ARCHITECTURE "microblaze"
+ #elif defined(nios2)
+ #define _PR_SI_ARCHITECTURE "nios2"
  #else
- #error "Unknown CPU architecture"
- #endif
