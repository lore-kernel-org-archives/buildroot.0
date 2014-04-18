From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 10:34:09 +0200
Subject: [Buildroot] [git commit] squashfs: do not build on !MMU systems
Message-ID: <20140418083508.2C9C39C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40988f824269fd181d933e2241c604b6b57af9e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/273/2738934fc23219a33fe1e07b3213b4e10266fc79//

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squashfs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index b091856..385df1a 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
 	help
 	  Tools to generate SquashFS filesystems.
