Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC631EB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E1D41835;
	Mon, 24 Jul 2023 19:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69E1D41835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKuwzwCUE_Pe; Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A6541855;
	Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41A6541855
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB4AF1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C430F6103E
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C430F6103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cey3XMN7z_2L for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:43 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4C4F60AB3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C4F60AB3
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso38313425e9.1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226200; x=1690831000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMOlWXPhFl7JBHMyVNPDnBUpxumnlaiMmaboBCPzAX4=;
 b=KmMjbVsJ1sWkFhJhQ1nb4g/cb+JVBbr/PV+7yFPjfD0IWQOczevFaWYbGDBIhA6RDu
 MOJrmiV8ZXd+1irzG866nSPEs43Cb3bO19AztT0g/MHM3oL2AYQeQuc5Jt0ITbikXBY3
 f12KrchUqZMkWDcunCSVc/p603gCLGMYqKp4DO8QCv8WjGZ+nozQRYxll2QP35EAZEBG
 2vjpUfdzzmlxyuNMebmH9SimRWA22bA7QIK5TtR3dLt9HG5uY47QCt3KXE6XNJ//xh2T
 gMn1asvlpWzSmjRQDh/Z2T5f9jW6/TqI1zp17uI/3O8P32sndFnH6LQ96rn5cfJWaEMM
 hN6A==
X-Gm-Message-State: ABy/qLaQVue8gwUs0nelPk8ik4dJczFLaS5PLqQWrVSaToP7TWkA5Km3
 WXRYJYfu1+P3k7MXexk3gEKB3B2Sscv3Gg==
X-Google-Smtp-Source: APBJJlGis3HFtKKsmETiB66qzVMkqIqZBaYeveuIqfhLHO6CjrgA6ObZInVP0FkaZo8ACnjOwJp2nA==
X-Received: by 2002:a05:600c:2242:b0:3fb:b5dc:dab1 with SMTP id
 a2-20020a05600c224200b003fbb5dcdab1mr7119253wmm.39.1690226200022; 
 Mon, 24 Jul 2023 12:16:40 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:39 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:33 +0200
Message-ID: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226200; x=1690831000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMOlWXPhFl7JBHMyVNPDnBUpxumnlaiMmaboBCPzAX4=;
 b=hMn8XCsQ0IQnwIHDV7IEqIVDK8YQnmIbrv+w/eiDEMnwU72ICH1PmHc0nzM6dyNOND
 SorWNpzC6UXzyPhAxqgJ0Cy4ygwzGPDApWGoDcO/FVT9hS70LkbzsyFr7Xndz0qOQcHt
 OF5eO1JeQ2Unu1sXJPzDsoVm+sxhKggJku2dEOaOf/R6t2W66alBRAvTFmDThlG5uraz
 GqQ4DW6C7lgEExY/RoUuo9vicyRji7Kf9f3eUKTBYiNNl6DJcThyqjcIHbyf0jk3cc05
 rIwiUcqQCf4jHwIetHw1uk6IwxMoiX+JckMl7Xzuj7Qd2JNDP/bg3bRt+W1EvuYipJA9
 9zlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hMn8XCsQ
Subject: [Buildroot] [PATCH v2 0/5] Add FREESCALE_IMX_PLATFORM_IMX8DXL
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Charles Hardin <ckhardin@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

> Also, please run "make legal-info", to make sure the license
> information is still correct.

I updated the licenses as well. The actual content changes appear
inconsequential, but I am not a lawyer.

> Are these firmware files new in 1.15.0, or were they already present in
> 1.8.0 ?

mx8dxl-evk-scfw-tcm.bin was already present in 1.8.0. Interestingly the
one from 1.15.0 is only a quarter the size.

> How can this work if BR2_PACKAGE_IMX_SECO_MX8DXLB0 is not defined?

I reckon it gets defined from this line, which I adapted from the
MX8QXC0 line just above it:

default BR2_PACKAGE_IMX_SECO_MX8DXLB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

Stefan Nickl (5):
  package/freescale-imx/firmware-imx: bump version to 8.20
  package/freescale-imx/imx-seco: bump version to 5.9.0
  package/freescale-imx/imx-sc-firmware: bump version to 1.15.0
  configs/freescale_imx8dxlevk: new defconfig
  Add BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

 .../common/imx/imx8-bootloader-prepare.sh     |  2 +
 board/freescale/common/imx/post-image.sh      |  2 +
 board/freescale/imx8dxlevk/readme.txt         | 69 +++++++++++++++++++
 configs/freescale_imx8dxlevk_defconfig        | 39 +++++++++++
 package/freescale-imx/Config.in               |  7 +-
 package/freescale-imx/firmware-imx/Config.in  |  1 +
 .../firmware-imx/firmware-imx.hash            |  6 +-
 .../firmware-imx/firmware-imx.mk              |  2 +-
 .../freescale-imx/imx-sc-firmware/Config.in   |  3 +-
 .../imx-sc-firmware/imx-sc-firmware.hash      |  6 +-
 .../imx-sc-firmware/imx-sc-firmware.mk        |  6 +-
 package/freescale-imx/imx-seco/Config.in      |  6 +-
 package/freescale-imx/imx-seco/imx-seco.hash  |  6 +-
 package/freescale-imx/imx-seco/imx-seco.mk    |  2 +-
 14 files changed, 141 insertions(+), 16 deletions(-)
 create mode 100644 board/freescale/imx8dxlevk/readme.txt
 create mode 100644 configs/freescale_imx8dxlevk_defconfig

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
