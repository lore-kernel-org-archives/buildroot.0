From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:21:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822162114.3B036A6132@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:21:13 -0700 (Wed, 22 Aug 2007)
New Revision: 19654

Log:
- reinstate accidentally deleted hunk


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:19:10 UTC (rev 19653)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:21:13 UTC (rev 19654)
@@ -98,7 +98,7 @@
 
 # UPPERCASE Macro -- transform its argument to uppercase and replace dots and 
 # hyphens to underscores
-UPPERCASE = echo $(1) | tr "a-z.-" "A-Z__"
+UPPERCASE = $(shell echo $(1) | tr "a-z.-" "A-Z__")
 
 # Define extrators for different archive suffixes
 INFLATE.bz2 = $(BZCAT)
