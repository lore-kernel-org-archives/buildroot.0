Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22764C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 15:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C61041106;
	Thu, 21 Apr 2022 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiqNKaKueN5M; Thu, 21 Apr 2022 15:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C7B410B7;
	Thu, 21 Apr 2022 15:39:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 369D41BF304
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 15:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2518981A3E
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 15:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmcdVzD0byik for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 15:39:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AECC5819CC
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 15:39:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D25955FF96;
 Thu, 21 Apr 2022 17:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650555551;
 bh=zjtjhDQJtegZy/k/unuW029eAHVJVyHqWhyyPWoNKDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hJeaz+EebBRNJzBKRVMzcTCrJRA5jrdanm08KbeKPCAh1TO9t/L9GCUzVg8vlRD0c
 WIiULuXQ1OUk6DCh3utdiu9V2B3YzcG1G5w4xNtCrp1wswO3yzb+HR3OqqUbkxfY9u
 9DsN1b1haTz+Wm/OVhnNBX2+GwntpXJRsFwhi3ieJPcOg/4jd7AhJaxyMEa4Y3YVxL
 CVMHvzFmjtjsYYCS1QIstzdp+qsuQH9I3wv0Qo1JZWVwQ6laPs43iH67DmH5tacYLu
 aOCmyrCQZ5TF2W6sIpvMRt1VLoRQC0u+UY4WGx8x08h8N04e46LqOxDGY3ga6YfPzO
 GINXIokHcHtmQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Apr 2022 17:39:08 +0200
Date: Thu, 21 Apr 2022 17:39:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220421153908.GN2730@scaer>
References: <20220420200102.2420626-1-yann.morin.1998@free.fr>
 <8b28d775-d65a-d6e2-2b50-6bfc6549df0b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b28d775-d65a-d6e2-2b50-6bfc6549df0b@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/wtfutil: new package
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

On 2022-04-21 09:22 +0200, Arnout Vandecappelle spake thusly:
> On 20/04/2022 22:01, Yann E. MORIN wrote:
> >Some of wtfutils modules (i.e. plugins) can call to external tools, so
>  Modules are not optional?

As far as I can see, no. All modules are builtin into the wtfutil
executable, and there is no way to provide out-of-tree modules loaded at
runtime. And indeed, using the word 'plugins' was wrong (well, they can
only be plugged in at build time).

Also this is go, everything is static in that world.

Upstream would however like to go for an actual, real plugin mechanism,
but it seems the go ecosystem is not making that easy:
https://github.com/wtfutil/wtf/issues/1092#issuecomment-892312321

[--SNIP--]
> >+WTFUTIL_VERSION = 0.41.0
> >+WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
>  If the upstream repository is called wtf, and the help text says "WTF is
> ...", why do you call it wtfutil?

The website is wtfutil.com. The utility is named wtfutil. It is packaged
as wtfutil in some distro repositories already (Homebrew, macports,
Arch...).

The README.md also states:

    WTF (aka 'wtfutil') is the personal information dashboard for your
    terminal, providing at-a-glance access to your very important but
    infrequently-needed stats and data.

Finally, wtf on its own is a bit on the tendentious side; using the
longer name tones the term down a bit.

Yeah, that is not all entirely convincing, but I believe wtfutil to be a
better name overall...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >+WTFUTIL_LICENSE = MPL-2.0
> >+WTFUTIL_LICENSE_FILES = LICENSE.md
> >+
> >+$(eval $(golang-package))

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
