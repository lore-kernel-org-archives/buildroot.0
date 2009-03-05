From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 13:48:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20090305134830.15DAF7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 13:48:29 +0000 (Thu, 05 Mar 2009)
New Revision: 25546

Log:
openssl: misc fixes

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>
Closes #151.

* Avoid fips directory completely since it just installs source file cruft
  inlib
* Point openssldir to a more friendly and common /etc/ssl rather than
  /usr/lib/ssl

Added:
   trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Added: trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch	2009-03-05 13:48:29 UTC (rev 25546)
@@ -0,0 +1,12 @@
+diff -Nura openssl-0.9.8j/Makefile openssl-0.9.8j.nofips/Makefile
+--- openssl-0.9.8j/Makefile	2009-01-07 09:57:01.000000000 -0200
++++ openssl-0.9.8j.nofips/Makefile	2009-03-05 10:10:09.000000000 -0200
+@@ -133,7 +133,7 @@
+ 
+ BASEADDR=0xFB00000
+ 
+-DIRS=   crypto fips ssl engines apps test tools
++DIRS=   crypto ssl engines apps test tools
+ SHLIBDIRS= crypto ssl
+ 
+ # dirs in crypto to build

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-03-05 13:40:34 UTC (rev 25545)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-03-05 13:48:29 UTC (rev 25546)
@@ -38,7 +38,7 @@
 		./Configure \
 			linux-$(OPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
-			--openssldir=/usr/lib/ssl \
+			--openssldir=/etc/ssl \
 			threads \
 			shared \
 			no-idea \
