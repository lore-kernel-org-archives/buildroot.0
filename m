From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 22:12:37 +0100
Subject: [Buildroot] [git commit] Revert "dmraid: disable on ARC arch"
Message-ID: <20140228133411.C6D9E9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35113c4c12a05324e003bd12b9236fa09c057b82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 262a4c0bf7fb64d632ae6d40c22a62380c0af65f.

Compiler error has been fixed, and building this package doesn't cause an
ICE anymore.

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index bfdd89b..028b46c 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # lvm2
-	# triggers gcc ice
-	depends on !BR2_arc
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -15,4 +13,3 @@ config BR2_PACKAGE_DMRAID
 comment "dmraid needs a toolchain w/ largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
-	depends on !BR2_arc
