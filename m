From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 28 Oct 2016 16:32:44 +0200
Subject: [Buildroot] [PATCH] mfgtools: add gcc version dependency
Message-ID: <20161028143244.29212-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MfgTools requires gcc >= 4.8 since it needs C++11 support.

Fixes the following autobuild issues:
http://autobuild.buildroot.net/results/c8cbc4e5296af91be5fa8b17871bedf08b6a2697
http://autobuild.buildroot.net/results/fadabb38d8dde6f2be85fbc286b060e2f3e82f65

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/mfgtools/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 8bba9e2..1cb5a7f 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -1,6 +1,10 @@
+comment "mfgtools needs host gcc >= 4.8"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_HOST_MFGTOOLS
 	bool "host mfgtools"
 	depends on BR2_arm
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # needs C++11
 	help
 	  This package contains the Freescale manufacturing tool.
 	  It is designed to program firmware to i.MX boards during
-- 
2.9.3
