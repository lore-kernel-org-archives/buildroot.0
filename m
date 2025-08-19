Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA95BCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D156072B;
	Tue, 19 Aug 2025 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJxbHox13ok2; Tue, 19 Aug 2025 20:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D1660744
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D1660744;
	Tue, 19 Aug 2025 20:24:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E957E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FCF860BCF
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCWiZCQE2KXO for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 518F16072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518F16072B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 518F16072B
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:24:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4505B4E40C2E;
 Tue, 19 Aug 2025 20:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F142960697;
 Tue, 19 Aug 2025 20:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0B521C228A8C; 
 Tue, 19 Aug 2025 22:24:27 +0200 (CEST)
Date: Tue, 19 Aug 2025 22:24:14 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20250819222414.3ea8948d@windsurf>
In-Reply-To: <20250819181451.3012126-2-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
 <20250819181451.3012126-2-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755635077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BtPEXGln2n2aqcytIM9VOb0q/v/GQmPgBbaeFlVeXL0=;
 b=kwUD6xC1HWCF+9Qv1LG6BvxKPtchlPC69uLsqZ3xncO6egz6excVgNCQieF9lQfJfwIE5i
 Jl7Hn7faipLodBLvx26JZ4ad+XkIOHzp3NtoFsj7ZAowNOOo6DH1/ZvxMeikU1OVqAGMD9
 GOGIgwumkCWThU8Rdt2cicMzzSiqjrCtHtITFjsIQsqjiOAowtM0ktGX1b5yD3S5tSXhHI
 obIcPEdF//tRQX8sms/a9QVExJ/vG7eE69UBPTGSxmOlvZuzPdLyAj6ssZnAvrU83n2VDJ
 2pLA0r7K//A5qajJmCugzCiUrROnLCcUlh+gKGwlpNhZpIGlX6QCLXd3MTjvdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kwUD6xC1
Subject: Re: [Buildroot] [PATCH 1/6] linux: add missing hash for linux
 6.12.36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

Thanks for the quick turn around with the patches.

On Tue, 19 Aug 2025 20:14:46 +0200
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> diff --git a/linux/linux.hash b/linux/linux.hash
> index f5e2d663d1..599d2bc6b3 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,4 +1,6 @@
>  # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> +sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
> +

Unfortunately, this is not how it works. Each defconfig should have its
own set of hash files. Check out:

board/freescale/imx8mqevk/patches/uboot/uboot.hash
board/freescale/imx8mqevk/patches/linux/linux.hash
board/freescale/imx8mqevk/patches/linux-headers/linux-headers.hash

and:

BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mqevk/patches"

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
