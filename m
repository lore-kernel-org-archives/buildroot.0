From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:42 +0200
Subject: [Buildroot] [PATCH 26/30] package/restorecond: re-enable on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-27-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is now available on ARC, so we can allow the selection of
restorecond on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/restorecond/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 10ca74e351..31f85f2882 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RESTORECOND
 	bool "restorecond"
-	depends on !BR2_arc
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -18,6 +17,5 @@ config BR2_PACKAGE_RESTORECOND
 
 comment "restorecond needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
-- 
2.21.0
