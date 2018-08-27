From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Aug 2018 18:14:28 -0500
Subject: [Buildroot] [PATCH 2/2] Revert "package/aircrack-ng: powerpc arch
 requires altivec"
In-Reply-To: <1535411668-36286-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535411668-36286-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1535411668-36286-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 1f3f1fb8c7324c9a50383b1cafcbd2f9d74a91f9.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/aircrack-ng/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index d821c5a..f3e2bc4 100644
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
-- 
1.9.1
