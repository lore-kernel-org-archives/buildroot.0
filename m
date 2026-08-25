Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF38C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B02380B40;
	Tue, 25 Aug 2026 20:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6frRo2fgVnMU; Tue, 25 Aug 2026 20:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787689544;
	bh=/9PBg706DuhW/7NXIzf1p6lqT8fmDkgNAropkToi1jo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hi56WCHOVu+/xAyB5GKDpxpqTP45zL8s/Z4WNWo1i6dEUtr2hg0inWoyB/NnAEePI
	 OdnqzAKynYL2PDXecypdwRzSQq/KyKdwrWVmxtEjRBrfUNFP9uCBWLVOim8uC3ye1y
	 7jww0Sg03Ny0wGU5OYkIKB61bJ1VSfc+o4QKn+3PnbY3C/OuwpONH1mUyDqoPT5Cjo
	 4XCspNQO/QADK3tQaLg3cHPkTG0XMiIKSnDRiYkaVOUBL5/OCOoab3j9TsnRnTZ7zF
	 BWMaarKOVjV3MPZhWrXzbiYW0KjMcTxXcp8S9pu8OzYe0r3rzpYmO4eqfjTSzAekip
	 lyKAtMc2sFFsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460BE80C11;
	Tue, 25 Aug 2026 20:25:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38E3E2FD
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EF4E400A4
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvo3mdYHjy9R for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17A4F40055
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:25:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A873D4E413B4;
 Tue, 25 Aug 2026 20:25:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C7E2604C4;
 Tue, 25 Aug 2026 20:25:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D237A11C7A7B3; 
 Tue, 25 Aug 2026 22:25:33 +0200 (CEST)
Date: Tue, 25 Aug 2026 22:25:33 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Buildroot List <buildroot@buildroot.org>
Message-ID: <ao36H3zReUs-lIQA@windsurf>
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
 <aoNuO__aQMnMl0ni@windsurf>
 <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
 <aodK_V5XZwTZ3S_L@windsurf>
 <CABvxksyvBezT1ur2Ai9jhDM=a+YzvY3NyfXPo133-aAFXKmZ2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvxksyvBezT1ur2Ai9jhDM=a+YzvY3NyfXPo133-aAFXKmZ2w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
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

On Mon, Aug 24, 2026 at 07:21:53AM +0530, Shubham Chakraborty wrote:

> I think we should update the unrar in the stable branches.
> 
> It was an oversight on my part. I'm still learning how to communicate these
> decisions properly on the mailing list.

So now, I am confused. What are the next steps?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
