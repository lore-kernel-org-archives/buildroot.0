From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 01:50:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20070919085055.59D8FA611A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 01:50:54 -0700 (Wed, 19 Sep 2007)
New Revision: 19881

Log:
- fix args for UDP_INC_STATS_BH


Modified:
   trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-natt.patch


Changeset:
Modified: trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-natt.patch
===================================================================
--- trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-natt.patch	2007-09-19 08:23:09 UTC (rev 19880)
+++ trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-natt.patch	2007-09-19 08:50:54 UTC (rev 19881)
@@ -109,9 +109,9 @@
 -			return -ret;
 + 			if(xfrm4_rcv_encap_func != NULL) {
 + 			  ret = (*xfrm4_rcv_encap_func)(skb, up->encap_type);
-+ 			  UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS);
++ 			  UDP_INC_STATS_BH(UDP_MIB_INDATAGRAMS, up->pcflag);
 + 			} else {
-+ 			  UDP_INC_STATS_BH(UDP_MIB_INERRORS);
++ 			  UDP_INC_STATS_BH(UDP_MIB_INERRORS, up->pcflag);
 + 			  ret = 1;
 + 			}
 +			return ret;
