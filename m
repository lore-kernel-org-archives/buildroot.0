From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 16:13:52 +0200
Subject: [Buildroot] [git commit] libnspr: fix Microblaze patch
Message-ID: <20170406141359.754828271B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7039c4d456259ca2c2708be16ebea98a82adee3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a mistake, the Microblaze patch was adding another #elif
defined(nios2), which doesn't make any sense. This commit gets rid of
it.

The rest of the noise in the change is due to the use of quilt to
generate the patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/0002-microblaze.patch | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
index f1416e7..7fd650c 100644
--- a/package/libnspr/0002-microblaze.patch
+++ b/package/libnspr/0002-microblaze.patch
@@ -3,9 +3,10 @@ Add Microblaze support
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 
-diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/include/md/_linux.cfg
---- nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg	2015-10-03 08:13:11.845414714 -0300
-+++ nspr-4.10.9/nspr/pr/include/md/_linux.cfg	2015-10-03 08:13:20.435708195 -0300
+Index: b/nspr/pr/include/md/_linux.cfg
+===================================================================
+--- a/nspr/pr/include/md/_linux.cfg
++++ b/nspr/pr/include/md/_linux.cfg
 @@ -1062,6 +1062,56 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
@@ -63,10 +64,11 @@ diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/in
  #else
  
  #error "Unknown CPU architecture"
-diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.h nspr-4.10.9/nspr/pr/include/md/_linux.h
---- nspr-4.10.9.orig/nspr/pr/include/md/_linux.h	2015-10-03 08:13:11.845414714 -0300
-+++ nspr-4.10.9/nspr/pr/include/md/_linux.h	2015-10-03 08:14:53.351882603 -0300
-@@ -57,8 +57,11 @@
+Index: b/nspr/pr/include/md/_linux.h
+===================================================================
+--- a/nspr/pr/include/md/_linux.h
++++ b/nspr/pr/include/md/_linux.h
+@@ -57,6 +57,8 @@
  #define _PR_SI_ARCHITECTURE "m32r"
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
@@ -74,7 +76,4 @@ diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.h nspr-4.10.9/nspr/pr/incl
 +#define _PR_SI_ARCHITECTURE "microblaze"
  #elif defined(nios2)
  #define _PR_SI_ARCHITECTURE "nios2"
-+#elif defined(nios2)
  #else
- #error "Unknown CPU architecture"
- #endif
