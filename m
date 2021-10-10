Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A20C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D5660F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11D5660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9101400DE;
	Sun, 10 Oct 2021 17:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDGuiuHi5RGO; Sun, 10 Oct 2021 17:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D76E840101;
	Sun, 10 Oct 2021 17:42:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC0E1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B1EA60669
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czWkb8ZU9FuD for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00281605FD
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:42:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9462219F57B;
 Sun, 10 Oct 2021 19:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633887744;
 bh=4DqOYhwyJI8WVyQVCyNzLlldITjEFPOY+Y4mfpuRAz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NejM5NNFAlqbfUkmg75dYSzVC4B0zOyK2X0DeRmbV0OMlTr7uRcT4SrWFalwkIAbb
 s2etEi3MHxClNyza2CySEODtDmvovzQbiz55kMrHKGn5R+tcTQ0Nw/HBZg1rl+ijPN
 Mrgb30KGeT/MDQkW9+av3U83dqSH3KDvSifrhqW9+ip6hlFFSBNvxhG493XTJ7VtmV
 D8ClbwRQwy9wB1qC+LHfo7fkd5iiJMRRvAWK6DUXBggRbaGOur1Q8dCjRo+UQ3AbZz
 A6OnE1uSE1m7VJwgojzT9zy/VMAeEhioKNI8nXxrm0PojJXiSHGHvLCT4Fmkv+Khih
 snLd/WJY5zygg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 19:42:16 +0200
Date: Sun, 10 Oct 2021 19:42:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010174216.GL2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-3-thomas.petazzoni@bootlin.com>
 <20211010091059.GK2081069@scaer> <20211010155733.09c1367c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211010155733.09c1367c@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/5] package/gdb: add support for gdb 11.x
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-10 15:57 +0200, Thomas Petazzoni spake thusly:
> On Sun, 10 Oct 2021 11:10:59 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I can fix that when applying:
> >     select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
> Gah, of course, you're completely right. I thought about this when
> starting this work, but then go drowned into all the implications
> (adding test cases, changing generate-gitlab-ci-yml, etc.) and forgot
> to get back to this.
> 
> Do you want me to resend, or will you fix this up when applying?

Fixed, and applied to master, thanks.

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
