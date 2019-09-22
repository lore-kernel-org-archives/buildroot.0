From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:27 +0200
Subject: [Buildroot] [PATCH 11/30] package/busybox: selinux support now
 available on !glibc configs
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-12-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux can now be selected for non-glibc toolchains, so
BR2_PACKAGE_BUSYBOX_SELINUX can loose its BR2_TOOLCHAIN_USES_GLIBC
dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index bab00bf835..cddf9f3908 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,6 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	select BR2_PACKAGE_LIBSELINUX
-- 
2.21.0
