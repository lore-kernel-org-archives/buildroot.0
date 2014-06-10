From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 23:27:40 +0200
Subject: [Buildroot] [PATCH] flann: disable with the problematic NIOS II
	toolchain
Message-ID: <1402435660-6095-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/062/0620bf8d60aa57949cede0c5b3920ef5446fe98b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 6185b12..a3af7c1 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_PREFER_STATIC_LIB
+	# triggers an assert in the linker of this toolchain
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
-- 
2.0.0
