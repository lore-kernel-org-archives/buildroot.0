From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Jun 2008 11:38:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080620183846.6B3B23C732@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-20 11:38:44 -0700 (Fri, 20 Jun 2008)
New Revision: 22459

Log:
budybox: 1.10.3 udhcpc fix


Added:
   trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.10.3-udhcpc.patch	2008-06-20 18:38:44 UTC (rev 22459)
@@ -0,0 +1,11 @@
+--- busybox-1.10.3/networking/udhcp/clientsocket.c	Sat Apr 19 06:03:13 2008
++++ busybox-1.10.3-udhcpc/networking/udhcp/clientsocket.c	Fri Jun 20 16:48:32 2008
+@@ -76,7 +76,7 @@
+ 		BPF_STMT(BPF_LD|BPF_W|BPF_IND, 0),
+ 		BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, SERVER_AND_CLIENT_PORTS, 0, 1),	/* L3, L4 */
+ 		/* returns */
+-		BPF_STMT(BPF_RET|BPF_K, (~(uint32_t)0) ),               /* L3: pass */
++		BPF_STMT(BPF_RET|BPF_K, 0x0fffffff),                    /* L3: pass */
+ 		BPF_STMT(BPF_RET|BPF_K, 0),                             /* L4: reject */
+ 	};
+ 	static const struct sock_fprog filter_prog = {
