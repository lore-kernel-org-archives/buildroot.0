From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:28 -0300
Subject: [Buildroot] [PATCH v3 09/15] system: drop largefile depends
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
 
-- 
2.0.5
