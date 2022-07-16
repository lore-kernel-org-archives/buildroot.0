Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96421C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BBF140476;
	Sat, 16 Jul 2022 15:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BBF140476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hd7V05SvDR7F; Sat, 16 Jul 2022 15:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F081400FB;
	Sat, 16 Jul 2022 15:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F081400FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFF871BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F2C41776
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F2C41776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MH4zFY4BpP6q for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:40:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98158416C5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98158416C5
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:40:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 64885B00722;
 Sat, 16 Jul 2022 17:40:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:40:39 +0200
Date: Sat, 16 Jul 2022 17:40:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220716154039.GI2543@scaer>
References: <20220629121204.2347138-1-james.hilliard1@gmail.com>
 <8735fj62s5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735fj62s5.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657986045;
 bh=pFE/Vhki/vskoRHEshketnkFQC6v80F4Qqz6F0wNH6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g3ivsg8PVsFaB0vd6tpzuxkACGZqwlZnIBQ3UXOI2sFFkWHDmkH0rdId+3bFWbGK8
 JWepLDIBTypI7s9pMv9dLcjgL1haIpRhXduZFZwSdy+vvJV2QZuEKdMJlIVxGPxopK
 NZmjX0Riezx3ojJp4k+rfbaB8IMDSJ0IeCXvbShP/DTODl6VTzVl2PzI42lk5yMgli
 ArihIuvbMYWMwm8n7JnEioicBzisxj+JYabw7Pt2kd/rfVe28KwA9HSS5R8l+TLrW7
 zV2Dm63vku34HLWsGJcoB24YIT+LbKn4pCKVVAO3u2gUcRZi8rKiTLKyI9zrHy5mRO
 W99wsdbc9SxfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g3ivsg8P
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 9.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peyter, All,

On 2022-07-02 15:51 +0200, Peter Korsgaard spake thusly:
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Committed, thanks.

There was a previous patch from Fabrice [0[, which identifies this as a
security fix, so you may want to schedule it for backport to relevant
branches...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
