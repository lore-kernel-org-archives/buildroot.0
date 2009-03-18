From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 11:27:38 +0000 (UTC)
Subject: [Buildroot] svn commit: [25714]
	trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090318112738.5E1DE76459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 11:27:37 +0000 (Wed, 18 Mar 2009)
New Revision: 25714

Log:
alsa-lib: don't force EABI for ARM

Closes #191.

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-03-18 11:27:29 UTC (rev 25713)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-03-18 11:27:37 UTC (rev 25714)
@@ -23,10 +23,6 @@
 ALSA_LIB_CONF_OPT += --enable-debug
 endif
 
-ifeq ($(BR2_arm),y)
-ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
-endif
-
 ifeq ($(BR2_avr32),y)
 ALSA_LIB_CFLAGS+=-DAVR32_INLINE_BUG
 endif
