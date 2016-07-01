From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Jul 2016 17:14:39 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: improve help text and
	prompt
Message-ID: <1467386079-26051-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The way the help text and prompt for the kernel header version choice is
written can be misleading to some users.

Rewite them so it is more explicit.

Reported-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index af29676..1def30c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -8,12 +8,22 @@ choice
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
 	default BR2_KERNEL_HEADERS_4_6
 	help
-	  Select the version of kernel header files you wish to use.
-	  You must select the correct set of header files to match
-	  the kernel you intend to use on your target system.
+	  Select the kernel version to get headers from.
+
+	  The kernel headers must be at least as old as the oldest kernel
+	  you intend to run on your target.
+
+	  If you use Buildroot to build a kernel, then you can use
+	  the sources from that kernel as source for the headers.
+
+	  If you choose a custom version of the kernel headers, or choose
+	  to use the same sources as the kernel, you'll have to select
+	  (below) the series of that kernel, so that Buildroot can show
+	  or hide packages that have strong requirements on the kernel
+	  headers.
 
 	config BR2_KERNEL_HEADERS_AS_KERNEL
-		bool "Same as kernel"
+		bool "Same as kernel being built"
 		depends on BR2_LINUX_KERNEL
 
 	config BR2_KERNEL_HEADERS_3_2
@@ -98,7 +108,7 @@ choice
 	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_AS_KERNEL
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
-	  Set to the kernel headers series you manually set above.
+	  Specify the kernel headers series you manually selected, above.
 
 	  This is used to hide/show some packages that have strict
 	  requirements on the version of kernel headers.
-- 
2.7.4
