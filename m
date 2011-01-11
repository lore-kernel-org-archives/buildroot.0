From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 11 Jan 2011 11:30:42 -0600
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.2 + change URL to
	match kernel.org
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EDEEF0D@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed the KEEC_SITE to the new home of kexec.  This patch also
satisfies
bug id=3007 created by me last month.  Thanks to Gustavo for pointing
out
that the easy fix was to bump kexec to 2.0.2.

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
--- a/package/kexec/kexec.mk    2011-01-06 05:25:33.000000000 -0600
+++ b/package/kexec/kexec.mk    2011-01-03 13:09:10.000000000 -0600
@@ -3,9 +3,9 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.1
+KEXEC_VERSION = 2.0.2
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
-KEXEC_SITE =
$(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
+KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
