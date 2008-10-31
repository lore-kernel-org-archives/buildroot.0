From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2008 15:13:28 +0100
Subject: [Buildroot] [PATCH] External toolchain C++ cross-compiler fix
Message-ID: <20081031151328.1baafffd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 toolchain/external-toolchain/Config.in |    6 ++++++
 1 file changed, 6 insertions(+)

Index: buildroot2/toolchain/external-toolchain/Config.in
===================================================================
--- buildroot2.orig/toolchain/external-toolchain/Config.in
+++ buildroot2/toolchain/external-toolchain/Config.in
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


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
