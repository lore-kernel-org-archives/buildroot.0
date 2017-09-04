From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Sep 2017 06:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/mdadm: not available in static
	builds
Message-ID: <20170904044954.31001-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch9
added code to include dlfcn.h.

Fixes
http://autobuild.buildroot.net/results/163/163ad5a9f976662be8ca8664f91254f90fca8439/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mdadm/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index e0d606b5e..61d631cda 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # fork()
 	help
 	  Utility for managing Linux Software RAID arrays.
 
 	  http://neil.brown.name/blog/mdadm
+
+comment "mdadm needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
-- 
2.11.0
