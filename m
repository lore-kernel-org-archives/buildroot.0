From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 05:06:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081201130602.AB0FD3C78E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 05:06:02 -0800 (Mon, 01 Dec 2008)
New Revision: 24212

Log:
qtopia4: remove explisit include and library directories from configure call

This patch removes -I and -L from ./configure since it breaks cross-compiling.
The inclusion of -I and -L will confuse the host compiler when compiling the
host tools.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-01 13:02:22 UTC (rev 24211)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-01 13:06:02 UTC (rev 24212)
@@ -342,8 +342,6 @@
 		-no-rpath \
 		-nomake examples \
 		-nomake demos \
-		-I $(STAGING_DIR)/usr/include \
-		-L $(STAGING_DIR)/usr/lib \
 	)
 	touch $@
 
