Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF844EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E9B440B9D;
	Mon, 10 Jul 2023 21:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E9B440B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pknRcJq3_QNS; Mon, 10 Jul 2023 21:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E3240B33;
	Mon, 10 Jul 2023 21:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E3240B33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0DAB1BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A731B40B33
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A731B40B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOefABJABIQD for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0CEB404A5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0CEB404A5
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:22:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso51501325e9.1
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 14:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689024140; x=1691616140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jUJaGDzAZH86Hs+MwhLwY306iUD+CUxg2/FDfzmmYX8=;
 b=UeQW4iqqZ82yRdYl5Keskc5dRsEHUzaoNFyru7gBmCaVVFUYNG2qQzFKHL9p5nkr8H
 pTvAwl4BahiTmqPFiAmpql7mZ9agM9lcu+TqbnIVzNtbalUO2omS5m4C7fYz2/sQQEmX
 GWKQV/GiXXGP9pI8bR18cnBm7WQDz8fjQm41/jEDpdjUSI5W2P/MbvcFtwYWOVZSBaUG
 +pImbalu5busDS0YRMHT4cbmQvYic30McQ/Vv5AixpBblPjjJC3X6z2DQxyUbQQMkp3n
 kQhRxYB/GYwqoJEApNYyUPJMVk7CWmfY2svGGxk6rtQcSOLodZX/Xt6DsXsoYu+tNnG3
 +Grw==
X-Gm-Message-State: ABy/qLZeJqQK24647cP4SMHNSIBl1cUI0lBVLG+AZ2eIQ6Y525e7ic5E
 uARSq2VO4tK9FOHhFxKqY6b/h+4oEMn01bhL27U=
X-Google-Smtp-Source: APBJJlErWDTBJP0gWAMfTeZhY4zn8WZQguN8WcGr8Ob20EaxRQswX1l+IhbYijG1Wa34iBVuJfOjcg==
X-Received: by 2002:a5d:6443:0:b0:313:f7a1:3d92 with SMTP id
 d3-20020a5d6443000000b00313f7a13d92mr11562681wrw.66.1689024139513; 
 Mon, 10 Jul 2023 14:22:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a5d558a000000b0030fb828511csm389939wrv.100.2023.07.10.14.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 14:22:19 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 23:21:46 +0200
Message-ID: <20230710212151.574040-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689024140; x=1691616140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jUJaGDzAZH86Hs+MwhLwY306iUD+CUxg2/FDfzmmYX8=;
 b=hKqxYpqjVcIvtyPaw1z7bTrBWcu5zPTGlFRdRDvYLPkW4daQQjH89AtYkcCC5xgjU2
 bv5Tvmr59M3+DMyEvfLgF7kLUACGY8PRRgSI/TFIAWZq7v9oz8tHB1MV2lgQxqs0TJ8e
 nss5Q1dpIZsNHbCspSarvAHD4nVGk7aaj7uxjdsUfZb4MG4UzV3NPWredHyC6h3BFCSm
 n5vjHizjBQQG9lwttrYNk3Y7j/5hZonoOZCO3lhwEek+aoFpO00+wScbDMLtPyg7j9E/
 u2nNVpZXzFQz0c9Xyy/nj9LNjCrKZHVRTxkMBYYE2li+IAU95SVXlT7mK2NeMACO09bB
 DEtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hKqxYpqj
Subject: [Buildroot] [PATCH v2 0/1] configs/roc_rk3399_pc: Bring back and
 update the
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
Cc: kilian.zinnecker@mail.de, Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series aims to reintroduce the configuration and scripts for
the `roc_rk3399_pc` board. There are a few improvements regarding the
U-Boot verion (bump) and some minor fixes on the post-build.sh script.

v2:
  * Use a more recent version of U-boot.
  * Built-tested by Kilian Zinnecker.

Roberto Medina (1):
  configs/roc_rk3399_pc: Bring back and update the configuration for the
    rockchip rk3399 built by firefly.

 board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 +++++++++++++
 board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
 board/firefly/roc-rk3399-pc/readme.txt    | 40 +++++++++++++++++++++++
 configs/roc_pc_rk3399_defconfig           | 38 +++++++++++++++++++++
 5 files changed, 109 insertions(+)
 create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 create mode 100644 configs/roc_pc_rk3399_defconfig

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
