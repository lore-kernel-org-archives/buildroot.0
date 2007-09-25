From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 05:01:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
Message-ID: <20070925120128.9F46230108@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 05:01:27 -0700 (Tue, 25 Sep 2007)
New Revision: 20013

Log:
Add source and unpacked targets to mplayer

Modified:
   trunk/buildroot/package/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/mplayer/mplayer.mk	2007-09-25 11:58:33 UTC (rev 20012)
+++ trunk/buildroot/package/mplayer/mplayer.mk	2007-09-25 12:01:27 UTC (rev 20013)
@@ -60,6 +60,10 @@
 
 mplayer: uclibc libmad $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 
+mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
+
+mplayer-unpacked: $(MPLAYER_DIR)/.unpacked
+
 mplayer-clean:
 	rm -f $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 	-$(MAKE) -C $(MPLAYER_DIR) clean
