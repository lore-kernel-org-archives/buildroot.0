From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:52:14 +0200
Subject: [Buildroot] [git commit] package/mtd: add
 BR2_PACKAGE_MTD_UBIHEALTHD option
Message-ID: <20210607144657.E710B814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77a0167155c34379079662197874a5f38d49ade8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtd-utils-2.1.2 add ubihealthd daemon

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/Config.in | 4 ++++
 package/mtd/mtd.mk    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 590ca7f5ef..c7ad3b3cdc 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -137,6 +137,10 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 	bool "ubiformat"
 	default y
 
+config BR2_PACKAGE_MTD_UBIHEALTHD
+	bool "ubihealthd"
+	default y
+
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index c4fa56d260..121dfa554b 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -96,6 +96,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBICRC32)		+= ubicrc32
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIFORMAT)	+= ubiformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIHEALTHD)	+= ubihealthd
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIMKVOL)		+= ubimkvol
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINFO)		+= ubinfo
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINIZE)		+= ubinize
