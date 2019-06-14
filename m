From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 23:03:21 +0200
Subject: [Buildroot] [PATCH 02/27] package/ecryptfs-utils: re-enable package
 on microblaze
In-Reply-To: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190614210346.121013-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package has a keyutils dependency causing build failure on Microblaze,
but keyutils build has been worked around with previous patch, so we can
re-enable package ecryptfs-utils on Microblaze by removing 'depends on
!BR2_microblaze'.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/ecryptfs-utils/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 6652d33e0e..b589368a6a 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	bool "ecryptfs-utils"
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
-	depends on !BR2_microblaze # keyutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
@@ -31,7 +30,6 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	  http://ecryptfs.org
 
 comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
-	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-- 
2.17.1
