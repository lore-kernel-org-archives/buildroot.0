From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  7 Oct 2008 00:11:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20081007071115.ADDA73C2E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-07 00:11:15 -0700 (Tue, 07 Oct 2008)
New Revision: 23612

Log:
openssl: fix compiling OpenSSL for i386 architecture

This patch will use linux-generic32 for all i386 target architectures, which
fixes bug #5274.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-10-06 22:46:41 UTC (rev 23611)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-10-07 07:11:15 UTC (rev 23612)
@@ -8,13 +8,8 @@
 
 OPENSSL_TARGET_ARCH:=
 ifeq ($(BR2_i386),y)
-ifneq ($(ARCH),i386)
-OPENSSL_TARGET_ARCH:=i386-$(ARCH)
+OPENSSL_TARGET_ARCH:=generic32
 endif
-ifeq ($(ARCH),i686)
-OPENSSL_TARGET_ARCH:=i386-i686/cmov
-endif
-endif
 ifeq ($(OPENSSL_TARGET_ARCH),)
 OPENSSL_TARGET_ARCH:=$(ARCH)
 endif
