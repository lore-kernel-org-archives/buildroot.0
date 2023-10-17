Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB9FCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 10:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D99860EDF;
	Tue, 17 Oct 2023 10:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D99860EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rofww505toUj; Tue, 17 Oct 2023 10:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F07F60E50;
	Tue, 17 Oct 2023 10:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F07F60E50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A36A91BF97D
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 10:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79058410BA
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 10:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79058410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hrfFA4Qa2iP for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 10:40:25 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2560540902
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 10:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2560540902
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5079f9675c6so5014101e87.2
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 03:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697539222; x=1698144022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AOOG8qiwHHPhH3dBbmL/QKwKT2PwrJL0lsA+QHsjOM=;
 b=mobMSuFjSXiV6v6JetLB4SuAArMp7nxa2nHSDv+X3sLCMsN2LQVTu3J89PtMhEJTmD
 Rs9djjXaIBldUodcjcHKBM5sQ4jSmAJLUk/Gd/oNjQwTf7vcv/P2XOeikezvxuKWDR6k
 5tLJBIaHpZO2kUFa90iReiEZ0+hpNEueGiliHxQQpMrWFeIsKFhDxEaSPFenmzfupg0s
 JiOSciy+1Imf+09H2PAeVdqmAhkNXy8UGhpKEh40e1P/Ao/TfO0eoLDZss7R0IA8rWbw
 zOnOgksJSw+ipxPnhCx4Z+Z8hcOVHdCgf5sJU6eeiKlk+OUzFbZ7SQOADD4Dhtw0+xsw
 7v0w==
X-Gm-Message-State: AOJu0YwAXXtvCRDi5qvb6XkIseOQGewRQowux4GAGt8CRriQdydOkREz
 SiSzr/igwE03Jd01HHqx36Pm+/ZxkS6e+wLObuCMCq62
X-Google-Smtp-Source: AGHT+IFpMIQSTleY4BWOadvwcmsqVXFnYbgwQQoBzOKn5ZVxSermDHhVbMuFvgG5nIYwCs1tflqBAA==
X-Received: by 2002:ac2:4109:0:b0:507:97a3:ae3c with SMTP id
 b9-20020ac24109000000b0050797a3ae3cmr1411048lfi.11.1697539222518; 
 Tue, 17 Oct 2023 03:40:22 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1401068wrs.35.2023.10.17.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 03:40:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 12:40:11 +0200
Message-ID: <20231017104015.1492775-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697539222; x=1698144022;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2AOOG8qiwHHPhH3dBbmL/QKwKT2PwrJL0lsA+QHsjOM=;
 b=OjA9uqdlOXLas0s26oGr4vnfibD/lBmEsQsMksuuRudTPGWUuC3mHWDk9abZs3Vl81
 WGd9Kv2Qzc2vwVrcOO6m/Js2FZROZ5B3QOKVzU7YUTsd81LaB6cGTGlBptd9UhNVvh5K
 dK22V9Pr7TpzZhsI9rd0OQuBEN/iT2XGbC0u0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OjA9uqdl
Subject: [Buildroot] [PATCH 1/5] configs/mender_x86_64_efi_defconfig: Update
 kernel to latest LTS version
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5.18 is not a LTS version. Let's update the kernel to use the LTS 6.1 kernel.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 configs/mender_x86_64_efi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 25a463abb3..05a419dbb0 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -39,7 +39,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.58"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
