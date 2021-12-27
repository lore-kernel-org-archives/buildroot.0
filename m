Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951A8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 18:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E16360A76;
	Mon, 27 Dec 2021 18:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rj1fvezgfAgd; Mon, 27 Dec 2021 18:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0EBC60A6F;
	Mon, 27 Dec 2021 18:43:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8B191BF3D6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A62B84016D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCWPuQLyo5dH for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 18:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89F340131
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:43:13 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id bp39so13923642qtb.6
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dqi4oUzJRge0/2Ti+gZ8l0dKrcfXnI1ddW8/sqGnVUc=;
 b=n9IiN3NqsjsLie/usA7ofyGzBPVbCOVfupXtCPTk1XK1+TBJdGIm70Ot4rXjHz+2UF
 GlmDPOYKWYKDPHXz2SDicVhxJmOb3O0uT2O0Y4Am608HvpW3zlJYyERiburd9bDs1AzL
 EX2sBKQwKMpJTP20l3M0qkZQRUsLN0380ThDPxwOrDIc5BCqkKlmOLre7qoLINCetHIp
 4CQJwea6cpBDRAhUqzf3CimdjcnJm8lnHgcc+IPoRXg18nZv98YbHZs/LycOka2z45kr
 cN3T3NXxPinpKV+NFYOjDaweE2GsAP/cwqwHnWuOuAQAonDLtb4T9PqECV2zgtVvHPt0
 GjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dqi4oUzJRge0/2Ti+gZ8l0dKrcfXnI1ddW8/sqGnVUc=;
 b=mZ+1Ktp2kip5ZgBgYbUtQTvcRgWguVGeH7cDKqjy7lUkMVHYU/VWHD1YtjoSXi4d3+
 OUpewni65z9Ym4CjNoEVF8R1LVHCjnnlqVICv5DZoodKKAe9TFcnllmKk+FHn+f7BoMA
 8NY+fTmqy7o5MlLRV0OfvW/Zm1D4lJP5gdlEEfCWAl/izoddsQt0QcobSHZD37Pcmfmd
 H7Lz+4pbBCZa/qOJr6HN0XjibEqymMuVzME7kvbPJafQRfnOAjm3Z1+1OD+sOYWbZOMi
 QU1YwvVjTdTq1bbojKOe9Jy7U4/bGEEVnxPtgyAJoDjEek1ZIqvpbHZN1EeohibzQ4fH
 Nj8A==
X-Gm-Message-State: AOAM533ELEkEhqsqxfphXmaQ7O8DVqur2Qr5J84jKyUxrCN0bOAwwi2g
 qWj5kZsEAeYfHsnfYCws5Q+yK3WWzQM=
X-Google-Smtp-Source: ABdhPJxc7F1nEpUv/JpFFBp7XkpRX8d0I1PdfxBZeYrWv7LNUgk5/fZBslF7WeePqFO56jZ/cmfV2Q==
X-Received: by 2002:ac8:4652:: with SMTP id f18mr15901716qto.381.1640630592434; 
 Mon, 27 Dec 2021 10:43:12 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 bs30sm14235104qkb.87.2021.12.27.10.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:43:11 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:43:03 -0300
Message-Id: <20211227184303.3213527-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6sx-sdb: Bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2021.010 and kernel to 5.15.11.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6sx-sdb_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index 7ad662aa2ce1..c36520a165dc 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -3,19 +3,20 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
