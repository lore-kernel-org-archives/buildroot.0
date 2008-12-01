From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 05:08:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081201130843.F22E73C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 05:08:43 -0800 (Mon, 01 Dec 2008)
New Revision: 24213

Log:
mplayer: remove not needed $(strip ...) calls in Makefile

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 13:06:02 UTC (rev 24212)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 13:08:43 UTC (rev 24213)
@@ -19,7 +19,7 @@
 
 MPLAYER_DEP_LIBS:=libmad
 
-ifeq ($(strip $(BR2_PACKAGE_ALSA_LIB)),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPLAYER_DEP_LIBS+=alsa-lib
 endif
 
@@ -83,6 +83,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_MPLAYER)),y)
+ifeq ($(BR2_PACKAGE_MPLAYER),y)
 TARGETS+=mplayer
 endif
