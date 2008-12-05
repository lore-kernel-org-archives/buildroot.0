From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri,  5 Dec 2008 01:47:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libvorbis
Message-ID: <20081205094716.729B13C8B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-05 01:47:16 -0800 (Fri, 05 Dec 2008)
New Revision: 24281

Log:
libvorbis: tremor depends on host-autoconf and host-automake

This patch adds host-autoconf and host-automake as dependencies to tremor, this
is needed for it to compile.



Modified:
   trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2008-12-05 09:46:17 UTC (rev 24280)
+++ trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2008-12-05 09:47:16 UTC (rev 24281)
@@ -115,7 +115,7 @@
 	cp -dpf $(TREMOR_DIR)/lib/tremor.a $(TARGET_DIR)/usr/lib/
 	touch $@
 
-tremor: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/tremor.so
+tremor: uclibc pkgconfig host-autoconf host-automake libogg $(TARGET_DIR)/usr/lib/tremor.so
 
 tremor-source: $(DL_DIR)/$(TREMOR_SOURCE)
 
