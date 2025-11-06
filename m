Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A1ACCFA03
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 10:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DFB6149D;
	Thu,  6 Nov 2025 10:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufE947iC8eVi; Thu,  6 Nov 2025 10:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D0761490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D0761490;
	Thu,  6 Nov 2025 10:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE921CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A9E8418A
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaQ-HTKewfT1 for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 10:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349518417F
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 349518417F
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:12:26 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A6ACKFo012158
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Thu, 6 Nov 2025 18:12:20 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Nov
 2025 18:12:20 +0800
To: <buildroot@buildroot.org>
CC: <tim609@andestech.com>, <ju.o@free.fr>, <vjardin@free.fr>, "Leo Yu-Chi
 Liang" <ycliang@andestech.com>
Date: Thu, 6 Nov 2025 18:07:51 +0800
Message-ID: <20251106100754.1863177-3-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106100754.1863177-1-ycliang@andestech.com>
References: <20251106100754.1863177-1-ycliang@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A6ACKFo012158
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH v2 2/5] configs/andes_ae350_45_defconfig: bump
 to opensbi v1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Leo Yu-Chi Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bumps opensbi to v1.6 and add proper hash file.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 board/andes/ae350/patches/opensbi/opensbi.hash | 2 ++
 configs/andes_ae350_45_defconfig               | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 board/andes/ae350/patches/opensbi/opensbi.hash

diff --git a/board/andes/ae350/patches/opensbi/opensbi.hash b/board/andes/ae350/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..d7893a1dee
--- /dev/null
+++ b/board/andes/ae350/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index c02c4d7c61..aafa447379 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -17,9 +17,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="andes/ae350"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
