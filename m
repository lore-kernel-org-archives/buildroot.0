From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Nov 2008 00:56:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081107085603.10DE63C922@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-07 00:56:02 -0800 (Fri, 07 Nov 2008)
New Revision: 23955

Log:
Makefile.autotools.in: make MESSAGE output stand out

The following patch makes the MESSAGE Macro in Makefile.autotools.in
work.

I think it was originally intended to print the messages in bold type
but it doesn't appear to work correctly. This patch should work on all
platforms.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

(Fixed to not continously call tput)

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-11-07 08:15:53 UTC (rev 23954)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-11-07 08:56:02 UTC (rev 23955)
@@ -114,8 +114,8 @@
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = @echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
-TERM_BOLD = #$(shell tput bold)
-TERM_RESET = #$(shell tput rmso)
+TERM_BOLD := $(shell tput smso)
+TERM_RESET := $(shell tput rmso)
 
 # Utility programs used to build packages
 TAR ?= tar
