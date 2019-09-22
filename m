From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:33 +0200
Subject: [Buildroot] [PATCH 17/30] package/restorecond: now available on
 !glibc configs
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-18-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux can now be built on !glibc configurations, so we can
re-enable restorecond on !glibc configurations as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/restorecond/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 54a5545a12..10ca74e351 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_RESTORECOND
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -21,4 +20,4 @@ comment "restorecond needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
+		BR2_STATIC_LIBS
-- 
2.21.0
