From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 07:16:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070727141602.0B1FBA466C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 07:16:00 -0700 (Fri, 27 Jul 2007)
New Revision: 19278

Log:
- remove passing down the goals


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-27 13:08:47 UTC (rev 19277)
+++ trunk/buildroot/Makefile	2007-07-27 14:16:00 UTC (rev 19278)
@@ -306,14 +306,12 @@
 export HOSTCFLAGS
 
 $(CONFIG)/conf:
-	$(MAKE) CC="$(HOSTCC)" MAKECMDGOALS="$(MAKECMDGOALS)" \
-		-C $(CONFIG) conf
+	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 $(CONFIG)/mconf:
-	$(MAKE) CC="$(HOSTCC)" MAKECMDGOALS="$(MAKECMDGOALS)" \
-		-C $(CONFIG) conf mconf
+	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
