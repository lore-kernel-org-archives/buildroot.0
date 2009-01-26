From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:41:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090126194147.BAF2C768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 19:41:47 +0000 (Mon, 26 Jan 2009)
New Revision: 25063

Log:
libcgicc: don't build demos

And remove unneeded patch for demos while we're at it.

Removed:
   trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch

Modified:
   trunk/buildroot/package/libcgicc/libcgicc.mk


Changeset:
Deleted: trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch
===================================================================
--- trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	2009-01-26 19:41:32 UTC (rev 25062)
+++ trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	2009-01-26 19:41:47 UTC (rev 25063)
@@ -1,38 +0,0 @@
-From: Robert Schwebel <r.schwebel@pengutronix.de>
-Subject: [patch] sort is now in <algorithm>
-
-When built with gcc-4.3.2, cgicc-3.2.7 cannot be compiled any more; sort
-is now being part of <algorithm> and must be written as ::sort:
-
-cardgame.cpp:1232: error: 'sort' was not declared in this scope
-make[2]: *** [cardgame.o] Error 1
-
-Fix it.
-
-Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
-
----
- demo/cardgame.cpp |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: cgicc-3.2.7/demo/cardgame.cpp
-===================================================================
---- cgicc-3.2.7.orig/demo/cardgame.cpp
-+++ cgicc-3.2.7/demo/cardgame.cpp
-@@ -36,6 +36,7 @@
- #include <sstream>
- #include <fstream>
- #include <queue>
-+#include <algorithm>
- 
- #include "cgicc/CgiDefs.h"
- #include "cgicc/Cgicc.h"
-@@ -1043,7 +1044,7 @@ namespace CardGameTools
- 
- 	void drawPlayerCards(datasplayer *vPlayer)
- 	{
--		sort (vPlayer->cardsList->begin(),vPlayer->cardsList->end());
-+		std::sort (vPlayer->cardsList->begin(),vPlayer->cardsList->end());
- 		cout <<"<form name=\"cards\">"; 
- 		cout <<"<input type=\"hidden\" name=\"actionner\" value=\"\">"; 
- 		cout <<"<input type=\"hidden\" name=\"card\" value=\"\">"; 

Modified: trunk/buildroot/package/libcgicc/libcgicc.mk
===================================================================
--- trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-26 19:41:32 UTC (rev 25062)
+++ trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-26 19:41:47 UTC (rev 25063)
@@ -32,6 +32,7 @@
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
+		--disable-demos \
 	)
 	touch $@
 
