Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E0EC61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B6060613;
	Sat, 29 Aug 2026 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQ9ustM_iRA0; Sat, 29 Aug 2026 21:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038456;
	bh=Zf5VFArg3m3+9Exd4fN4uFiEvZ+vVBuJwruNfgwq9ig=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LmfNuhLTDy/YntOgA8WHlDAB2ptL9UBH1vLHHV+dRRLbtNSkqATDxb4l57Gz+qHwA
	 7yZykvAa65drGNKtWecMguOnTAGrNby0jqG0WYVEF6qF+TM5zenCxIeIw8GoEdYyZI
	 fvIbxFmw92AfDT6yQnyNpb66+so4IFQ4Q+D794vQNj0r2DCkoW6jqxdrwu2sCQXn3m
	 GT15I3Qkpmb18UoxXqLWFC/qTKRXklFkguVk3iEu7eOtpAeRD7FhngAkwRz8k7cNmO
	 DCkGddWVK0Meuze+89he7LIMe15uuMQEwMuAmMfsL7IIhDdxRsmAfutFzbIeM/W563
	 VC+SKkYGzJ1Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CF4605EE;
	Sat, 29 Aug 2026 21:20:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 541C39D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 466E580E14
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyXmBx97wCCk for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 418E380CAF
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C1B361A1868;
 Sat, 29 Aug 2026 21:20:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E21D6053C;
 Sat, 29 Aug 2026 21:20:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C952011C781D9; 
 Sat, 29 Aug 2026 23:20:46 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:20:45 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org
Message-ID: <apNNH5Y3vUnj2SCa@windsurf>
References: <4c1871d0-8cf8-e749-7d65-232c16460a3d@crashcourse.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c1871d0-8cf8-e749-7d65-232c16460a3d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] docs/manual: update intro,
 make gender-neutral
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

On Mon, Jul 27, 2026 at 03:10:17PM -0400, Robert P. J. Day wrote:
> 
> Besides just updating a little terminology, remove the awkward
> reference to "his" when referring to developers.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
