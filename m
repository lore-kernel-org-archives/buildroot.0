Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1380AC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 15:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A1D40F1A;
	Thu,  1 Aug 2024 15:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URHlNVFN6cex; Thu,  1 Aug 2024 15:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E472940F2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E472940F2E;
	Thu,  1 Aug 2024 15:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9A81BF3D9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A4C80CBC
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 15:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrJfSZ4PEzLd for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 15:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::1909;
 helo=smtp-1909.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 862D880EDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862D880EDD
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::1909])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 862D880EDD
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 15:35:15 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WZY1s2s7Yzk6M;
 Thu,  1 Aug 2024 17:35:13 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WZY1r4wskzgC6; Thu,  1 Aug 2024 17:35:12 +0200 (CEST)
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 17:34:32 +0200
Message-Id: <20240801153432.1741409-3-philip-dylan@gleonec.bzh>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: [Buildroot] [PATCH v2 2/2] configs/mx6sx_udoo_neo_defconfig: add
 hashes
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
index 0000000000..b8935a250a
--- /dev/null
+++ b/board/udoo/neo/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0ad83b1a1a780a1aad948d55aa55ee63c50c626f2d46910b9d2180028d100a5e  linux-6.6.43.tar.xz
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
