From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  7 Oct 2008 00:24:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpcap
Message-ID: <20081007072441.B1C65F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-07 00:24:41 -0700 (Tue, 07 Oct 2008)
New Revision: 23614

Log:
libpcap: bump to version 0.9.8

This patch bumps the version to 0.9.8 and refreshes the patch against that
version. Fixes bug #5284.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/libpcap/libpcap.patch


Changeset:
Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2008-10-07 07:20:32 UTC (rev 23613)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2008-10-07 07:24:41 UTC (rev 23614)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPCAP_VERSION:=0.9.5
+LIBPCAP_VERSION:=0.9.8
 LIBPCAP_DIR:=$(BUILD_DIR)/libpcap-$(LIBPCAP_VERSION)
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VERSION).tar.gz

Modified: trunk/buildroot/package/libpcap/libpcap.patch
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.patch	2008-10-07 07:20:32 UTC (rev 23613)
+++ trunk/buildroot/package/libpcap/libpcap.patch	2008-10-07 07:24:41 UTC (rev 23614)
@@ -1,6 +1,8 @@
---- libpcap-0.8.3/Makefile.in.orig	2005-01-17 19:04:41.291056960 -0500
-+++ libpcap-0.8.3/Makefile.in	2005-01-17 19:04:47.836061968 -0500
-@@ -100,7 +100,7 @@
+Index: libpcap-0.9.8/Makefile.in
+===================================================================
+--- libpcap-0.9.8.orig/Makefile.in	2007-07-24 04:35:15.000000000 +0200
++++ libpcap-0.9.8/Makefile.in	2008-10-07 09:23:01.000000000 +0200
+@@ -103,7 +103,7 @@
  
  libpcap.a: $(OBJ)
  	@rm -f $@
@@ -8,4 +10,4 @@
 +	$(AR) rc $@ $(OBJ) $(LIBS)
  	$(RANLIB) $@
  
- scanner.c: $(srcdir)/scanner.l
+ shared: libpcap.$(DYEXT)
