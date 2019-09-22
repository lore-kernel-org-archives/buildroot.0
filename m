From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:40 +0200
Subject: [Buildroot] [PATCH 24/30] package/selinux-python: re-enable
 audit2allow on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-25-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

checkpolicy is now available on ARC, so we can re-enable building
audit2allow on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 3b6eff88af..2013bd6445 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	depends on BR2_USE_MMU # sepolgen
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
 	depends on !BR2_STATIC_LIBS # sepolgen
-	depends on !BR2_arc # checkpolicy
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	select BR2_PACKAGE_SEMODULE_UTILS
@@ -34,7 +33,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 
 comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 
-- 
2.21.0
