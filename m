From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Aug 2010 16:34:44 -0700
Subject: [Buildroot] [PATCH] uClibc-0.9.31: Fix build when locales are
	enabled
Message-ID: <1281656084-28184-1-git-send-email-raj.khem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain/uClibc/uClibc-0.9.31-locale.patch |   34 +++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-locale.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-locale.patch b/toolchain/uClibc/uClibc-0.9.31-locale.patch
new file mode 100644
index 0000000..945cefd
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-locale.patch
@@ -0,0 +1,34 @@
+diff -uNr uClibc-0.9.30.org/libc/sysdeps/linux/common/bits/uClibc_locale.h uClibc-0.9.30/libc/sysdeps/linux/common/bits/uClibc_locale.h
+--- uClibc-0.9.30.org/libc/sysdeps/linux/common/bits/uClibc_locale.h	2009-02-13 13:03:09.000000000 +0100
++++ uClibc-0.9.30/libc/sysdeps/linux/common/bits/uClibc_locale.h	2009-02-13 12:35:07.000000000 +0100
+@@ -41,11 +41,9 @@
+ 
+ # define __LOCALE_C_ONLY
+ 
+-# ifdef _LIBC
+ #  define __XL_NPP(N) N
+ #  define __LOCALE_PARAM
+ #  define __LOCALE_ARG
+-# endif
+ 
+ #endif
+ 
+@@ -90,8 +88,6 @@
+ struct __uclibc_locale_struct;
+ typedef struct __uclibc_locale_struct *__locale_t;
+ 
+-#ifdef _LIBC
+-
+ /* extern void _locale_set(const unsigned char *p); */
+ /* extern void _locale_init(void); */
+ 
+@@ -367,8 +363,6 @@
+ #endif
+ /**********************************************************************/
+ 
+-#endif /* _LIBC */
+-
+ #endif /* !defined(__LOCALE_C_ONLY) */
+ 
+ #endif /* _UCLIBC_LOCALE_H */
+
-- 
1.7.0.4
