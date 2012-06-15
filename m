From: Nicole <nicole@cats-muvva.net>
Date: Fri, 15 Jun 2012 10:36:09 +0100
Subject: [Buildroot] gettext patch
Message-ID: <4FDB0209.4040204@cats-muvva.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ciao Thomas,

Here's the fix I located for gettext. I do not claim this as my own 
work. It gets round an error where the compile complains that the type 
of a field called __sp is not completely defined.

--- gnulib-lib/spawn.in.h       2010-11-18 19:49:42.424350565 +0300
+++ gnulib-lib/spawn.in.h       2010-11-18 19:49:10.392349526 +0300
@@ -37,6 +37,10 @@
  # include <signal.h>
  #endif

+#ifdef __UCLIBC__
+# include <sched.h>
+#endif
+
  #include <sys/types.h>

  #ifndef __THROW


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2332 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120615/fcccc2a2/attachment.p7s>
