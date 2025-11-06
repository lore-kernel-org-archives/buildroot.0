Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B00CCF9F8
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 10:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA0D614A6;
	Thu,  6 Nov 2025 10:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmN5xCKE83yX; Thu,  6 Nov 2025 10:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14AB61486
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14AB61486;
	Thu,  6 Nov 2025 10:11:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 226EC1CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 139B661486
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6OCJ6H-Wg8Z for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 10:11:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5DF61482
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF5DF61482
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 10:11:40 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A6ABYn0011950
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Thu, 6 Nov 2025 18:11:34 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Nov
 2025 18:11:34 +0800
To: <buildroot@buildroot.org>
CC: <tim609@andestech.com>, <ju.o@free.fr>, <vjardin@free.fr>, "Leo Yu-Chi
 Liang" <ycliang@andestech.com>
Date: Thu, 6 Nov 2025 18:07:50 +0800
Message-ID: <20251106100754.1863177-2-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106100754.1863177-1-ycliang@andestech.com>
References: <20251106100754.1863177-1-ycliang@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A6ABYn0011950
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH v2 1/5] configs/andes_ae350_45_defconfig: Fix
 linux tarball source
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

Use tag instead of branch to download the linux source,
and add proper hash files.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 board/andes/ae350/patches/linux-headers/linux-headers.hash | 2 ++
 board/andes/ae350/patches/linux/linux.hash                 | 2 ++
 configs/andes_ae350_45_defconfig                           | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 board/andes/ae350/patches/linux-headers/linux-headers.hash
 create mode 100644 board/andes/ae350/patches/linux/linux.hash

diff --git a/board/andes/ae350/patches/linux-headers/linux-headers.hash b/board/andes/ae350/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..1a6a136b71
--- /dev/null
+++ b/board/andes/ae350/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  linux-v6.0.y-andes.tar.gz
diff --git a/board/andes/ae350/patches/linux/linux.hash b/board/andes/ae350/patches/linux/linux.hash
new file mode 100644
index 0000000000..1a6a136b71
--- /dev/null
+++ b/board/andes/ae350/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  linux-v6.0.y-andes.tar.gz
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 7b5a6f73c6..c02c4d7c61 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y_ae350-ax45mp)/linux-v6.0.y_ae350-ax45mp.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y-andes)/linux-v6.0.y-andes.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
