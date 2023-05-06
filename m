Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86364C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDE7612CB;
	Sat,  6 May 2023 14:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDE7612CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHCpE5JvFBMB; Sat,  6 May 2023 14:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A6D6115F;
	Sat,  6 May 2023 14:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A6D6115F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10C401BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8D56112C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8D56112C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EteC_fmttCBe for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:43:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D755E6104F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D755E6104F
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:43:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E2204B0056A;
 Sat,  6 May 2023 16:43:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:43:00 +0200
Date: Sat, 6 May 2023 16:43:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230506144300.GF2661@scaer>
References: <20230504073820.16831-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504073820.16831-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384183;
 bh=osXK2GwsHfyh10dV55mB+lNgBR/S9hSs9JJtobHJ/UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ni+27gurHUlhkFq4N1Sh+dxESFJI/al3u5oHRE8HX5s5kytBUa4mhIPwNqMsB2YyN
 k9mwe7UomCEkQGODedL2AUSrc9OXTEogn5mudJbGafFSpSOV39BaweqowJ6fQSKIk+
 R2QNETyvQiivt7zBNnA60SMtzeJFxvfq66EMNvBApKtGEgoEmhmtqMUxI4nBeYiZqK
 63nvMbwyWNPgzWAAPn8khWBjozqLDwVfmrnl2FHenbBGP8CGFqNrHhpwMjxSjB7AjO
 IUmynRPgqRIUYUH7qHBvcrFxZAMWfPjbTtTKAsuSXx6QaKYUenIbO0+9UDLwDS/V2Q
 cj0ICAoJv8reg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ni+27gur
Subject: Re: [Buildroot] [RESEND PATCH] package/libostree: bump to version
 2023.2
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

Marcus, All,

On 2023-05-04 09:38 +0200, Marcus Folkesson spake thusly:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

There is no need to resend a patch: we do not lose patches as they are
all tracked in patchwork, and this is where maintainers get the list of
pending patches:
    https://patchwork.ozlabs.org/project/buildroot/list/

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index 63dfe98d80..db99b4b07b 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55  libostree-2023.1.tar.xz
> +sha256  ceb0788755a0bff5738d44543552fbf883cf71df481baa3ca7288da7a402bb85  libostree-2023.2.tar.xz
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 4b17fcf391..367a833ac9 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOSTREE_VERSION = 2023.1
> +LIBOSTREE_VERSION = 2023.2
>  LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>  LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>  
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
