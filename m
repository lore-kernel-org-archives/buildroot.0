From: andersen@uclibc.org <andersen@uclibc.org>
Date: Thu Jul 20 20:29:53 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20060721032951.3C54248C7D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-20 20:29:50 -0700 (Thu, 20 Jul 2006)
New Revision: 15739

Log:
let X figure out the correct mouse protocol


Modified:
   trunk/buildroot/package/xorg/xorg.conf


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.conf
===================================================================
--- trunk/buildroot/package/xorg/xorg.conf	2006-07-20 22:50:22 UTC (rev 15738)
+++ trunk/buildroot/package/xorg/xorg.conf	2006-07-21 03:29:50 UTC (rev 15739)
@@ -39,18 +39,18 @@
 Section "InputDevice"
 	Identifier	"PS2 Mouse"
 	Driver		"mouse"
-	Option		"CorePointer"
+	Option		"SendCoreEvents"	"true"
 	Option		"Device"		"/dev/psaux"
-	Option		"Protocol"		"ImPS/2"
+	Option		"Protocol"		"auto"
 	Option		"ZAxisMapping"		"4 5"
 EndSection
 
 Section "InputDevice"
 	Identifier	"USB Mouse"
 	Driver		"mouse"
-	Option		"SendCoreEvents"	"true"
+	Option		"CorePointer"
 	Option		"Device"		"/dev/input/mice"
-	Option		"Protocol"		"ImPS/2"
+	Option		"Protocol"		"auto"
 	Option		"ZAxisMapping"		"4 5"
 EndSection
 
