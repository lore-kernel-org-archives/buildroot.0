From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:27:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nfs-utils
Message-ID: <20070114032723.EF01E485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:27:22 -0800 (Sat, 13 Jan 2007)
New Revision: 17281

Log:
Use pre-generated files and do not run 'rpcgen'.


Added:
   trunk/buildroot/package/nfs-utils/nfs-utils-disable-rpcgen.patch


Changeset:
Added: trunk/buildroot/package/nfs-utils/nfs-utils-disable-rpcgen.patch
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils-disable-rpcgen.patch	                        (rev 0)
+++ trunk/buildroot/package/nfs-utils/nfs-utils-disable-rpcgen.patch	2007-01-14 03:27:22 UTC (rev 17281)
@@ -0,0 +1,18 @@
+diff -ur nfs-utils-1.0.10/utils/rquotad/Makefile.in nfs-utils-1.0.10-patched/utils/rquotad/Makefile.in
+--- nfs-utils-1.0.10/utils/rquotad/Makefile.in	2006-08-07 01:43:46.000000000 -0500
++++ nfs-utils-1.0.10-patched/utils/rquotad/Makefile.in	2007-01-13 21:24:26.971232703 -0600
+@@ -653,14 +653,6 @@
+ $(RPCGEN):
+ 	make -C $(top_srcdir)/tools/rpcgen all
+ 
+-$(GENFILES_XDR): %_xdr.c: %.x $(RPCGEN)
+-	test -f $@ && rm -rf $@ || true
+-	$(RPCGEN) -c -o $@ $<
+-
+-$(GENFILES_H): %.h: %.x $(RPCGEN)
+-	test -f $@ && rm -rf $@ || true
+-	$(RPCGEN) -h -o $@ $<
+-
+ #######################################################################
+ # The following allows the current practice of having
+ # daemons renamed during the install to include RPCPREFIX
