From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:31:06 +0400
Subject: [Buildroot] [PATCH] gnutls-2.12.20-glibc-2.16.patch glibc-2.16 and
	gnutls2 fix i forgot my signoff
Message-ID: <1352464266-22684-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/gnutls/gnutls-2.12.20-glibc2.16.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/gnutls/gnutls-2.12.20-glibc2.16.patch

diff --git a/package/gnutls/gnutls-2.12.20-glibc2.16.patch b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
new file mode 100644
index 0000000..6b7f545
--- /dev/null
+++ b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
@@ -0,0 +1,26 @@
+--- gnutls-2.12.20/gl/stdio.in.h
++++ gnutls-2.12.20/gl/stdio.in.h
+@@ -714,8 +714,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#ifdef HAVE_RAW_DECL_GETS
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
++#endif
+ 
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
+--- gnutls-2.12.20/lib/gl/stdio.in.h
++++ gnutls-2.12.20/lib/gl/stdio.in.h
+@@ -714,8 +714,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#ifdef HAVE_RAW_DECL_GETS
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
++#endif
+ 
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
-- 
1.7.11.3
