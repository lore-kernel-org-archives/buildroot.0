From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:28:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/linux-fusion
Message-ID: <20090112072851.9A44F766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:28:50 +0000 (Mon, 12 Jan 2009)
New Revision: 24779

Log:
Do not hardwire linux-fusion for AVR32, now also build for ARM

Modified:
   trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch


Changeset:
Modified: trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch
===================================================================
--- trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch	2009-01-12 00:43:22 UTC (rev 24778)
+++ trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch	2009-01-12 07:28:50 UTC (rev 24779)
@@ -36,7 +36,7 @@
  export CONFIG_FUSION_DEVICE=m
  
 -
-+ARCH=avr32
++ARCH=$(ARCH)
  ifeq ($(DEBUG),yes)
    CPPFLAGS += -DFUSION_DEBUG_SKIRMISH_DEADLOCK
  endif
@@ -45,7 +45,7 @@
  ifeq ($(call check-version,2,6,24),1)
  	$(MAKE) -C $(KERNEL_BUILD) \
 -		KCPPFLAGS="$(CPPFLAGS) -I`pwd`/linux/include" \
-+		ARCH=avr32 \
++		ARCH=$(ARCH) \
 +		CC=$(CROSS_COMPILE)gcc \
 +		AS=$(CROSS_COMPILE)as \
 +		KCPPFLAGS="$(CPPFLAGS) \
@@ -56,7 +56,7 @@
  else
  	$(MAKE) -C $(KERNEL_BUILD) \
 -		CPPFLAGS="$(CPPFLAGS) -D__KERNEL__ -I`pwd`/linux/include -I$(KERNEL_BUILD)/include -I$(KERNEL_SOURCE)/include $(AUTOCONF_H)" \
-+		ARCH=avr32 \
++		ARCH=$(ARCH) \
 +		CC=$(CROSS_COMPILE)gcc \
 +		AS=$(CROSS_COMPILE)as \
 +		CPPFLAGS="$(CPPFLAGS) \
