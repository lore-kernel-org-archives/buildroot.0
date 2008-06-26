From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Jun 2008 04:43:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080626114303.4842D3C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-26 04:43:02 -0700 (Thu, 26 Jun 2008)
New Revision: 22517

Log:
Makefile.autotools.in: fix BR2_PRIMARY_SITE check

Empty strings gets defined to "", so check for that instead of if
the variable is defined.


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-06-26 07:22:19 UTC (rev 22516)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-06-26 11:43:02 UTC (rev 22517)
@@ -135,7 +135,8 @@
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 else
 	$(call MESSAGE,"Downloading")
-ifdef BR2_PRIMARY_SITE
+ifneq ($(strip $(subst ",,$(BR2_PRIMARY_SITE))),)
+#"))
 	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $(BR2_PRIMARY_SITE)/$($(PKG)_SOURCE)
 endif
 	$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
