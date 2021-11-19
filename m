Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1DEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 14:36:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56171615E2
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 14:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56171615E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9416060B;
	Fri, 19 Nov 2021 14:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHO_kGDnlNm6; Fri, 19 Nov 2021 14:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F44A61C10;
	Fri, 19 Nov 2021 14:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A02291BF48B
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 14:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F1E440E47
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 14:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nC8jpxsdn6ou for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 14:36:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C03A7409E5
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 14:36:41 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id h63so8768124pgc.12
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdNPdOoA39mjjSYtBmPGoiBOvN4+LIQ9zWfbyDXVH2M=;
 b=NQ570D0vv6Zo1nPiZuUCq5FKDZdf8BS1zgnQ6+QKGaajPJBheo5Aht0ZJqCqpKgEN1
 P/gJGXkp1psGHRxe4Sw4OGHRbFo4WH7u9fq1nXA5yB5FtnzTDhnsz6CPXrOxxQ4MUTO0
 e4JRWyEq0zy1ZBxJXLWdkt8Z6m9dWoXKe8rg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdNPdOoA39mjjSYtBmPGoiBOvN4+LIQ9zWfbyDXVH2M=;
 b=n3fnPRaCidrxAdmxp4RaHu0g+0O/18VovI81YpJ7rcDUyX2pI6CbZYsC3TIh+I0YbR
 7uG2qVEs8CpjowO3ui/dZvNTn5fw0r8ffKGrye30u1HYSVo8UR4iMwLYrGKS4AEX0f6s
 7FhXF4F2vK2P5HwjW/R6J2HVzy2GR6w2ECquLuoX2Xya9xdYjTygiwHeBbuw0wN3+i+5
 S8KyCQrw2OE+rc0VTtXXBUQY+jawgCnFasOt6Lt4clIgFxdaxxXFjzg5C8YkPb97+v7A
 iEVijB6PtNIzTqAbrfLdCuXghs4/9J3vL1BJtvnvItUb1NuzL1kavESOdYYvj86ndnI1
 c0+g==
X-Gm-Message-State: AOAM533DiBHpPnock8UrukWX/teAq7LSScXfWWEFBDiiFAiR2C6AprcN
 OfDZAl2ZD6ypv9rJPLovb2PayCLplVUPMA==
X-Google-Smtp-Source: ABdhPJxIHXOT+00IZ0tZYC2YXc7zk0m04fqQ/d3YRhaVJwTOt3GOEpeVhIo+LpQwWKNnVR5PS6Y38Q==
X-Received: by 2002:a62:5a02:0:b0:4a2:a6ee:4d8e with SMTP id
 o2-20020a625a02000000b004a2a6ee4d8emr44454011pfb.47.1637332600486; 
 Fri, 19 Nov 2021 06:36:40 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id o1sm11013969pjs.30.2021.11.19.06.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:36:39 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 15:36:32 +0100
Message-Id: <20211119143632.2565197-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/nitrogen8mp: update device trees list
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
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 chris.dimich@boundarydevices.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove the A0 device tree as this (pre-prod) version of the CPU isn't
supported any longer
- add '-m4' variant to enable remoteproc api to Cortex-M core
- add ENC variants for our ENC carrier [1] (+ 1 with tc358743 support)

[1]
https://boundarydevices.com/product/nitrogen8m-plus-enc-carrier-board/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
This fixes the build of the kernel for this board as the a0 dtb doesn't
exist any more. But I couldn't find any report of the defconfig failing,
are those still built regularly?

This patch replaces the previous one from my colleague [1].

Reagrds,
Gary

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20211006204135.2813745-12-chris.dimich@boundarydevices.com/
---
 configs/nitrogen8mp_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 3c52c526ab..dc7427c856 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -54,5 +54,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-a0-nitrogen8mp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-nitrogen8mp-m4 freescale/imx8mp-nitrogen8mp-enc freescale/imx8mp-nitrogen8mp-enc-tc358743"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
