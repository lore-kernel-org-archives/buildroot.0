Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C35AC3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 14:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CFAC40231;
	Wed, 31 Jul 2024 14:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ux8WPUW5goWB; Wed, 31 Jul 2024 14:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F3E40426
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F3E40426;
	Wed, 31 Jul 2024 14:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE411BF4E3
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7877F40B3D
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvDGytVxUQ12 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 14:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::1908;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6964C409C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6964C409C5
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::1908])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6964C409C5
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 14:55:58 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WYwBy5Mtxz1Fn;
 Wed, 31 Jul 2024 16:55:54 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WYwBy1k0NzVn0; Wed, 31 Jul 2024 16:55:54 +0200 (CEST)
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 16:55:04 +0200
Message-Id: <20240731145504.365492-3-philip-dylan@gleonec.bzh>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: [Buildroot] [PATCH 2/2] configs/mx6sx_udoo_neo_defconfig: add hashes
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add hashes for uboot and linux, and enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES.
Modify .checkpackageignore to enable the hash check for the Udoo Neo
config.

Signed-off-by: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
---
 .checkpackageignore                                     | 1 -
 board/udoo/neo/patches/linux-headers/linux-headers.hash | 1 +
 board/udoo/neo/patches/linux/linux.hash                 | 2 ++
 board/udoo/neo/patches/uboot/uboot.hash                 | 2 ++
 configs/mx6sx_udoo_neo_defconfig                        | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/udoo/neo/patches/linux-headers/linux-headers.hash
 create mode 100644 board/udoo/neo/patches/linux/linux.hash
 create mode 100644 board/udoo/neo/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 028b63b4d3..fe5d2618c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -202,7 +202,6 @@ configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
-configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen6sx_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/udoo/neo/patches/linux-headers/linux-headers.hash b/board/udoo/neo/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/udoo/neo/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/udoo/neo/patches/linux/linux.hash b/board/udoo/neo/patches/linux/linux.hash
new file mode 100644
index 0000000000..68677589fe
--- /dev/null
+++ b/board/udoo/neo/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5c3a3c03c055b8d601a6d7f80d1465ada6b83a12299f6ace2027b47f0baff538  linux-6.6.40.tar.xz
diff --git a/board/udoo/neo/patches/uboot/uboot.hash b/board/udoo/neo/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0bfbf306ff
--- /dev/null
+++ b/board/udoo/neo/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413  u-boot-2022.01.tar.bz2
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index 71a7473307..adcd7aeb4e 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_GLOBAL_PATCH_DIR="board/udoo/neo/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
