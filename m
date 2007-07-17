From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 12:16:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070717191636.16ED6A6825@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 12:16:32 -0700 (Tue, 17 Jul 2007)
New Revision: 19143

Log:
vpnc needs an include dir

Added:
   trunk/buildroot/package/vpnc/vpnc-0.4.0.patch


Changeset:
Added: trunk/buildroot/package/vpnc/vpnc-0.4.0.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	2007-07-17 19:16:32 UTC (rev 19143)
@@ -0,0 +1,12 @@
+diff -urN vpnc-0.4.0-0rig/Makefile vpnc-0.4.0/Makefile
+--- vpnc-0.4.0-0rig/Makefile	2007-02-19 21:51:12.000000000 +0100
++++ vpnc-0.4.0/Makefile	2007-07-17 19:59:53.000000000 +0200
+@@ -35,7 +35,7 @@
+ RELEASE_VERSION := $(shell cat VERSION)
+ 
+ CC=gcc
+-CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g
++CFLAGS += -W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g -I$(INCLUDE)
+ CPPFLAGS = -DVERSION=\"$(VERSION)\"
+ LDFLAGS = -g $(shell libgcrypt-config --libs)
+ CFLAGS +=  $(shell libgcrypt-config --cflags)
