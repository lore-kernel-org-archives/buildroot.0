Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8E4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A53F61163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A53F61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE5E40796;
	Wed,  6 Oct 2021 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0wvjj4BjcJU; Wed,  6 Oct 2021 20:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E524022F;
	Wed,  6 Oct 2021 20:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB07E1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB4AF40DCE
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMIhrDe6f6Oe for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A56B440DCD
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:11 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id a73so3599890pge.0
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9urpF+tIa0Vg6lpYQcT2J0OOn6ld+a2NRxqJ135STXs=;
 b=PELf6/9QfewrUAyL8VZqZeHBQFtobgw7BqqcZrkUyrJ3I+qKKTDRFeCLP0FKxVGi7B
 /m9Do1zIGtRSt6w0sOYuaA26XtSbZB/sGdRbxV4r2HbOWBwRV15gfSM1OA6QfT04IcEP
 Dkdq8hPUpxelaFQT9oU/eFd26QlogqWjPzTyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9urpF+tIa0Vg6lpYQcT2J0OOn6ld+a2NRxqJ135STXs=;
 b=ywRezhZeDSVoYfSVZ+j2krGfG3mHJoYqti/k99E0mfLsc20/QKL1j7ZyhnDHQpJ6NE
 tmIYslcOCvSMTf1mvy6lXSWzxDHMDSnup8qlL1EgsR1qB2wGjcrfw86+XtnbkYOxoW+N
 ostbG2CeyG3+cl6ZYC+bzYW1SwBu+Bgiy0Xrt1nRUbi1JTiKvqxtSZpB+lLp2vu8G2IR
 agPChNDsJhDa+ZND1Q3FLF2V27QdLaa5jRHrujAzwclRx/1JQGyoFWf4uRUxVkVZzcDF
 7969qyiJGXbE0zsuErOOAhwTV2tGxEmh2QUh+4ofDFJt18yhNc9ZEqHSgNHhM99+4sIg
 mxUg==
X-Gm-Message-State: AOAM530JIyrQFCK5Ir06YRtquslamnKPhaqi0KsVnEpxeBpTlPFoDjVY
 qbKwUX4tSNZtU0OTbtv/fEbPbWFxChOCLtM7
X-Google-Smtp-Source: ABdhPJyvbX5KNqti1gFDuMoigFq2c99QVzEGA9b6HTdOWbhw+zp04g3jerI//5g9mvmyUBkVhl2Fog==
X-Received: by 2002:a63:5902:: with SMTP id n2mr131289pgb.305.1633552930773;
 Wed, 06 Oct 2021 13:42:10 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:42:10 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:35 -0700
Message-Id: <20211006204135.2813745-12-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/12] configs/nitrogen8mp_defconfig: modify
 device trees
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen8mp_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 3c52c526ab..94f4554071 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -54,5 +54,5 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/lin
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-nitrogen8mp freescale/imx8mp-a0-nitrogen8mp"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-nitrogen8m freescale/imx8mq-nitrogen8m-m4 freescale/imx8mq-nitrogen8m_som freescale/imx8mq-nitrogen8m_som-m4"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
