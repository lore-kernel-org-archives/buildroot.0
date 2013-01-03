From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Thu, 3 Jan 2013 13:20:01 +0530
Subject: [Buildroot] [PATCH 1/3] Add Perf tools support
Message-ID: <CAPDLWs8Qt07H1Y+ECrJjUMUHWhNd=tP__yFwNLkPA78n86E2HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
---
 linux/Config.in |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 9ebe0c9..cb52ecf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -284,6 +284,17 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.

+config BR2_LINUX_KERNEL_USERMODE_TOOLS_PERF
+	bool "perf"
+	help
+	  perf (aka "Perf Events" or perf tools, originally "Performance Counters
+	  for Linux") - is a performance analyzing tool in Linux. The user-space
+	  controlling utility, called 'perf' has a git-like interface with
subcommands.
+	  It is capable of statistical profiling of entire system (both kernel and
+	  user code), single CPU or severals threads.
+
+	  https://perf.wiki.kernel.org/index.php/Main_Page
+

 # Linux extensions
 source "linux/Config.ext.in"
-- 
1.7.10.4
