Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8711CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 13:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7BA260D9C;
	Tue, 12 May 2026 13:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDQ5XkDC4Vx1; Tue, 12 May 2026 13:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3382660BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778593002;
	bh=/WlmSX5Y02w3Z3JFdM2ndkmWOOSh4wYK6Ark7jyRdWY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ke1acBY94JLt6L9z6Tomvr0QmZzrVDQIaXnL1XbiqoJugFEkB+l+bhq0WRm4FjGnv
	 o9SStrB4E1cIHN/THaXg9xvMnsCZImsWufUiSSMZQ4kagL6uXsXEHPoP2S4W4G6+bS
	 VqTR0bx4PLQKxAjb4VcMO/YsXOJelmovsrULZheifX4FVgCREA8m61nmNKT1wH4H7H
	 XqBRgakL9R5dnUZmv8Xfy8dCOpOA69fuaGx2Cie+4HRYC95Od/HbH3jQEWduuJG2W4
	 k0V3Z0AGAhVdTXlB/rVgVuUQr3RixAmrQg7NYQAJpejlwmZyNTTZ0Z8HlE3ZDK1MbP
	 pKwFp701ZC+qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3382660BB0;
	Tue, 12 May 2026 13:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2326223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C02038229B
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eToqUvc6ruV for <buildroot@buildroot.org>;
 Tue, 12 May 2026 13:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 342C882268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342C882268
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 342C882268
 for <buildroot@buildroot.org>; Tue, 12 May 2026 13:36:36 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id EDD10C2652;
 Tue, 12 May 2026 15:36:32 +0200 (CEST)
Message-ID: <1d003106-63b6-49d5-90c0-4f7c0f2f1f79@grenoble.cnrs.fr>
Date: Tue, 12 May 2026 15:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanak Shilledar <kanak.shilledar@axis.com>, buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>
References: <20260512105602.83368-1-kanak.shilledar@axis.com>
 <20260512105602.83368-2-kanak.shilledar@axis.com>
Content-Language: en-US, fr
In-Reply-To: <20260512105602.83368-2-kanak.shilledar@axis.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1778592993;
 bh=w/egtHI1SvpraSPR2yIjAoyAqC0/xdsP2nOjcWDwwi8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HRMnaGRsh89j0wIdrxCIejgHeodRI0g1om4P9HzYwggXqIh56oQmve1WeZGSudHoL
 bcm9VxCJPhDTjYHmhTVoJRsZ9bW2aHWdG1lq54usgaNb1ORtDuQswlvMuowuXt5ewO
 ZGNxfMFQTILt7PwH1fBIf3r7nnNQHMnYhuM0iv4VolYfUKxYI3AAnD+lL8OLqSRS2J
 9DRGanWjyywEtjZORRX3xOb760BJWpwec7I/mHIL2MjJYttGhVwQTKoV7d46raMEOp
 WQS00pnsme4kLmlz8RWyUHF9xrgyMyfDs/o85VknhHuO/Dp4831fkCQc68Uxe4OJNJ
 BvE0WDHU4g1Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HRMnaGRs
Subject: Re: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler
 warnings
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Buildroot people!

On 2026-05-12, Kanak Shilledar wrote:
> Add a new patch to fix the compiler warning given on Ubuntu 24.04.4 in
> `util.c` warning of `-Wformat-overflow=`. [...]

This seems to me like a duplicate of a patch[1] I sent in July 2025, as
part of a series[2] that also updated support/kconfig/patches/.

Also, both your patch and my series are likely in conflict with a more
comprehensive rework of kconfig[3] proposed by Titouan Christophe on
2026-02-04.

Regards,

Edgar Bonet.

[1] https://lists.buildroot.org/pipermail/buildroot/2025-July/782825.html
[2] https://lists.buildroot.org/pipermail/buildroot/2025-July/782822.html
[3] https://lists.buildroot.org/pipermail/buildroot/2026-February/796328.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
