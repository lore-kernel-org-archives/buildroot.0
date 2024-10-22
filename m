Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED36CDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E22F80BE1;
	Tue, 22 Oct 2024 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YV60FQuXrd-Z; Tue, 22 Oct 2024 20:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A856780B65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A856780B65;
	Tue, 22 Oct 2024 20:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE0659F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55CB80BC6
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkxZ4ih1BnKB for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26D1580B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D1580B16
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26D1580B16
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89A9C20005;
 Tue, 22 Oct 2024 20:46:32 +0000 (UTC)
Date: Tue, 22 Oct 2024 22:46:31 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241022224631.3adcf661@windsurf>
In-Reply-To: <20241016132443.3859149-2-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-2-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729629993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4OIJFVkNn54Uq9ueuyvOVEKfJf39WRoorpyUkuXKjY=;
 b=lhxjbX9T9gQ6MJcq+u5c7LOfSb2oweZRn/cq7QQYcx5qKv3vvOIqq327btegSGB3G/O1/d
 X5K7qmv17kUZL1ceJuR/83yaHCVjxWzNxjdPBmPx4GURb605SC4IOR9tvZ+F92PcqPeH40
 w0Ke9v+RHAniaCoG6RL3jwLjnMNteFupotrImSHFuC9oOQbB+nMwdQVXjLEReb7HzJemmQ
 5ayiu4gV2vv4dHL1KsH4r7UaDb7Ad1D6fAe+L7EoCakkdxuOaA/RIMK08iE8wHu81ExPxP
 jeffV5rewF/e3Lv7ogXjq3+nk7CnOofHdPeBlh75R4BDXZMAYcEvA0jFhI/O6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lhxjbX9T
Subject: Re: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux
 6.11.3
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

On Wed, 16 Oct 2024 15:24:40 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> A bunch of new hardware has been enabled for rock5b in linux 6.11,
> most notably USB3 host controller support, GPU support, cpufreq
> support, and PCIe endpoint mode support.
> 
> Add the dependency on host python3 that is new since linux 6.10.
> 
> Also add the missing dependency on openssl (which has been needed for
> a long time, since we are using arm64 defconfig, but only shows up as
> an error if the host system doesn't have extract-cert installed.)
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  board/radxa/rock5b/patches/linux/linux.hash | 4 ++--
>  configs/rock5b_defconfig                    | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
