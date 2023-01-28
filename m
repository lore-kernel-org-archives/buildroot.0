Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8072DC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B8F7416A3;
	Sat, 28 Jan 2023 21:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B8F7416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wat4G9cLMB_j; Sat, 28 Jan 2023 21:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112E941690;
	Sat, 28 Jan 2023 21:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 112E941690
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54A771BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2157D813A8
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2157D813A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrmlVlPLobcT for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:22:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0DFE8137E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0DFE8137E
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:22:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C9C7FF804;
 Sat, 28 Jan 2023 21:22:42 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:22:41 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20230128222241.4d09d929@windsurf>
In-Reply-To: <fa36862a-c276-2e36-4c2c-d2ce7284816e@grenoble.cnrs.fr>
References: <fa36862a-c276-2e36-4c2c-d2ce7284816e@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674940963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRxRwhBCQhMSA18W6j/Z7PyNp0Q8X6q5F52BRdIhNUQ=;
 b=lQZsKpG3tLsCKO3HWy5n3ilr/WU63dlGDN+uKouZbkxyir5jxkYt68HjDOP1G98Fm/yDSI
 Fh1FZ7F0FoQbfQhaYZ9QGvux+tNPAYMgoe84Nmch+wMATyixVEaSNTcLXt+aKJHDsmK5oW
 zR1febykrlhvOl3MXzqGRn/LnzHvXNbve+wmKH/kl6iixb/45iCYIq9SArmmHwcU6Tnzmx
 k+OL265Ut0l4PKL+j9Rz/YyGC1Db70t8bAakRpXGcWVqJINfnanJD4k9snmLaOENakqicA
 RAru+3QbnAI/g9eMrSCYDrMVwXpUWaUqVqeEwEl8Np+ECM5BRHF8gymgEAXDFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lQZsKpG3
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux v5.15
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 24 Jan 2023 21:26:54 +0100
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> The updated device tree is provided by Acme Systems:
> 
>     https://www.acmesystems.it/compile_kernel_5_15
> 
> It is released under GPLv2 or later.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  .../acqua-a5/at91-sama5d3_acqua.dts           | 51 +++++++++++++++----
>  configs/acmesystems_acqua_a5_256mb_defconfig  |  4 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig  |  4 +-
>  3 files changed, 46 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
