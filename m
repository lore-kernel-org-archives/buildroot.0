From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mpg123
Message-ID: <20090205132402.C38A976454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:01 +0000 (Thu, 05 Feb 2009)
New Revision: 25246

Log:
mpg123: cleanup after r19300 (don't introduce unneeded hidden configs)

Modified:
   trunk/buildroot/package/multimedia/mpg123/Config.in
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mpg123/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/Config.in	2009-02-05 12:38:21 UTC (rev 25245)
+++ trunk/buildroot/package/multimedia/mpg123/Config.in	2009-02-05 13:24:01 UTC (rev 25246)
@@ -5,9 +5,3 @@
 	  MPEG 1.0/2.0 layers 1, 2 and 3.
 
 	  http://www.mpg123.de/
-
-config BR2_PACKAGE_MPG123_ALSA
-	bool
-	default y
-	depends on BR2_PACKAGE_ALSA_LIB
-

Modified: trunk/buildroot/package/multimedia/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 12:38:21 UTC (rev 25245)
+++ trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 13:24:01 UTC (rev 25246)
@@ -13,7 +13,7 @@
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
-ifeq ($(BR2_PACKAGE_MPG123_ALSA),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPG123_USE_ALSA:=--with-audio=alsa
 MPG123_ALSA_DEP:=alsa-lib
 endif
