From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  8 Mar 2007 08:44:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070308164421.2D5A3485B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-08 08:44:20 -0800 (Thu, 08 Mar 2007)
New Revision: 18038

Log:
- Propagate HOST_SED_DIR to the dependencies script so that it may use the
  local sed build as well (Heikki Lindholm).


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.mk


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-03-08 16:14:46 UTC (rev 18037)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-03-08 16:44:20 UTC (rev 18038)
@@ -6,7 +6,9 @@
 ######################################################################
 
 dependencies: host-sed
-	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" $(TOPDIR)/toolchain/dependencies/dependencies.sh
+	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
+		HOST_SED_DIR="$(HOST_SED_DIR)" \
+		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
 
