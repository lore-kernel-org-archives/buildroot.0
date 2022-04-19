Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1834BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3FA5408E8;
	Tue, 19 Apr 2022 20:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPDChULcYSGU; Tue, 19 Apr 2022 20:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB534403E5;
	Tue, 19 Apr 2022 20:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA821BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1344D403E5
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axYsGS7kjryv for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:03:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 093EA4011D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:03:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso2292282wme.5
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+F8R4WyUSIjp2hiwrvQePHwR9Rx1ZiNcSKEuRfesJo=;
 b=Xvj0Q7C5hBd4fGExR5ZLcgHIR8+WWNWWmPB1vEakFXOuyxBDAxVmMd6rbx+/cZ7/ap
 TIgTrYLLuNtv/8bi3DFVuAVy0OzkLaFe/+mL3Nfd/P3/67HFNSJ707YftCE5eX+69Ktd
 v36g5tYUDcVxaksNjuExn3UZh5sR2N2mhJThCsq9dZwo3TdhWjGbB0H5MsUN035Nl+OR
 fq//qUgG3UZzoCqvyEiOf95PeeNZ2TIHf3oE+ozD4bSGPzFXFEIddEh5Auy3cIdCuiv4
 yDe8pffBOp66ORvAI8rvmeCrbFcpnApxIeS1nnuTYuYkB7neQV3v/4sT22v9nBnAEf2A
 AjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+F8R4WyUSIjp2hiwrvQePHwR9Rx1ZiNcSKEuRfesJo=;
 b=Yyg5rfs6HqWolm6h7h4uRK+bbxzZgyU/Rmmyrz2Risxq++UclTj/UTR559VFhFMJBs
 E43dTBL6vQ5uzN3tatlA36yLAw3RMeddJL+zGW6s2fTp0UDDRExOJmwUFdWS3R7JzuiT
 3SQ6ssGfLAEYjzCVJld7uND2ZrhsJg8+0quiWLIUIbDd3a52bgJZDG7JEau9YyHK1biR
 bX/WuivFaHvltGnBZQu6I/zS6m2p7XdHSmRmvkItOneOWAF3XxvRIBFKCcMO6Jo/SlnS
 IaR7OlN+NpqpMApjbbaWjmczpN4XaSsXN0AmroETDa0Sp9/xwJrP8Krvl4u6rDDZCXUU
 EQzg==
X-Gm-Message-State: AOAM5314vVY2pJtwoSgJLy2elYPJMy9le2dW1lVhoxO0Al/IqBX6Lyyf
 JpTP0uvu47uBZB2VeDb9Noh+L3aWZ9E=
X-Google-Smtp-Source: ABdhPJylLae5sSSIQujJ8Ox27h1zZBv+05uKbmlFSH65hG6Iv7h5NehKnoAiYjadk0C9ARz8ZQyuiA==
X-Received: by 2002:a05:600c:281:b0:38e:bc6e:5971 with SMTP id
 1-20020a05600c028100b0038ebc6e5971mr197700wmk.111.1650398607842; 
 Tue, 19 Apr 2022 13:03:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0038ecb2d2feasm16366350wms.4.2022.04.19.13.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 13:03:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:01:22 +0200
Message-Id: <20220419200122.4095481-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/shim: add
 BR2_PACKAGE_SHIM_ARCH_SUPPORTS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_PACKAGE_SHIM_ARCH_SUPPORTS as requested by Thomas Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20220419121409.2055818-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/shim/Config.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index b0e549a51b..a762ad9215 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -1,8 +1,15 @@
-config BR2_TARGET_SHIM
-	bool "shim"
+config BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	bool
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
-	depends on !BR2_mips64el
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_TARGET_SHIM
+	bool "shim"
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
