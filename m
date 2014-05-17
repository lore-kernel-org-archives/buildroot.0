From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 11:17:44 +0200
Subject: [Buildroot] [PATCH] tstools: uses fork() therefore needs MMU
Message-ID: <1400318264-1926-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/4f6/4f611e085a3e21319a98f5383adf2caac77a0bd6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tstools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 24d4403..6712b0f 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TSTOOLS
 	bool "tstools"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  This is a set of cross-platform command line tools for
 	  working with MPEG data
@@ -18,3 +19,4 @@ config BR2_PACKAGE_TSTOOLS
 
 comment "tstools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU
-- 
1.9.3
