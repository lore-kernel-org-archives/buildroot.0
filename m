From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Aug 2007 07:18:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070824141849.E4530A65EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-24 07:18:47 -0700 (Fri, 24 Aug 2007)
New Revision: 19685

Log:
 remove _SKIP_CONFIGURE since it's pointless to try to run it on non-autotool'ed packages anyway (for now)


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-24 12:52:04 UTC (rev 19684)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-24 14:18:47 UTC (rev 19685)
@@ -310,7 +310,7 @@
 $(1)-install-staging:
 endif
 
-$(1)-build:		$(if $$($(2)_SKIP_CONFIGURE),$(1)-patch,$(1)-configure)\
+$(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD) \
 			$$($(2)_HOOK_POST_BUILD)
 
