Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21046C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDDAE826A8;
	Mon, 20 Feb 2023 23:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDAE826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMAXTb75eOXi; Mon, 20 Feb 2023 23:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B115A83E22;
	Mon, 20 Feb 2023 23:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B115A83E22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2D51BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 912E161796
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912E161796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PaBwVF4GnTj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9615361761
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9615361761
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93080828C8; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:29:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 327fab5b9d45891233ff647d5b352cc94b3c27ac
X-Git-Newrev: 1567516d8984a4bddfbee30ee69c771cf3f8e224
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.93080828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/upx: bump to version
 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1567516d8984a4bddfbee30ee69c771cf3f8e224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- cmake must be used since
  https://github.com/upx/upx/commit/c7d8b6fed1b551158540e1d2e884dc224fce474c
- ucl and zlib are directly included in upx since
  https://github.com/upx/upx/commit/61e1366122f8d1b9e2434a8103e7af00a35ea902

https://github.com/upx/upx/blob/v4.0.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch | 80 ----------------------
 package/upx/upx.hash                               |  2 +-
 package/upx/upx.mk                                 | 22 +-----
 3 files changed, 4 insertions(+), 100 deletions(-)

diff --git a/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch b/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
deleted file mode 100644
index 6fae9cac0e..0000000000
--- a/package/upx/0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 3781df9da23840e596d5e9e8493f22666802fe6c Mon Sep 17 00:00:00 2001
-From: John Reiser <jreiser@BitWagon.com>
-Date: Fri, 11 Dec 2020 13:38:18 -0800
-Subject: [PATCH] Check DT_REL/DT_RELA, DT_RELSZ/DT_RELASZ
-
-https://github.com/upx/upx/issues/421
-	modified:   p_lx_elf.cpp
-
-[Retrieved from:
-https://github.com/upx/upx/commit/3781df9da23840e596d5e9e8493f22666802fe6c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/p_lx_elf.cpp | 34 +++++++++++++++++++++++++++++-----
- 1 file changed, 29 insertions(+), 5 deletions(-)
-
-diff --git a/src/p_lx_elf.cpp b/src/p_lx_elf.cpp
-index 182db192f..3a4101cf7 100644
---- a/src/p_lx_elf.cpp
-+++ b/src/p_lx_elf.cpp
-@@ -2222,8 +2222,20 @@ bool PackLinuxElf32::canPack()
-                         int z_rsz = dt_table[Elf32_Dyn::DT_RELSZ];
-                         if (z_rel && z_rsz) {
-                             unsigned rel_off = get_te32(&dynseg[-1+ z_rel].d_val);
-+                            if ((unsigned)file_size <= rel_off) {
-+                                char msg[70]; snprintf(msg, sizeof(msg),
-+                                     "bad Elf32_Dynamic[DT_REL] %#x\n",
-+                                     rel_off);
-+                                throwCantPack(msg);
-+                            }
-                             Elf32_Rel *rp = (Elf32_Rel *)&file_image[rel_off];
-                             unsigned relsz   = get_te32(&dynseg[-1+ z_rsz].d_val);
-+                            if ((unsigned)file_size <= relsz) {
-+                                char msg[70]; snprintf(msg, sizeof(msg),
-+                                     "bad Elf32_Dynamic[DT_RELSZ] %#x\n",
-+                                     relsz);
-+                                throwCantPack(msg);
-+                            }
-                             Elf32_Rel *last = (Elf32_Rel *)(relsz + (char *)rp);
-                             for (; rp < last; ++rp) {
-                                 unsigned r_va = get_te32(&rp->r_offset);
-@@ -2562,14 +2574,26 @@ PackLinuxElf64::canPack()
-                         int z_rel = dt_table[Elf64_Dyn::DT_RELA];
-                         int z_rsz = dt_table[Elf64_Dyn::DT_RELASZ];
-                         if (z_rel && z_rsz) {
--                            unsigned rel_off = get_te64(&dynseg[-1+ z_rel].d_val);
-+                            upx_uint64_t rel_off = get_te64(&dynseg[-1+ z_rel].d_val);
-+                            if ((u64_t)file_size <= rel_off) {
-+                                char msg[70]; snprintf(msg, sizeof(msg),
-+                                     "bad Elf64_Dynamic[DT_RELA] %#llx\n",
-+                                     rel_off);
-+                                throwCantPack(msg);
-+                            }
-                             Elf64_Rela *rp = (Elf64_Rela *)&file_image[rel_off];
--                            unsigned relsz   = get_te64(&dynseg[-1+ z_rsz].d_val);
-+                            upx_uint64_t relsz   = get_te64(&dynseg[-1+ z_rsz].d_val);
-+                            if ((u64_t)file_size <= relsz) {
-+                                char msg[70]; snprintf(msg, sizeof(msg),
-+                                     "bad Elf64_Dynamic[DT_RELASZ] %#llx\n",
-+                                     relsz);
-+                                throwCantPack(msg);
-+                            }
-                             Elf64_Rela *last = (Elf64_Rela *)(relsz + (char *)rp);
-                             for (; rp < last; ++rp) {
--                                unsigned r_va = get_te64(&rp->r_offset);
-+                                upx_uint64_t r_va = get_te64(&rp->r_offset);
-                                 if (r_va == user_init_ava) { // found the Elf64_Rela
--                                    unsigned r_info = get_te64(&rp->r_info);
-+                                    upx_uint64_t r_info = get_te64(&rp->r_info);
-                                     unsigned r_type = ELF64_R_TYPE(r_info);
-                                     if (Elf64_Ehdr::EM_AARCH64 == e_machine
-                                     &&  R_AARCH64_RELATIVE == r_type) {
-@@ -2581,7 +2605,7 @@ PackLinuxElf64::canPack()
-                                     }
-                                     else {
-                                         char msg[50]; snprintf(msg, sizeof(msg),
--                                            "bad relocation %#x DT_INIT_ARRAY[0]",
-+                                            "bad relocation %#llx DT_INIT_ARRAY[0]",
-                                             r_info);
-                                         throwCantPack(msg);
-                                     }
diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 7f3698ca0d..9f7c40c819 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  47774df5c958f2868ef550fb258b97c73272cb1f44fe776b798e393465993714  upx-3.96-src.tar.xz
+sha256  77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190  upx-4.0.1-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index e693a70db1..ef346b2310 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,28 +4,12 @@
 #
 ################################################################################
 
-UPX_VERSION = 3.96
+UPX_VERSION = 4.0.1
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
 UPX_CPE_ID_VENDOR = upx_project
+UPX_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# 0001-Check-DT_REL-DT_RELA-DT_RELSZ-DT_RELASZ.patch
-UPX_IGNORE_CVES += CVE-2021-20285
-
-HOST_UPX_DEPENDENCIES = host-ucl host-zlib
-
-# We need to specify all, otherwise the default target only prints a message
-# stating to "please choose a target for 'make'"... :-(
-define HOST_UPX_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		UPX_UCLDIR=$(HOST_DIR) CXXFLAGS_WERROR= -C $(@D) all
-endef
-
-# UPX has no install procedure, so install it manually.
-define HOST_UPX_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/bin/upx
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
