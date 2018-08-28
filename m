From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:17:11 +0200
Subject: [Buildroot] [git commit] Revert "package/aircrack-ng: powerpc arch
 requires altivec"
Message-ID: <20180828213103.3BD658140F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d012b4d0f02452d49c7800b659bb1e9fb1f6d82b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1f3f1fb8c7324c9a50383b1cafcbd2f9d74a91f9.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index d821c5a0a2..f3e2bc4ef1 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,9 +4,6 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	# https://github.com/aircrack-ng/aircrack-ng/issues/1941
-	depends on BR2_POWERPC_CPU_HAS_ALTIVEC || \
-		!(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
