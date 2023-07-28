Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B735AC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B99614E3;
	Fri, 28 Jul 2023 21:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B99614E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9oPXCq3WdT5; Fri, 28 Jul 2023 21:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDE361247;
	Fri, 28 Jul 2023 21:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFDE361247
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 832361BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D1741F9C
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D1741F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIdKaylP6HCG for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:01:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C956B41EE0
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C956B41EE0
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1E26E0003;
 Fri, 28 Jul 2023 21:01:16 +0000 (UTC)
Date: Fri, 28 Jul 2023 23:01:15 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230728230115.1585253c@windsurf>
In-Reply-To: <20230528153156.1685512-1-dario.binacchi@amarulasolutions.com>
References: <20230528153156.1685512-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690578082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFDHlkTJbNSaQsmJXQ90Rkmdc06JOMMZ+acPdExQOzY=;
 b=PnRpy8eR6PPNjSBTdjdH/6cEqPB+7Wi+xJQyACLNAGsQVQ6U6z42rEQv7ERPX4GCTRPDob
 ewN3UMA5w/ysCBk1h9o5o4F/GGoAO2P53snvKwI5maustJ2/g/mAsMMtbxRbxF5cPppjNm
 2Wcmt2ZmOxYaZsszhEvQGjVRKkueK+r0g197xy3acZGaCAqbYUBaD1w6w2luz7np4P+GJk
 /PGHLs1RCL+cRcswnqaNFCXSH3ylsSLo0YJbVNS+lyL9D9YiSshzuIrEs2XJbk8Z1kuwMM
 GU35xZnrk5TRcNxPyN/85TUjMBmqpJspgtClqgWF3Mg9qhsqG1afWRJTh1Dkpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PnRpy8eR
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f4xx_defconfig: off
 network utils from busybox
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 May 2023 17:31:56 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Kernel is built without network support, so network utils are useless.
> This has a positive impact on the size of busybox and xipImage, making
> them smaller.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../common/stm32f4xx/busybox.fragment         | 21 +++++++++++++++++++
>  .../common/stm32f4xx/stm32-post-build.sh      |  3 +++
>  configs/stm32f429_disco_xip_defconfig         |  1 +
>  configs/stm32f469_disco_sd_defconfig          |  1 +
>  configs/stm32f469_disco_xip_defconfig         |  1 +
>  5 files changed, 27 insertions(+)
>  create mode 100644 board/stmicroelectronics/common/stm32f4xx/busybox.fragment

We normally don't want to have defconfigs with too many tweaks, but I
agree the STM32F4 ones are special due to their low flash/RAM size, so
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
