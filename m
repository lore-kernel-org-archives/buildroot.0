From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:18:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20070717001855.8D4E330063@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:18:54 -0700 (Mon, 16 Jul 2007)
New Revision: 19115

Log:
Allow selection of RPC and IPv6 options for an external toolchain.


Modified:
   trunk/buildroot/toolchain/external-toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-07-16 22:21:15 UTC (rev 19114)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-07-17 00:18:54 UTC (rev 19115)
@@ -74,6 +74,18 @@
 	help
 	  Enable large file (files > 2 GB) support
 
+config BR2_INET_IPV6
+	bool "Enable IPv6"
+	default n
+	help
+	    Enable IPv6.
+
+config BR2_INET_RPC
+	bool "Enable RPC"
+	default n
+	help
+	    Enable RPC. RPC support is needed for nfs.
+
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	default n
