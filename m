From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Feb 2014 08:30:10 +0100
Subject: [Buildroot] [PATCH] ramsmp: not available on !MMU, needs fork
Message-ID: <1393486210-1391-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/aaa/aaa7f8e5ec72ce69805d6c1a5cde5ff47e1c118e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ramsmp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ramsmp/Config.in b/package/ramsmp/Config.in
index c379bb1..ecab6a4 100644
--- a/package/ramsmp/Config.in
+++ b/package/ramsmp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RAMSMP
 	bool "ramspeed/smp"
+	depends on BR2_USE_MMU # fork()
 	help
 	  RAMspeed/SMP is a free open source command line utility
 	  to measure cache and memory performance of multiprocessor machines.
-- 
1.8.3.2
