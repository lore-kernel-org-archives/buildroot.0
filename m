From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:26:53 +0200
Subject: [Buildroot] [git commit] babeld: needs MMU as it uses fork()
Message-ID: <20160703082717.8BB1080F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0b11058511642d4dc6fd26abbb2419b959a9806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/986953a9bb49cd68338dc15e1a2f96045e44bf02/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/babeld/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/babeld/Config.in b/package/babeld/Config.in
index 67f499c..5d08c08 100644
--- a/package/babeld/Config.in
+++ b/package/babeld/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BABELD
 	bool "babeld"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Babel is a loop-avoiding distance-vector routing protocol for IPv6
 	  and IPv4 with fast convergence properties.
