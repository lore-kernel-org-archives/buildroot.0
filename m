From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:44:06 +0200
Subject: [Buildroot] [git commit] system: drop largefile depends
Message-ID: <20150401205856.067AB8191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93026a5770064088ad8ed16277ac010b4f71ee42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 9973cc2..3516056 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -89,7 +89,6 @@ config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -124,15 +123,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
-	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endchoice
 
