From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Dec 2008 02:32:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20081217103208.AAEE53C6F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-17 02:32:06 -0800 (Wed, 17 Dec 2008)
New Revision: 24438

Log:
openswan: revert $(strip ...) change (r24307) on patches

Thanks to Markus for noticing.

Modified:
   trunk/buildroot/package/openswan/linux-2.6.20-openswan-2.4.7.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.20.4-openswan-2.4.7.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.21.5-openswan-2.4.8.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch


Changeset:
/svn/hooks/commit-email.pl: `/usr/bin/svnlook diff /svn -r 24438' failed with this output:
Modified: trunk/buildroot/package/openswan/linux-2.6.20-openswan-2.4.7.kernel-2.6-klips.patch
===================================================================
--- trunk/buildroot/package/openswan/linux-2.6.20-openswan-2.4.7.kernel-2.6-klips.patch	2008-12-17 09:28:33 UTC (rev 24437)
+++ trunk/buildroot/package/openswan/linux-2.6.20-openswan-2.4.7.kernel-2.6-klips.patch	2008-12-17 10:32:06 UTC (rev 24438)
@@ -9774,7 +9774,7 @@
 +asm-obj-$(CONFIG_MWINCHIP3D)	+= match686.o
 +
 +obj-y += $(asm-obj-y)
-+ifneq ($(asm-obj-y),)
++ifneq ($(strip $(asm-obj-y)),)
 +  EXTRA_CFLAGS += -DASMV
 +endif
 +
@@ -13864,12 +13864,12 @@
 +++ linux/net/ipsec/alg/Makefile     Mon Feb  9 13:51:03 2004
 @@ -0,0 +1,112 @@
 +# Makefile,v 1.1.2.1 2003/11/21 18:12:23 jjo Exp
-+ifeq ($(KLIPSMODULE),)
++ifeq ($(strip $(KLIPSMODULE)),)
 +FREESWANSRCDIR=.
 +else
 +FREESWANSRCDIR=../../../..
 +endif
-+ifeq ($(KLIPS_TOP),)
++ifeq ($(strip $(KLIPS_TOP)),)
 +KLIPS_TOP=../../..
 +override EXTRA_CFLAGS += -I$(KLIPS_TOP)/include
 +endif

Modified: trunk/buildroot/package/openswan/linux-2.6.20.4-openswan-2.4.7.kernel-2.6-klips.patch
===================================================================
--- trunk/buildroot/package/openswan/linux-2.6.20.4-openswan-2.4.7.kernel-2.6-klips.patch	2008-12-17 09:28:33 UTC (rev 24437)
+++ trunk/buildroot/package/openswan/linux-2.6.20.4-openswan-2.4.7.kernel-2.6-klips.patch	2008-12-17 10:32:06 UTC (rev 24438)
@@ -9774,7 +9774,7 @@
 +asm-obj-$(CONFIG_MWINCHIP3D)	+= match686.o
 +
 +obj-y += $(asm-obj-y)
-+ifneq ($(asm-obj-y),)
++ifneq ($(strip $(asm-obj-y)),)
 +  EXTRA_CFLAGS += -DASMV
 +endif
 +
@@ -13864,12 +13864,12 @@
 +++ linux/net/ipsec/alg/Makefile     Mon Feb  9 13:51:03 2004
 @@ -0,0 +1,112 @@
 +# Makefile,v 1.1.2.1 2003/11/21 18:12:23 jjo Exp
-+ifeq ($(KLIPSMODULE),)
++ifeq ($(strip $(KLIPSMODULE)),)
 +FREESWANSRCDIR=.
 +else
 +FREESWANSRCDIR=../../../..
 +endif
-+ifeq ($(KLIPS_TOP),)
++ifeq ($(strip $(KLIPS_TOP)),)
 +KLIPS_TOP=../../..
 +override EXTRA_CFLAGS += -I$(KLIPS_TOP)/include
 +endif

Modified: trunk/buildroot/package/openswan/linux-2.6.21.5-openswan-2.4.8.kernel-2.6-klips.patch
===================================================================
