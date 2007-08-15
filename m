From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 02:47:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070815094749.A4F76A4758@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 02:47:49 -0700 (Wed, 15 Aug 2007)
New Revision: 19514

Log:
Remove fakeroot files after use to avoid rerun

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-15 09:46:29 UTC (rev 19513)
+++ trunk/buildroot/Makefile	2007-08-15 09:47:49 UTC (rev 19514)
@@ -199,6 +199,8 @@
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
+TARGETS+=erase-fakeroots
+
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
@@ -255,6 +257,8 @@
 	fi;
 	touch	$@
 
+erase-fakeroots:
+	rm -f $(STAGING_DIR)/.fakeroot*
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
