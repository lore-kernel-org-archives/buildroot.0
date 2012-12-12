From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 19:44:22 +0100
Subject: [Buildroot] [PATCH] gadgetfs-test: requires thread support
Message-ID: <1355337862-6519-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/012914ed010eac94a2f7bfe18d8375cdb2fe9f06/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gadgetfs-test/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index 276ec54..a582db6 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GADGETFS_TEST
 	bool "gadgetfs-test"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Test program for gadgetfs from linux-usb.org
 
@@ -10,3 +11,6 @@ config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
+
+comment "gadgetfs-test requires thread support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.9.5
