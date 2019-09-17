From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:38:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libnspr: add
 patch for nds32 support.
Message-ID: <20190917203621.8CD778EA30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab857abea85affb45673a97fce4e75a97df13740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:

  http://autobuild.buildroot.net/results/9380435440c977eeaf98a1ffa80f411f07f62482/

Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3388027e0de83f5e2a38f5ba34fb09268bc6b7d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/0003-nds32.patch | 74 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/libnspr/0003-nds32.patch b/package/libnspr/0003-nds32.patch
new file mode 100644
index 0000000000..3b67a3f787
--- /dev/null
+++ b/package/libnspr/0003-nds32.patch
@@ -0,0 +1,74 @@
+Add nds32 support
+
+Signed-off-by:Nylon Chen <nylon7@andestech.com>
+
+Index: b/nspr/pr/include/md/_linux.cfg
+===================================================================
+--- a/nspr/pr/include/md/_linux.cfg
++++ b/nspr/pr/include/md/_linux.cfg
+@@ -1207,6 +1207,51 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+
++#elif defined(__nds32__)
++
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #else
+
+ #error "Unknown CPU architecture"
+
+Index: b/nspr/pr/include/md/_linux.h
+===================================================================
+--- a/nspr/pr/include/md/_linux.h
++++ b/nspr/pr/include/md/_linux.h
+@@ -65,6 +65,8 @@
+ #define _PR_SI_ARCHITECTURE "microblaze"
+ #elif defined(__nios2__)
+ #define _PR_SI_ARCHITECTURE "nios2"
++#elif defined(__nds32__)
++#define _PR_SI_ARCHITECTURE "nds32"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
