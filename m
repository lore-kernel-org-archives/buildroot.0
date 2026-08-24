Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326FC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D12D80C92;
	Mon, 24 Aug 2026 19:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CSDAFTY8QIF; Mon, 24 Aug 2026 19:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787599143;
	bh=YQQyOl9ONl8pZz2xQHjZPAFpJU3nuZGYhMVkjC0geA4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WyyZeKq4BrVdEqAAeLMhqkARpbvMgkxMI97QiU7gHadYui267jk2hnpLB3EipCfLY
	 uD0a31K9s1Hc33Dt+p8YjGn5lYRsGy2qMXrC+MHdBjusidYwvbWsqwtEzgEtydjWrc
	 DTu2rsU5Pjfnx7ikqE0VBETs35GpiUs2SseVrWfAZhW7ivIBf6C9D6F9jWanaXEX9E
	 PiknRtiBgRFgIbaaehPmN4rs0mEakACmphb2RbjZM88TfPdR/FunI+NLG0RQ7+p/xP
	 fZGRpOfZURgZwRIbps2gOtHcw+zYrHUA6rEf/aL5/7zCV0sIcCkWkCCzJibHud57xs
	 sSQqxDaE7SOMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B2880C72;
	Mon, 24 Aug 2026 19:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F4C2FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A92F1405AC
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QMfXBU76q0a for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0E3540557
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:18:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3B6131A1804;
 Mon, 24 Aug 2026 19:18:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B32C5FFC1;
 Mon, 24 Aug 2026 19:18:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 386EF11C79B23; 
 Mon, 24 Aug 2026 21:18:53 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:18:52 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <aoyZCNzouS27J56C@windsurf>
References: <20260811134312.170306-1-thomas.perale@mind.be>
 <aoyY5FKwXCsNzMff@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoyY5FKwXCsNzMff@windsurf>
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

On Mon, Aug 24, 2026 at 09:18:18PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, Aug 11, 2026 at 03:43:12PM +0200, Thomas Perale via buildroot wrote:
> > Users asked where the notes are available and if the information are
> > publicly available.
> > 
> > Those changes clearly explain the location and convention of the staging
> > branches and also link to more documentation on how to read the
> > annotations.
> > 
> > Also update the timing of the different steps to be less specific.
> > 
> > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 
> Thanks, applied to master!

Dammit no, scratch that. This is not the patch from you that I
applied, sorry about that.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
