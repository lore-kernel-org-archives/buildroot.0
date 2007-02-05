From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  5 Feb 2007 03:20:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070205112039.4823F48657@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-05 03:20:37 -0800 (Mon, 05 Feb 2007)
New Revision: 17776

Log:
- delete old, unneeded patch


Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch


Changeset:
Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch	2007-02-05 01:17:09 UTC (rev 17775)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch	2007-02-05 11:20:37 UTC (rev 17776)
@@ -1,35 +0,0 @@
-diff -Naur linux-headers-2.6.19.orig/include/linux/if_addr.h linux-headers-2.6.19/include/linux/if_addr.h
---- linux-headers-2.6.19.orig/include/linux/if_addr.h	2006-11-29 13:57:37.000000000 -0800
-+++ linux-headers-2.6.19/include/linux/if_addr.h	2006-11-30 08:28:48.000000000 -0800
-@@ -52,4 +52,7 @@
- 	__u32	tstamp; /* updated timestamp, hundredths of seconds */
- };
- 
-+#define IFA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct ifaddrmsg))))
-+#define IFA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct ifaddrmsg))
-+
- #endif
-diff -Naur linux-headers-2.6.19.orig/include/linux/if_link.h linux-headers-2.6.19/include/linux/if_link.h
---- linux-headers-2.6.19.orig/include/linux/if_link.h	2006-11-29 13:57:37.000000000 -0800
-+++ linux-headers-2.6.19/include/linux/if_link.h	2006-11-30 08:28:48.000000000 -0800
-@@ -82,6 +82,9 @@
- 
- #define IFLA_MAX (__IFLA_MAX - 1)
- 
-+#define IFLA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct ifinfomsg))))
-+#define IFLA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct ifinfomsg))
-+
- /* ifi_flags.
- 
-    IFF_* flags.
-diff -Naur linux-headers-2.6.19.orig/include/linux/rtnetlink.h linux-headers-2.6.19/include/linux/rtnetlink.h
---- linux-headers-2.6.19.orig/include/linux/rtnetlink.h	2006-11-29 13:57:37.000000000 -0800
-+++ linux-headers-2.6.19/include/linux/rtnetlink.h	2006-11-30 08:28:48.000000000 -0800
-@@ -2,6 +2,7 @@
- #define __LINUX_RTNETLINK_H
- 
- #include <linux/netlink.h>
-+#include <linux/if_addr.h>
- #include <linux/if_link.h>
- 
- /****
