From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:21:31 +0200
Subject: [Buildroot] [git commit] mtd: Add ubiblock tool
Message-ID: <20140410204503.E06FB9C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4750552e3eb87235b6a512bd6ca911e4bfb1bb26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new release adds a new userspace tool called ubiblock. This is
used to control UBI's new block device feature which will be added
in Linux v3.15.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/Config.in |    4 ++++
 package/mtd/mtd.mk    |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 26f59ed..dd090a0 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -157,4 +157,8 @@ config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	bool "ubiupdatevol"
 	default y
 
+config BR2_PACKAGE_MTD_UBIBLOCK
+	bool "ubiblock"
+	default y
+
 endif
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 9dde40a..14e8174 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -74,6 +74,7 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRENAME)	+= ubirename
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)	+= ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)	+= ubirsvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)	+= ubiblock
 
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
