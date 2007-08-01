From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 08:52:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070801155258.323BEA6039@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 08:52:57 -0700 (Wed, 01 Aug 2007)
New Revision: 19391

Log:
Make avahi select LIBDAEMON instead of depending on it.

Modified:
   trunk/buildroot/package/avahi/Config.in


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2007-08-01 12:11:44 UTC (rev 19390)
+++ trunk/buildroot/package/avahi/Config.in	2007-08-01 15:52:57 UTC (rev 19391)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	depends on BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_LIBDAEMON
 	default n
 	help
 	  Avahi is a system which facilitates service
