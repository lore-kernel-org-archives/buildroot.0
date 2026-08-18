Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44489C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 906DC80F8B;
	Tue, 18 Aug 2026 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhFvXoUAOm-O; Tue, 18 Aug 2026 20:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787085239;
	bh=xk9Tr4msnk8nlIEr1rHvPekxwUsa6C4kdBVwDD9rQmo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fAQlc98flftCjZo5MMQ5/M8o2qDuqcmzyM6LN8CLi329OcohxArDRJYuUkL93ndSi
	 8V2ERhsN6aDCeuqAgFn1beQ31nnIash68fmNF4AFhLQCs6PRFe6Frbjtxvqh5xfkVQ
	 dvGGVUag1ZrohlHfG9L4nvOgXJhbWoFYtrOEFIcZ05RrTe1PjySMbyDIvSbRWJk7BK
	 lWJ25q1H1ZFIvC3Ksw4fWFv1bZJhKwHCEvQjb5Roz77TDp1tzH1OjB4ne651HjFsMQ
	 ke6Pza9aBQGAJaSSOTC6BuzZAgJywWlL72WUFwl++uPzb4JjeYxP7OP7enbH9yWNem
	 c3j5/i6HWb6MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9EE80DBB;
	Tue, 18 Aug 2026 20:33:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2C5F265
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84D9940216
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hymoIzGHbvm0 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 20:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87CA940140
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:33:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2CEBF4E412B3
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 20:33:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EED5660355;
 Tue, 18 Aug 2026 20:33:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4312311C74F49; 
 Tue, 18 Aug 2026 22:33:48 +0200 (CEST)
Date: Tue, 18 Aug 2026 22:33:47 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aoTBcIHs7w0QnXTX@windsurf>
References: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de> <aoQIk-X_afYgeQQN@windsurf>
 <aoSikbmgH9HZsX5Z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoSikbmgH9HZsX5Z@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable FENV support
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

On Tue, Aug 18, 2026 at 08:21:05PM +0200, Waldemar Brodkorb wrote:
> Yes, you are right. I always had libquadmath disabled in my
> toolchains while testing. Fix sent to the BR mailinglist right now.
> 
> https://lists.buildroot.org/pipermail/buildroot/2026-August/807736.html

Thanks a lot!

> Thomas, are there any plans to update the Bootlin toolchains?

Yes, Romain Naour and I are working on it. This is why we've reported
several toolchain issues lately: because we've done a full build of
all toolchains, and discovered some issues.

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
