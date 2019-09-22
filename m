From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:41 +0200
Subject: [Buildroot] [PATCH 25/30] package/busybox: re-enable SELinux
 support on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-26-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is now available on ARC, so we can re-enable the SELinux
support in Busybox on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index cddf9f3908..be8b0e4799 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,6 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_arc
 	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	select BR2_PACKAGE_LIBSELINUX
 	help
-- 
2.21.0
