Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37A9C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 16:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A8454051B;
	Sat, 26 Aug 2023 16:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8454051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLjMu1yQT79n; Sat, 26 Aug 2023 16:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95CFA400AC;
	Sat, 26 Aug 2023 16:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95CFA400AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2BFC1BF831
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 16:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A990D400DD
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 16:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A990D400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyreK7BsnLaY for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 16:56:34 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4EE4400AC
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 16:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4EE4400AC
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31c6d17aec4so1594576f8f.1
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 09:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693068992; x=1693673792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OV5yyLdpJiCZ2cefEzVc80SFbgeK3A+wmXKz7vuMAYQ=;
 b=OZvzJCJ2hbb+Ky8BWgLnzaxOQA0jZSwh7omiAJ/WeTRVSG4BPVTvBcwjmYA6P58qdx
 dBKg8my9zZeMU98IzV7WWjyQLJE1+IzxrOHz3bQf/vupd9dZPn9+MNobae6XqYPgBB+J
 Cg+Vpt5rMErRbDi7SOlNVboXmeVWmFFdGeVx1aVbaHjwbKm9jOlQLITcieagpFsi0a5v
 Dt/uE9VnIw/L6NAlG5+h0ZCeMXlPh0ETB+zM5E8/yExTlqIkfKa9j/fq0SICXSbWpWRB
 DzMSYYSeAxw9m0J1Bd6MYnDuDtcYFt+0VPUODNZZzyqti8thI8Al9NTVh3IeDz4FOgS3
 DioA==
X-Gm-Message-State: AOJu0YxUNoRm+FWZoBdan2jEOLefnOCgie9iXQmO5XkfBa07w6jFtm9B
 cdQDZUTuJRds0SU9v6k52qVX7hf5CFI=
X-Google-Smtp-Source: AGHT+IFa96yMQx6brwUobYcftYJizwN56mJWBTBppczaXEMSA9K1av/oisY2m9dvLtROAW8rQXfNmw==
X-Received: by 2002:adf:e543:0:b0:319:7bec:4f31 with SMTP id
 z3-20020adfe543000000b003197bec4f31mr17025537wrm.10.1693068991624; 
 Sat, 26 Aug 2023 09:56:31 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 hn1-20020a05600ca38100b003fbe4cecc3bsm8655744wmb.16.2023.08.26.09.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 09:56:31 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 18:56:27 +0200
Message-ID: <20230826165628.31792-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693068992; x=1693673792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OV5yyLdpJiCZ2cefEzVc80SFbgeK3A+wmXKz7vuMAYQ=;
 b=W0vJQ2UF3KEI5pQWbx5ZdMXgwpVK1L8xZ9VcvwV0u5URs5eS57tY6/XgxRTZn2R3nV
 KDz2Fiw3afHWxmyyCnKbnkTKXOechDrrXz+MraVkq3mrw1r0aA6rjERpd729zr66xpn7
 iyCgho5ZAaO6PH6z+46mKKgmEw6hyVUMzP0pe9QoxLstpwtvmGfanU+wXHmc6Imh8l1g
 6biQpOjwqjeZqGqFClIYvmQaRmHQIYBQZl5bHpXipcvsuex9ciq0NJa6b3fiHwLto/ty
 UWW+GW3yIyFQ9Fl+5yuZ37sQRwI+aRhEQghi7hsF+XKApycJ9zwzxyb8tFH2pZo0pv71
 1Oxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W0vJQ2UF
Subject: [Buildroot] [PATCH] configs/freescale_imx6qsabresd_defconfig: fix
 defconfig
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

While switching ATF to github, the BR2_TARGET_UBOOT_CUSTOM_GIT=y
symbol was not removed. Since then this defconfig fail to build
in gitlab-ci due to invalid defconfig check.

  WARN: defconfig ./configs/freescale_imx6qsabresd_defconfig can't be used:
        Missing: BR2_TARGET_UBOOT_CUSTOM_GIT=y

[1] dd42b159a5f752921ee602530d289c810ad7ee51

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
This defconfig will fail anyway due to too old ATF package (pre V2.9 version)
and binutils 2.39+. But it should be backported up to 2023.02.
---
 configs/freescale_imx6qsabresd_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 86513d8072..dddfaf5228 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -37,7 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
