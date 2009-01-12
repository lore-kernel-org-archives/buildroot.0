From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 Jan 2009 07:45:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090112074504.21E90766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-12 07:45:02 +0000 (Mon, 12 Jan 2009)
New Revision: 24784

Log:
Remove conditional clause which disables building some packages

Modified:
   trunk/buildroot/scripts/buildall.sh


Changeset:
Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-12 07:44:09 UTC (rev 24783)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-12 07:45:02 UTC (rev 24784)
@@ -7,11 +7,10 @@
 }
 
 if	[ ${already-done} == 1 ] ; then
-
-
 nmk	busybox
+fi	# ********* already-done
+#**********************************************************************************
 
-
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	bash
 	mk	bzip2
@@ -304,8 +303,10 @@
 mk	alsa-lib
 mk	alsa-utils
 mk	asterisk
-fi	# ********* already-done
-#**********************************************************************************
+
+
+if	[ ${already-done} == 1 ] ; then
+
 mk	aumix
 mk	gstreamer
 mk	gst-plugins-base
@@ -337,7 +338,7 @@
 mk	directfb
 mk	directfb-examples
 mk	fbdump
-mk	fusion
+mk	linux-fusion
 mk	imagemagick
 mk	jpeg
 mk	libart
@@ -458,3 +459,5 @@
 # various games packages
 nmk	games
 
+fi	# ********* already-done
+#**********************************************************************************
