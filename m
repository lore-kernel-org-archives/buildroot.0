From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 04:48:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081201124858.E02FA3C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 04:48:58 -0800 (Mon, 01 Dec 2008)
New Revision: 24209

Log:
mplayer: add dependency libraries to a variable

This patch will put dependency libraries in a variable and add this to the
dependencies to build mplayer. This is done to ease adding new libraries in the
future.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 12:38:36 UTC (rev 24208)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 12:48:58 UTC (rev 24209)
@@ -17,6 +17,8 @@
 MPLAYER_ENDIAN:=--disable-big-endian
 endif
 
+MPLAYER_DEP_LIBS:=libmad
+
 $(DL_DIR)/$(MPLAYER_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPLAYER_SITE)/$(MPLAYER_SOURCE)
 
@@ -60,7 +62,7 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 	touch -c $@
 
-mplayer: uclibc libmad $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
+mplayer: uclibc $(MPLAYER_DEP_LIBS) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 
 mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
 
