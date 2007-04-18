From: Francois Visconte <fv@kh3.org>
Date: Wed, 18 Apr 2007 09:37:12 +0200
Subject: [Buildroot] patch for gettext package (bug#13000)
Message-ID: <4625CAA8.5050005@kh3.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Here is the path to put in 'package/gettext/gettext-plural-exp.patch':


Cheers,
Fran?ois Visconte



--- gettext-0.14.6/gettext-runtime/intl/plural-exp.h   2005-05-20 
23:03:38.000000000 +0200
+++ gettext-0.14.6/gettext-runtime/intl/plural-exp.h   2007-04-13
15:54:54.000000000 +0200
@@ -110,7 +110,7 @@
                                unsigned long int *npluralsp)
       internal_function;

-#if !defined (_LIBC) && !defined (IN_LIBINTL)
+#if !defined (__UCLIBC__) && !defined (_LIBC) && !defined (IN_LIBINTL)
  extern unsigned long int plural_eval (struct expression *pexp,
                               unsigned long int n);
  #endif
