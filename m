From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:10 +0200
Subject: [Buildroot] [PATCH 05/24] system: systemd only really supports a
	R/W rootfs
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <6b97ab1e3d3e894a4289da9c7954ad0dbfb363f5.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supporting a R/O rootfs needs a bit more love to be fully operational.
This will come in later patches...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index 2d20230..4f9f270 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -94,6 +94,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
+	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 comment "systemd needs (e)glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-- 
2.7.4
