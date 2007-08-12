From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 11:14:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20070812181451.7E7A4A612F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 11:14:49 -0700 (Sun, 12 Aug 2007)
New Revision: 19464

Log:
Move .PHONY to front in sed

Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-08-12 14:40:16 UTC (rev 19463)
+++ trunk/buildroot/package/sed/sed.mk	2007-08-12 18:14:49 UTC (rev 19464)
@@ -69,6 +69,7 @@
 		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 	fi
 
+.PHONY: sed host-sed use-sed-host-binary
 
 use-sed-host-binary:	$(HOST_SED_DIR)/$(SED_TARGET_BINARY)
 
@@ -155,4 +156,4 @@
 ifeq ($(strip $(BR2_PACKAGE_SED)),y)
 TARGETS+=sed
 endif
-.PHONY: sed host-sed use-sed-host-binary
+
