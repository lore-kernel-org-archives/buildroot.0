From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:38:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-utils
Message-ID: <20071031063859.B911EA65C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:38:59 -0700 (Tue, 30 Oct 2007)
New Revision: 20346

Log:
Explain alsa-utils dependency on ncurses

Modified:
   trunk/buildroot/package/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/alsa-utils/Config.in	2007-10-31 06:37:44 UTC (rev 20345)
+++ trunk/buildroot/package/alsa-utils/Config.in	2007-10-31 06:38:59 UTC (rev 20346)
@@ -9,6 +9,10 @@
 
 	  http://www.alsa-project.org/
 
+comment "alsa-utils needs ncurses"
+	depends on BR2_PACKAGE_ALSA_LIB
+	depends on !BR2_PACKAGE_NCURSES
+
 menu "ALSA utils selection"
 	depends on BR2_PACKAGE_ALSA_UTILS
 
