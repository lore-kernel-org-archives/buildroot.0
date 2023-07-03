Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A1DC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41958818CD;
	Mon,  3 Jul 2023 20:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41958818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaZE35E0tF9f; Mon,  3 Jul 2023 20:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756A08188B;
	Mon,  3 Jul 2023 20:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 756A08188B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC1601BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C593960DC6
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C593960DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XngM-fN4yzih for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:06:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D4A60AA5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2D4A60AA5
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:06:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D97E72005A4;
 Mon,  3 Jul 2023 22:06:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 22:06:18 +0200
Date: Mon, 3 Jul 2023 22:06:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703200618.GK2510@scaer>
References: <20230702144829.3356214-1-bernd@kuhls.net>
 <20230703200327.GJ2510@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703200327.GJ2510@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688414780;
 bh=0ATfeztI86ZD6LcJX4NqzkRIdkT2fQ0cmw8i3RZ/85s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dioh1o5NnaT6NK02V59HBYcOrWUmJcsF6a25gEcpsUuwJcgqwnpHXhWBeER1+Khoh
 Ndfo/2O3IqqqhccnGB0vyMmoIMCb1DJj3PREkqPpL1Ya5tw1GzjeIwtJNLDSVnvIJ1
 dtzZBGktcQVryv3EOYA22HkG1xuUuu2hRoxlmGW1ronLyhN5OTWfeUK9DsNuQiMqn7
 IAdIr9YJikCfs9okhJIYrFv7rzQTy1pR/RO1dHmZd9nLKALwH5oQvYEISnMeixQMG2
 t+AwoOZLUx1zI1g4/N6wTUZP2JABB7wzJXZl/T1YcbpVXmRaVq/z4LEYcDbJpdYiGL
 4V/nGPtWlMPXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dioh1o5N
Subject: Re: [Buildroot] [PATCH 1/1] libgcrypt: disable assembly for i386
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

Bernd, All,

On 2023-07-03 22:03 +0200, Yann E. MORIN spake thusly:
> On 2023-07-02 16:48 +0200, Bernd Kuhls spake thusly:
> > Fixes:
> > http://autobuild.buildroot.net/results/3df/3df96fe36802d8c6ac5487bf3d7d7b6c97591d5e/
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > ---
> >  package/libgcrypt/libgcrypt.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> > index 4fffe5360e..bd7b1aa091 100644
> > --- a/package/libgcrypt/libgcrypt.mk
> > +++ b/package/libgcrypt/libgcrypt.mk
> > @@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
> >  	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
> >  	--with-gpg-error-prefix=$(STAGING_DIR)/usr
> >  
> > -# Libgcrypt doesn't support assembly for coldfire
> > -ifeq ($(BR2_m68k_cf),y)
> > +# Libgcrypt doesn't support assembly for coldfire & i386
> 
> This is relatively weird, especially, since they do have upstream commit
> that try to make it work on "old CPUs":
> 
>     a5d126c61cc0  configure: fix avx512 check for i386
>     f01d4b7a601f  mpi/longlong.h: i386: use tzcnt instruction for trailing zeros
> 
> So maybe this is a bug that should be reported and fixed upstream?

Anyway: applied to master, thanks.

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
