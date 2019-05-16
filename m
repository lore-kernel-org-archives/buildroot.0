From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 16 May 2019 11:52:00 -0400
Subject: [Buildroot] [PATCH 1/1] package/busybox: select individual
 libraries when selecting SELinux support.
Message-ID: <20190516155200.86689-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

From the help test of individual binaries:

With this option enabled, each applet is a separate binary, which is needed for
proper operation with SELinux

As such, it only makes sense to select this option when SELinux support is
selected as well.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/busybox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index e5c5f89a4d..bab00bf835 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -42,6 +42,7 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
+	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	select BR2_PACKAGE_LIBSELINUX
 	help
 	  Enable SELinux support in BusyBox. Please note that
-- 
2.21.0
