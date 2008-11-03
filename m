From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  3 Nov 2008 02:37:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20081103103728.0DA953C930@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-03 02:37:27 -0800 (Mon, 03 Nov 2008)
New Revision: 23910

Log:
External toolchain C++ cross-compiler fix

External toolchain C++ cross-compiler fix

package/Makefile.in resets CXX to "" in TARGET_CONFIGURE_OPTS if
BR2_GCC_CROSS_CXX is not set to 'y'. However, when using an external
toolchain, BR2_GCC_CROSS_CXX is not set even if the toolchain has a
C++ cross-compiler.

This patch adds a new BR2_GCC_CROSS_CXX option in the external
toolchain configuration menu, so that just like BR2_INET_RPC,
BR2_INET_IPV6 and the others, it can be set according to the external
toolchain configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/toolchain/external-toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2008-11-03 10:32:59 UTC (rev 23909)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2008-11-03 10:37:27 UTC (rev 23910)
@@ -93,6 +93,12 @@
 	help
 	  Set this option if the external toolchain supports soft float.
 
+config BR2_GCC_CROSS_CXX
+	bool "Toolchain has C++ cross-compiler ?"
+	help
+	  Set this option if the external toolchain has a C++
+	  cross-compiler.
+
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
 	default "-Os -pipe"
