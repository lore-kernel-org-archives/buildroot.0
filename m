From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:45 -0000
Subject: [Buildroot] [git commit] package/busybox: select individual
 libraries when SELinux is enabled
Message-ID: <20190602201234.688418EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=769d4c6160a106a57271ff8ffc7c2011c39bfad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the help test of individual binaries:

  With this option enabled, each applet is a separate binary, which is
  needed for proper operation with SELinux

As such, it makes sense to select this option when SELinux support is
selected as well.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
