Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6EC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A0160EA1;
	Thu, 11 Aug 2022 20:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3A0160EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCoQ99KwaPFv; Thu, 11 Aug 2022 20:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A1C60E32;
	Thu, 11 Aug 2022 20:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A1C60E32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF861BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7613A41758
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7613A41758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2m3ULydrnX6 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:28:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FE1541756
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FE1541756
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:28:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9B0D240005;
 Thu, 11 Aug 2022 20:28:48 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:28:47 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20220811222847.013cd129@windsurf>
In-Reply-To: <20220811094049.798010-1-niklas.cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Tl8bT6yGx5cpymUfeoxioPhkkwopIC2+69q7+C9B/k=;
 b=muqRq7YVH3LhiT+uqShsiN8w8EtbntwnHtV3iO4GQ+P6xp2cz8ZGTIMvPrVs+aF0rylACu
 w41rgj+UVcbMZy3GuYL1Qf1cFdaA20ZT6H8u9wCe/QBRp/kePUTdD+F1MmQpoxeTAGpKEq
 Cwq7TeeDwDemqqJwwhtuHySuEKH6vuikZ59TM/p67NcWkf8aZ4qaA+z4nYTEZFHhrfI9Bm
 XzFu0PA0bK4BZyKOCXPPsrqf/Q/XwopxVQ2219wdRA+ENtb3s7VHgsE9O/4sZLpAllEJe5
 IE5IVrPxd3OSrAUTX3jK2xhY1ycplpmNM+f+0cKf+3Zj5nhpjdQ2o7cNNUn6xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=muqRq7YV
Subject: Re: [Buildroot] [PATCH v2 0/2] fix elf2flt on m68k, xtensa, riscv
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org, romain.naour@smile.fr,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Thu, 11 Aug 2022 11:40:47 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Niklas Cassel (2):
>   package/elf2flt: remove broken patch
>   package/elf2flt: fix fatal error regression on m68k, xtensa, riscv64

Thanks a lot for your work, I have applied both patches.

Could you make sure to upstream them to the official elf2flt project?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
