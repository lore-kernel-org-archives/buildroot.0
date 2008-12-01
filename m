From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 04:53:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081201125309.E2CCA3C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 04:53:09 -0800 (Mon, 01 Dec 2008)
New Revision: 24210

Log:
mplayer: make sure alsa-lib is installed before mplayer

This patch adds alsa-lib to a dependency for mplayer if it is selected in
kconfig.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 12:48:58 UTC (rev 24209)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 12:53:09 UTC (rev 24210)
@@ -19,6 +19,10 @@
 
 MPLAYER_DEP_LIBS:=libmad
 
+ifeq ($(strip $(BR2_PACKAGE_ALSA_LIB)),y)
+MPLAYER_DEP_LIBS+=alsa-lib
+endif
+
 $(DL_DIR)/$(MPLAYER_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPLAYER_SITE)/$(MPLAYER_SOURCE)
 
