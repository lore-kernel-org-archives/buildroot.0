From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:29:28 +0200
Subject: [Buildroot] [git commit] system: systemd only really supports a R/W
	rootfs
Message-ID: <20160705132942.34400821FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=886f3109bc6e77fa1a6b7edb9647a3c4ab0ec431
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Supporting a R/O rootfs needs a bit more love to be fully operational.
This will come in later patches...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index 385d305..b895db9 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -94,6 +94,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
+	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 comment "systemd needs a glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
