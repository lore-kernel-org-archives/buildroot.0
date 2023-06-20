Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE81EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96F2D41766;
	Tue, 20 Jun 2023 17:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F2D41766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHGqifejdmpQ; Tue, 20 Jun 2023 17:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF6F41773;
	Tue, 20 Jun 2023 17:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF6F41773
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931061BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77341410E9
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77341410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OF8u92FghTc for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:19:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E29410C0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22E29410C0
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:19:49 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5704fce0f23so53386207b3.3
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687281587; x=1689873587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=anrtJBBha3N3cQEYXtKTzFWbDcj94jeKSQIJCULThkE=;
 b=Z0atGLlWzz+RmHXdtYdln+EDRxkwgtWhB3jDhHpgODdY9EvV9YsVaRoK2ryUK94eUK
 bIJHHB34KAhPivfxsTmQTusEyGvOVvUZgKjRqvCcWW5ma/gxsI3YN9yygqsQRwucTCYv
 zoWB27i0ScqXQlCts7HzoOG7OzNfK6nD0rdaCCYz0QZGftHcoX4en3g7v6Fd0lS8cndI
 GecbMbsyR4HQ+T8foqmXE7LhdUtUBiDc4D1TfExFeRn8jkjrC5So74L09soEkFTbZ+2T
 2Ef3uxpSrh4t5wUbyjAikqbIHHuj0xMXZD0tGkgJLCqPtpmCz3TTT9Z1vQd5xwoyN1MY
 AJnA==
X-Gm-Message-State: AC+VfDz/AGwir4cdQoYsVdhAWlaMOdtjcNp7xn8SwNQNThGCdhb4qW8N
 yLU6p7oLZVFkQ6xaXtatY5TToZB+hqs=
X-Google-Smtp-Source: ACHHUZ7heuQxna88M7PmBD8wFna3JSdhIobUm3ylM1MwHvN8n99xnwQBg799bE/0Ij4RO6iFq+9j5g==
X-Received: by 2002:a0d:d948:0:b0:56d:2490:7cde with SMTP id
 b69-20020a0dd948000000b0056d24907cdemr12373175ywe.50.1687281587645; 
 Tue, 20 Jun 2023 10:19:47 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 y201-20020a81a1d2000000b00569eb609458sm590881ywg.81.2023.06.20.10.19.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:19:47 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:19:43 -0700
Message-Id: <20230620171943.3999-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687281587; x=1689873587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=anrtJBBha3N3cQEYXtKTzFWbDcj94jeKSQIJCULThkE=;
 b=s4HYN+2CcTfg7IeybhmmkYakht9S3nEgwfWxEaryB5iFAUIq2sWfYP0nAQgzMS9xdu
 RkbhzbqgxgmkjrkP/VI+x4Capdsagp/umWKjOhls3lHWsLRjnc+uoHxPqBmaSsBDbtGl
 GvuvXIQVKN3Z06LjPTKen4mpfh2IoX6sddNOXTANd/ATQtcJIYKdaE4HnHQtObLENYHy
 FQZj4tDWCbHcG5UDR7CHfjA8dNgHvU6ESv9d/bYi2fsvpSf5EGegBqCd3/ugCkaWsNzQ
 SgpCZBd3Z2GshkF3WEJ2BrFYE5w64pAzhBF6m1zPxOzmV6jv/9/WWhG03ZsaWD6HxsCz
 feNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=s4HYN+2C
Subject: [Buildroot] [PATCH 1/1] packages/imx-seco: add the imx8dxl b0
 revsision ahab image
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
Cc: Charles Hardin <ckhardin@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the selection of the ahab container images for the imx8dxl
asics. The initial support assumed these were imx8 but this is
actually the imx8x architecture as well. This was fixed when run on
the first tests against the imx8dxl SoCs.

Files from upstream:
    mx8dxla0-ahab-container.img
    mx8dxla1-ahab-container.img
    mx8dxlb0-ahab-container.img

The B0 revision should be considered the latest

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/freescale-imx/imx-seco/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
index 867ffe1bb0..41f8444651 100644
--- a/package/freescale-imx/imx-seco/Config.in
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -22,11 +22,15 @@ choice
 
 config BR2_PACKAGE_IMX_SECO_MX8DXLA0
 	bool "imx-seco-mx8dxla0"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 config BR2_PACKAGE_IMX_SECO_MX8DXLA1
 	bool "imx-seco-mx8dxla1"
-	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
+config BR2_PACKAGE_IMX_SECO_MX8DXLB0
+	bool "imx-seco-mx8dxlb0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 config BR2_PACKAGE_IMX_SECO_MX8QMB0
 	bool "imx-seco-mx8qmb0"
@@ -46,6 +50,7 @@ config BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE
 	string
 	default "mx8dxla0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA0
 	default "mx8dxla1-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA1
+	default "mx8dxlb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLB0
 	default "mx8qmb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QMB0
 	default "mx8qxb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXB0
 	default "mx8qxc0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXC0
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
