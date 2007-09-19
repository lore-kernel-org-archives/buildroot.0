From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 02:20:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20070919092006.58C37A680C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 02:20:04 -0700 (Wed, 19 Sep 2007)
New Revision: 19883

Log:
- add missing include


Modified:
   trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch


Changeset:
Modified: trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch
===================================================================
--- trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch	2007-09-19 09:08:10 UTC (rev 19882)
+++ trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch	2007-09-19 09:20:04 UTC (rev 19883)
@@ -4408,7 +4408,7 @@
 +
 +#ifdef __KERNEL__
 +#include "ipsec_kversion.h"
-+
++#include <linux/ip.h>		/* struct iphdr */
 +/* Set number of ipsecX virtual devices here. */
 +/* This must be < exp(field width of IPSEC_DEV_FORMAT) */
 +/* It must also be reasonable so as not to overload the memory and CPU */
@@ -4554,16 +4554,16 @@
 +#ifdef CONFIG_KLIPS_DEBUG
 +extern void ipsec_print_ip(struct iphdr *ip);
 +
-+	#define KLIPS_PRINT(flag, format, args...) \
++#	define KLIPS_PRINT(flag, format, args...) \
 +		((flag) ? printk(KERN_INFO format , ## args) : 0)
-+	#define KLIPS_PRINTMORE(flag, format, args...) \
++#	define KLIPS_PRINTMORE(flag, format, args...) \
 +		((flag) ? printk(format , ## args) : 0)
-+	#define KLIPS_IP_PRINT(flag, ip) \
++#	define KLIPS_IP_PRINT(flag, ip) \
 +		((flag) ? ipsec_print_ip(ip) : 0)
 +#else /* CONFIG_KLIPS_DEBUG */
-+	#define KLIPS_PRINT(flag, format, args...) do ; while(0)
-+	#define KLIPS_PRINTMORE(flag, format, args...) do ; while(0)
-+	#define KLIPS_IP_PRINT(flag, ip) do ; while(0)
++#	define KLIPS_PRINT(flag, format, args...) do ; while(0)
++#	define KLIPS_PRINTMORE(flag, format, args...) do ; while(0)
++#	define KLIPS_IP_PRINT(flag, ip) do ; while(0)
 +#endif /* CONFIG_KLIPS_DEBUG */
 +
 +
