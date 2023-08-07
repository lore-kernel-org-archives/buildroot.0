Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65AC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F66B81EAC;
	Mon,  7 Aug 2023 20:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F66B81EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXyE55vG6qTW; Mon,  7 Aug 2023 20:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 246AD81ECE;
	Mon,  7 Aug 2023 20:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246AD81ECE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B54D1BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2191981EE5
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2191981EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-EJ6PICyr0f for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:25:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15DD881E90
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DD881E90
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30310C0005;
 Mon,  7 Aug 2023 20:25:33 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:25:32 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807222532.21c4dabe@windsurf>
In-Reply-To: <ZND2FWFQqlhkfDSw@waldemar-brodkorb.de>
References: <ZND2FWFQqlhkfDSw@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691439933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0oUwXZaZERAE+WxlseI6HndMaAjlEKwFoXOpqacvpE=;
 b=dIzqikg6cnGmIsHv1AtG8p5wi0CbCVvnGUdRqgliKTEqMywiLaZzFGse62YcfG2qmRXCrP
 21jKBs8fs1Z7EnaHOjRna7BR1gQ6etcxQM3EuuFNLxoMKGzDkGrc5t04Xmexe9OJjf0sBN
 SZOyP50Jh4prcblS6Wz+sT7zkdvkh4HnoDh0zQ1+8/kyJFmdIcpWPjlo1JHNgqKiwuyAjP
 Mtdq7MXXP2sV94Qi3uW98G+kyNMj+rLrBGahTBOoRwp1zHi4Yt9l2FdmzTilElXyOGrWin
 1f9ItnErEtA7dVsJ4jHPhjIq+YlqG9XJQriYowAO2esK+ni06YxJ1OxTnMxZVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dIzqikg6
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_110934
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Aug 2023 15:48:05 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> openssh package fails to build for the M68K architecture with -fzero-call-used-regs=all
> passed to gcc = 12.3.0 and it's still present in gcc = 13.2.0:
> http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/
> 
> It's been reported upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
