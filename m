Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF07FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 08:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A5082B34;
	Fri, 21 Jan 2022 08:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIxe08Kw5sUI; Fri, 21 Jan 2022 08:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF7082CA5;
	Fri, 21 Jan 2022 08:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 298E31BF83C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 08:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14ABC82AC8
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 08:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTkgHQCyCiDH for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 08:05:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD2782978
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 08:05:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2ABA1B00583;
 Fri, 21 Jan 2022 09:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642752299;
 bh=0cLMe/77nV1qbmEIULkApwkGQlJ4t8CCCYmeJS7oUDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=prc4Pnmk5VrkycmGJDxSkvkdNEMPalmvVnF8TJzUq8YKKMyC/hVirFc+B+hbMOyMt
 sqtbsNtFIHgyO+TbICjlpFvoYRpzXr2nVarb2xhTfY76UfzWFiNcx76wsMfn1mWCqg
 yanjhtWj6/ky3ud1wGf6/wGtexaQf4JqpWHmXTiYf7Fli3RsAXZIplk65TvrkfKm7i
 q37Va2hjXJqfsNP6V4TqeI/LfLYzg6fOjCdaua+nk1UYepWtFs0UpSy5tqCpB4txfv
 SLCel/y8XOetWg4juxriN0K5isMrNiCIjs26fz8782pL/7sqTSw6+OQd+pEUAi5HgZ
 ecDI5R0dfWLZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 09:04:56 +0100
Date: Fri, 21 Jan 2022 09:04:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220121080456.GH3252931@scaer>
References: <20220119212206.1ACA681763@busybox.osuosl.org>
 <20220121085045.2e375b6c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121085045.2e375b6c@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [git commit] package/brcmfmac_sdio-firmware-rpi:
 merge of rpi-{bt, wifi}-firmware
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-21 08:50 +0100, Thomas Petazzoni spake thusly:
> On Wed, 19 Jan 2022 22:24:11 +0100
> Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> 
> >  ################################################################################
> >  #
> > -# rpi-wifi-firmware
> > +# brcmfmac_sdio-firmware-rpi
> A quick nitpicking comment: I tend to dislike _ in package names, and
> even more so when it's mixed with - in the package name. As it doesn't
> affect the Config.in option name, perhaps it's still time to adjust
> this to brcmfmac-sdio-firmware-rpi ?

I don't like it much either. But the reason for the rename was to match
the upstream name, which is exactly what we suggest in the manual, and
that we argue for most of the time.

And we also already had bluez5_utils-headers and xutil_util-macros, and
78 packages in package/x11r7/

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
