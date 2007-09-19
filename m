From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 03:31:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070919103115.7E24FA6881@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 03:31:14 -0700 (Wed, 19 Sep 2007)
New Revision: 19887

Log:
- put back accidentally removed patch that is not needed for 0.5.1 anymore


Added:
   trunk/buildroot/package/vpnc/vpnc-0.4.0.patch


Changeset:
Added: trunk/buildroot/package/vpnc/vpnc-0.4.0.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc-0.4.0.patch	2007-09-19 10:31:14 UTC (rev 19887)
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
