From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 12:56:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080331195658.EF1153C495@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 12:56:58 -0700 (Mon, 31 Mar 2008)
New Revision: 21601

Log:
avahi: bump version


Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/avahi/uclibc.patch


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-03-31 19:50:05 UTC (rev 21600)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-03-31 19:56:58 UTC (rev 21601)
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION:=0.6.21
+AVAHI_VERSION:=0.6.22
 AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VERSION)
 AVAHI_SITE:=http://www.avahi.org/download/
 AVAHI_SOURCE:=avahi-$(AVAHI_VERSION).tar.gz
@@ -120,6 +120,7 @@
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 		--disable-glib \
+		--disable-gobject \
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gtk \

Modified: trunk/buildroot/package/avahi/uclibc.patch
===================================================================
--- trunk/buildroot/package/avahi/uclibc.patch	2008-03-31 19:50:05 UTC (rev 21600)
+++ trunk/buildroot/package/avahi/uclibc.patch	2008-03-31 19:56:58 UTC (rev 21601)
@@ -1,11 +1,11 @@
-diff -urN avahi-0.6.14-orig/avahi-core/socket.c avahi-0.6.14/avahi-core/socket.c
---- avahi-0.6.14-orig/avahi-core/socket.c	2006-08-31 10:18:03.000000000 -0700
-+++ avahi-0.6.14/avahi-core/socket.c	2006-09-21 19:01:31.000000000 -0700
-@@ -394,13 +394,13 @@
+diff -urpN avahi-0.6.22.orig/avahi-core/socket.c avahi-0.6.22/avahi-core/socket.c
+--- avahi-0.6.22.orig/avahi-core/socket.c	2007-12-16 22:03:08.000000000 +0100
++++ avahi-0.6.22/avahi-core/socket.c	2008-03-31 17:13:24.000000000 +0200
+@@ -394,13 +394,13 @@ int avahi_open_socket_ipv6(int no_reuse)
          avahi_log_warn("IPV6_UNICAST_HOPS failed: %s", strerror(errno));
          goto fail;
      }
--    
+-
 +#ifdef IPV6_V6ONLY
      yes = 1;
      if (setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &yes, sizeof(yes)) < 0) {
