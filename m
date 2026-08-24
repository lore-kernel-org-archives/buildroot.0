Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E91C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECF180C72;
	Mon, 24 Aug 2026 19:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUQbEvXDaaOT; Mon, 24 Aug 2026 19:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787599104;
	bh=tYK96o8d8HgCAzhWAuMivc97p9cxPCGy8JpvsDxQ57A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jl4kVOh+0CRREIW+W/O/Y1W250Ts0KxEcFdiylGFCM3TdB5I2lGqIrsCFUMzOkNti
	 cCdV0j9J6/d+9Gll6YMpr1cyU4u2q8aDBstZb/lsPWfBM5XN7egyx++HoalF5CJqqn
	 bLDB/gKoyIAyMvaDaU6LV52YsglqKhf0M5lo+hI7hN3ReydIAfG9Iq0ZGpg9VWbnX5
	 RrLUYYJROpovmuZ3W3UYfNp5afwiMNoG86ub5f3k36e4i+nVzG2+VPFXkcRyYkLCJh
	 LXgXJjofnyswcPzLVaOH1WSTVHJhhe1zAojVeuYeTfeIE92Cvicfxc8AArwVFi5X9u
	 Bvy15TgYolATQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79FC580BCD;
	Mon, 24 Aug 2026 19:18:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B9632FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3187440539
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SenZ_eb6v6PU for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32E0240532
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:18:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 49FDA4E4139F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:18:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 060515FFC1;
 Mon, 24 Aug 2026 19:18:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3D2C11C79AE3; 
 Mon, 24 Aug 2026 21:18:13 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:18:13 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <aoyY5FKwXCsNzMff@windsurf>
References: <20260811134312.170306-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260811134312.170306-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] docs/website: link LTS tooling
 documentation and staging branch
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

Hello,

On Tue, Aug 11, 2026 at 03:43:12PM +0200, Thomas Perale via buildroot wrote:
> Users asked where the notes are available and if the information are
> publicly available.
> 
> Those changes clearly explain the location and convention of the staging
> branches and also link to more documentation on how to read the
> annotations.
> 
> Also update the timing of the different steps to be less specific.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
