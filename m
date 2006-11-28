From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 09:04:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20061128170438.A38BB48584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 09:04:37 -0800 (Tue, 28 Nov 2006)
New Revision: 16708

Log:
- strip cruft off the pluto patch.


Modified:
   trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch


Changeset:
Modified: trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch
===================================================================
--- trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch	2006-11-28 16:59:17 UTC (rev 16707)
+++ trunk/buildroot/package/openswan/openswan-2.4.7-005-pluto.patch	2006-11-28 17:04:37 UTC (rev 16708)
@@ -60,14 +60,6 @@
  
  	whack_log(RC_COMMENT
  	    , "\"%s\"%s:   newest ISAKMP SA: #%ld; newest IPsec SA: #%ld; "
-Only in openswan-2.4.7/programs/pluto/: connections.o
-Only in openswan-2.4.7/programs/pluto/: cookie.o
-Only in openswan-2.4.7/programs/pluto/: crypt_dh.o
-Only in openswan-2.4.7/programs/pluto/: crypt_ke.o
-Only in openswan-2.4.7/programs/pluto/: crypt_utils.o
-Only in openswan-2.4.7/programs/pluto/: crypto.o
-Only in openswan-2.4.7/programs/pluto/: db_ops.o
-Only in openswan-2.4.7/programs/pluto/: defs.o
 diff -urp openswan-2.4.7.orig/programs/pluto/demux.c openswan-2.4.7/programs/pluto/demux.c
 --- openswan-2.4.7.orig/programs/pluto/demux.c	2005-10-06 02:57:26.000000000 +0200
 +++ openswan-2.4.7/programs/pluto/demux.c	2006-11-28 17:04:27.000000000 +0100
@@ -81,24 +73,6 @@
  
  	
  #endif
-Only in openswan-2.4.7/programs/pluto/: demux.o
-Only in openswan-2.4.7/programs/pluto/: dnskey.o
-Only in openswan-2.4.7/programs/pluto/: dpd.o
-Only in openswan-2.4.7/programs/pluto/: foodgroups.o
-Only in openswan-2.4.7/programs/pluto/: id.o
-Only in openswan-2.4.7/programs/pluto/: ike_alg.o
-Only in openswan-2.4.7/programs/pluto/: ike_alg_aes.o
-Only in openswan-2.4.7/programs/pluto/: ike_alginit.o
-Only in openswan-2.4.7/programs/pluto/: ikeping.o
-Only in openswan-2.4.7/programs/pluto/: ikev1_aggr.o
-Only in openswan-2.4.7/programs/pluto/: ikev1_quick.o
-Only in openswan-2.4.7/programs/pluto/: ipsec_doi.o
-Only in openswan-2.4.7/programs/pluto/: kernel.o
-Only in openswan-2.4.7/programs/pluto/: kernel_netlink.o
-Only in openswan-2.4.7/programs/pluto/: kernel_noklips.o
-Only in openswan-2.4.7/programs/pluto/: kernel_pfkey.o
-Only in openswan-2.4.7/programs/pluto/: keys.o
-Only in openswan-2.4.7/programs/pluto/: lex.o
 diff -urp openswan-2.4.7.orig/programs/pluto/log.c openswan-2.4.7/programs/pluto/log.c
 --- openswan-2.4.7.orig/programs/pluto/log.c	2005-07-18 21:40:15.000000000 +0200
 +++ openswan-2.4.7/programs/pluto/log.c	2006-11-28 16:56:53.000000000 +0100
@@ -134,11 +108,6 @@
  
  /* show status, usually on whack log */
  extern void show_status(void);
-Only in openswan-2.4.7/programs/pluto/: log.o
-Only in openswan-2.4.7/programs/pluto/: md5.o
-Only in openswan-2.4.7/programs/pluto/: nat_traversal.o
-Only in openswan-2.4.7/programs/pluto/: pending.o
-Only in openswan-2.4.7/programs/pluto/: pluto_constants.o
 diff -urp openswan-2.4.7.orig/programs/pluto/pluto_crypt.c openswan-2.4.7/programs/pluto/pluto_crypt.c
 --- openswan-2.4.7.orig/programs/pluto/pluto_crypt.c	2005-07-13 04:14:08.000000000 +0200
 +++ openswan-2.4.7/programs/pluto/pluto_crypt.c	2006-11-28 17:25:43.000000000 +0100
@@ -152,8 +121,6 @@
  	debug_prefix='!';
  
  	pluto_crypto_helper(fds[1], n);
-Only in openswan-2.4.7/programs/pluto/: pluto_crypt.o
-Only in openswan-2.4.7/programs/pluto/: plutoalg.o
 diff -urp openswan-2.4.7.orig/programs/pluto/plutomain.c openswan-2.4.7/programs/pluto/plutomain.c
 --- openswan-2.4.7.orig/programs/pluto/plutomain.c	2006-10-27 05:00:30.000000000 +0200
 +++ openswan-2.4.7/programs/pluto/plutomain.c	2006-11-28 17:00:56.000000000 +0100
@@ -192,16 +159,3 @@
  #ifdef VIRTUAL_IP
  	case '6':	/* --virtual_private */
  	    virtual_private = optarg;
-Only in openswan-2.4.7/programs/pluto/: plutomain.o
-Only in openswan-2.4.7/programs/pluto/: rcv_whack.o
-Only in openswan-2.4.7/programs/pluto/: rnd.o
-Only in openswan-2.4.7/programs/pluto/: server.o
-Only in openswan-2.4.7/programs/pluto/: sha1.o
-Only in openswan-2.4.7/programs/pluto/: spdb.o
-Only in openswan-2.4.7/programs/pluto/: spdb_print.o
-Only in openswan-2.4.7/programs/pluto/: spdb_struct.o
-Only in openswan-2.4.7/programs/pluto/: state.o
-Only in openswan-2.4.7/programs/pluto/: timer.o
-Only in openswan-2.4.7/programs/pluto/: vendor.o
-Only in openswan-2.4.7/programs/pluto/: virtual.o
-Only in openswan-2.4.7/programs/pluto/: xauth.o
