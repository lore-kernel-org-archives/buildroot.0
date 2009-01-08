From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  8 Jan 2009 22:11:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20090108221134.4C87F77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-08 22:11:33 +0000 (Thu, 08 Jan 2009)
New Revision: 24726

Log:
Do not add PATCH_VERSION to PORTAGE_VERSION if patch is not applied, time to upgarde to 2.1.6?

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2009-01-08 17:19:01 UTC (rev 24725)
+++ trunk/buildroot/package/portage/portage.mk	2009-01-08 22:11:33 UTC (rev 24726)
@@ -5,8 +5,11 @@
 #############################################################
 PORTAGE_BASE_VERSION:=2.1.4
 PORTAGE_DOWNLOAD_VERSION:=$(PORTAGE_BASE_VERSION)
+PORTAGE_PATCH_APPLY:=n
 PORTAGE_PATCH_VERSION:=.4
-PORTAGE_PATCH_APPLY:=n
+ifeq ($(PORTAGE_PATCH_APPLY),n)
+PORTAGE_PATCH_VERSION:=
+endif
 PORTAGE_VERSION:=$(PORTAGE_BASE_VERSION)$(PORTAGE_PATCH_VERSION)
 PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
 
