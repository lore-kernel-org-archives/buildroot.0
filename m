From: Alexander Khryukin <alexander@mezon.ru>
Date: Tue, 19 Mar 2013 01:20:17 +0400
Subject: [Buildroot] [PATCH 3/3] prcpucfg fixes for nspr aarch64
Message-ID: <1363641617-2991-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/libnspr/nspr-prcpucfg-aarch64.patch | 70 +++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/libnspr/nspr-prcpucfg-aarch64.patch

diff --git a/package/libnspr/nspr-prcpucfg-aarch64.patch b/package/libnspr/nspr-prcpucfg-aarch64.patch
new file mode 100644
index 0000000..70fe49e
--- /dev/null
+++ b/package/libnspr/nspr-prcpucfg-aarch64.patch
@@ -0,0 +1,70 @@
+diff --git a/mozilla/nsprpub/pr/include/md/_linux.cfg b/mozilla/nsprpub/pr/include/md/_linux.cfg
+index d0a3bee..2666a4d 100644
+--- a/mozilla/nsprpub/pr/include/md/_linux.cfg
++++ b/mozilla/nsprpub/pr/include/md/_linux.cfg
+@@ -861,6 +861,52 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__aarch64__)
++
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++#define IS_64
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   8
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   8
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    64
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    64
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   6
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   6
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    8
++#define PR_ALIGN_OF_INT64   8
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  8
++#define PR_ALIGN_OF_POINTER 8
++#define PR_ALIGN_OF_WORD    8
++
++#define PR_BYTES_PER_WORD_LOG2  3
++#define PR_BYTES_PER_DWORD_LOG2 3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+diff --git a/mozilla/nsprpub/pr/include/md/_linux.h b/mozilla/nsprpub/pr/include/md/_linux.h
+index 4992b77..671ad8a 100644
+--- a/mozilla/nsprpub/pr/include/md/_linux.h
++++ b/mozilla/nsprpub/pr/include/md/_linux.h
+@@ -53,6 +53,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(__aarch64__)
++#define _PR_SI_ARCHITECTURE "aarch64"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
-- 
1.8.1.5
