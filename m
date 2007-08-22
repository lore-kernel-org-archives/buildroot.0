From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:56:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822165636.0E8F4A614D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:56:36 -0700 (Wed, 22 Aug 2007)
New Revision: 19657

Log:
- if $(PKG)_SKIP_CONFIGURE is non-empty then ./configure is skipped


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:44:41 UTC (rev 19656)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:56:36 UTC (rev 19657)
@@ -310,7 +310,8 @@
 $(1)-install-staging:
 endif
 
-$(1)-build:		$(1)-configure $$($(2)_TARGET_BUILD) \
+$(1)-build:		$(if $$($(2)_SKIP_CONFIGURE),$(1)-patch,$(1)-configure)\
+			$$($(2)_TARGET_BUILD) \
 			$$($(2)_HOOK_POST_BUILD)
 
 $(1)-configure:		$(1)-autoreconf $$($(2)_TARGET_CONFIGURE)
