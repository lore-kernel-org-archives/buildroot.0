From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:43:26 +0200
Subject: [Buildroot] [git commit] mfgtools: add gcc version dependency
Message-ID: <20161029134351.C8CB880287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=690735ab155ee9447137bd061d7c9b4189b01ce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MfgTools requires gcc >= 4.8 since it needs C++11 support.

Fixes the following autobuild issues:
http://autobuild.buildroot.net/results/c8cbc4e5296af91be5fa8b17871bedf08b6a2697
http://autobuild.buildroot.net/results/fadabb38d8dde6f2be85fbc286b060e2f3e82f65

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
