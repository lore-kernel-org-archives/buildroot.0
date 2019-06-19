From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:14:51 +0200
Subject: [Buildroot] [git commit] package/ecryptfs-utils: re-enable package
 on microblaze
Message-ID: <20190619121416.1E0C0822C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23efe3d5122e42871f646d1607e424eff521567f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ecryptfs-utils was not available on Microblaze due to its dependency
on keyutils, which itself was not available on Microblaze due to build
issues. However, now that keyutils has been re-enabled on Microblaze,
we can also re-enable ecryptfs-utils on this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
