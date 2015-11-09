From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 21:40:32 +0100
Subject: [Buildroot] [git commit] Revert "system: Fix warning when selecting
	systemd"
Message-ID: <20151109205943.8954F81DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adcc48e0b25fb6a9759bc8d889badbbad9e02954
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b4718c3a28fc3b178253b24bd6fbb8540a724c7e.

The BR2_ROOTFS_MERGED_USR symbol is used to activate various workarounds for
a merged /usr by packages, so it should be active even with a custom rootfs
skeleton.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 92712a8..4d07010 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -92,7 +92,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_ROOTFS_MERGED_USR if BR2_ROOTFS_SKELETON_DEFAULT
+	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
 comment "systemd needs (e)glibc toolchain, headers >= 3.10"
