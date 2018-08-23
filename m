From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 23 Aug 2018 17:19:28 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/linux-headers: add help text for
 manual header selection
Message-ID: <20180823161930.18461-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add kconfig help text that explains how to manually specify an
official Linux version to use for the kernel headers.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 package/linux-headers/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index adac3f6398..5c20c997f9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -77,6 +77,14 @@ config BR2_KERNEL_HEADERS_4_17
 
 config BR2_KERNEL_HEADERS_VERSION
 	bool "Manually specified Linux version"
+	help
+	  This option allows you to use a specific official version from
+	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
+
+	  Note: you cannot use this option to select a _longterm_ 2.6
+	  kernel, because these kernels are not located at the standard
+	  URL at kernel.org. Instead, select "Custom tarball" and
+	  specify the right URL directly.
 
 endchoice
 
-- 
2.17.1
