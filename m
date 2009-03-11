From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 15:43:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25612] trunk/buildroot/package/pango
Message-ID: <20090311154355.881B57645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 15:43:55 +0000 (Wed, 11 Mar 2009)
New Revision: 25612

Log:
pango: init script: make sure /etc/pango exists

Modified:
   trunk/buildroot/package/pango/S25pango


Changeset:
Modified: trunk/buildroot/package/pango/S25pango
===================================================================
--- trunk/buildroot/package/pango/S25pango	2009-03-11 15:43:52 UTC (rev 25611)
+++ trunk/buildroot/package/pango/S25pango	2009-03-11 15:43:55 UTC (rev 25612)
@@ -7,6 +7,7 @@
 case "$1" in
     start|"")
 	if [ ! -f "$FILE" ] ; then
+	    mkdir -p /etc/pango
 	    /usr/bin/pango-querymodules > "$FILE"
 	fi
 	;;
