From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:49:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [25686] trunk/buildroot/package/libgtk2
Message-ID: <20090316154912.231C57643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:49:11 +0000 (Mon, 16 Mar 2009)
New Revision: 25686

Log:
libgtk2: init script: make sure /etc/gtk-2.0 exists

Modified:
   trunk/buildroot/package/libgtk2/S26libgtk2


Changeset:
Modified: trunk/buildroot/package/libgtk2/S26libgtk2
===================================================================
--- trunk/buildroot/package/libgtk2/S26libgtk2	2009-03-16 15:49:03 UTC (rev 25685)
+++ trunk/buildroot/package/libgtk2/S26libgtk2	2009-03-16 15:49:11 UTC (rev 25686)
@@ -7,6 +7,7 @@
 case "$1" in
     start|"")
 	if [ ! -f "$FILE" ] ; then
+	    mkdir -p /etc/gtk-2.0
 	    /usr/bin/gdk-pixbuf-query-loaders > "$FILE"
 	fi
 	;;
