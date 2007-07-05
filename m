From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 10:56:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: psmisc tar
Message-ID: <20070705175625.846DAA6112@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 10:56:24 -0700 (Thu, 05 Jul 2007)
New Revision: 19006

Log:
Bump version of tar and add disabling of IPv6 for psmisc if it is not selected. Submitted by <buraphalinuxserver@gmail.com>.


Modified:
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/tar/tar.mk


Changeset:
Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2007-07-05 17:54:38 UTC (rev 19005)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2007-07-05 17:56:24 UTC (rev 19006)
@@ -27,6 +27,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/ \
 		$(DISABLE_NLS) \
+		$(DISABLE_IPV6) \
 	);
 	touch $(PSMISC_DIR)/.configured
 

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2007-07-05 17:54:38 UTC (rev 19005)
+++ trunk/buildroot/package/tar/tar.mk	2007-07-05 17:56:24 UTC (rev 19006)
@@ -3,7 +3,7 @@
 # tar
 #
 #############################################################
-GNUTAR_VER:=1.15.1
+GNUTAR_VER:=1.18
 GNUTAR_SOURCE:=tar-$(GNUTAR_VER).tar.bz2
 GNUTAR_SITE:=http://ftp.gnu.org/gnu/tar/
 GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VER)
