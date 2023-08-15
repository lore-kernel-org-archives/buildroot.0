Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64E0C04A6A
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 17:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53FE840516;
	Tue, 15 Aug 2023 17:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53FE840516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwJb8PXkdX1g; Tue, 15 Aug 2023 17:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94AFD4113A;
	Tue, 15 Aug 2023 17:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94AFD4113A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF901BF47D
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 17:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67507404BF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 17:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67507404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZZwzAX0zpdv for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 17:46:06 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C95C40296
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 17:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C95C40296
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3175f17a7baso4741865f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 10:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692121564; x=1692726364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A37klMlX50NIIgdin9tz3XUlpcmztH3hgCGZBSXwiXI=;
 b=bZNGZPm1VDmhVs99/RhDByaew3aJdCXcLitC57WJ+sfn4+wNagSs2xnBlfIhVqQi2v
 CCVgimlVO5M/CsHPOm4Qr3uTzuO+pRGe5+X4CnT/EcqVzTajsJFcKFKcixGJYSeje0So
 i6mCA3y0shtwp2ujYv349FxHVqCArhOY8NA9l09FL1MGkrD+CHdiNhp878GKkEv6ZIfe
 DiNVLnO75vsMcpaK+KJ9EWs243LXUVnjpVwslVtlrMOxmgqUqinzNURvkltPu50ZERpW
 EfheMlCt7FlXhHW5Pq6CFv7ao7+ECv3mAbZkPlx9jmMmJ5G8Fp6DwpkdTTFqkZOw++oS
 xwDA==
X-Gm-Message-State: AOJu0Yyo6PefQbpxwQR4SqbfL+CLAsD039xCHCj9CTMOgupoAF/aM8aZ
 I4dQpzVYfCkS5fzC+kaeAxdQnn/0bWU=
X-Google-Smtp-Source: AGHT+IGZJ2qKOEvD660bpXPuOC8nHIaooL2pSUyEuJ8ceyb5/qjefHWjj6lEIDam8q71IlYGX915Ig==
X-Received: by 2002:adf:cc91:0:b0:317:69d2:35c2 with SMTP id
 p17-20020adfcc91000000b0031769d235c2mr10418432wrj.2.1692121564387; 
 Tue, 15 Aug 2023 10:46:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6507000000b003143b14848dsm18388028wru.102.2023.08.15.10.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 10:46:03 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 19:45:59 +0200
Message-ID: <20230815174600.290776-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692121564; x=1692726364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A37klMlX50NIIgdin9tz3XUlpcmztH3hgCGZBSXwiXI=;
 b=LA2x3I6obRAfYZutphbUhba7Nf6gGCs+oWQ6pzrv+PIy1z8EDjaBCqL6UscT/I5+GU
 rfOsfYDr93aNQ46BoEmL0rmpf5GInmdxDopUFzHpBsE9vB2lgAOlWmQrJm6qC2S6F3Eu
 NvySl9KDFtHPWbZ3cjxJ/1+StJUdmxJHPdKPZNWxu1mVvf6nipaT4L0H+TirbAfrcxEP
 NpOXhleb3OP5Itv+RMhZbB0Xm4ji8dU/gKtib8JyX+8L9W4e/WoeuwMI/1Of7K0tj/JN
 1Ou4JWXmate9PrIMoctAmfE7YATT6fRGFZLPyLrkunu6dEZuwPAj7y4taYFlQaLVLk8h
 8yMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LA2x3I6o
Subject: [Buildroot] [PATCH 1/2] configs/hifive_unleashed_defconfig: uboot
 needs pylibfdt
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uboot needs Python libfdt to build:

  pylibfdt does not seem to be available with python3

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060137

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/hifive_unleashed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 80c5e48f96..37898284ac 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
