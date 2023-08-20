Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D69CEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA00760A8B;
	Sun, 20 Aug 2023 19:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA00760A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwHlDKpFcgo2; Sun, 20 Aug 2023 19:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ACFF60A7B;
	Sun, 20 Aug 2023 19:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ACFF60A7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E44CE1BF403
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3EFE60A7B
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EFE60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcLv4RUQu5la for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 19:26:02 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22B1D60A7A
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 19:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B1D60A7A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:583d:50bb:f558:e336])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 611B319F58D;
 Sun, 20 Aug 2023 21:25:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 21:25:57 +0200
Date: Sun, 20 Aug 2023 21:25:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230820192557.GQ1778688@scaer>
References: <20230820152011.81543-1-kilian.zinnecker@mail.de>
 <20230820152011.81543-2-kilian.zinnecker@mail.de>
 <20230820160831.GP1778688@scaer> <2899600.e9J7NaK4W3@kilian-aisec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2899600.e9J7NaK4W3@kilian-aisec>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692559559;
 bh=bcCO/IZZ/0nE8fwz2oCkainDimRBWNuGjLIqVf2ya30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeIdrVvF3eUPWMgiBn/Y540GgEQI0SW9VPzbHMWLwmaGOXY/Np6+CM1Rl8bBvhpPS
 9u2Y/jz49Y0Owc5UQq7gYHv9Hej7DdB7lKr/iWOSUHus0iW6MLL/SE5TGDF5P8wFat
 utMeqek1zV1HPqBRp7cy673HEfJAXwFA48J+3LVVn63zdwZS+UreuDu8JFRABRBD3K
 F3LhJ7KyuCNxJLALOKiXN32c+c23+UbBzveHue6JCbh8vynRoFW/qO5opzbF/7eJ+A
 cGjVCcdIAzEIZWX5KJ2IGtG8kD7pVcTuXZo1R94MUk1g0VA0OK1WgTo84JZa7oRkg+
 wqnILmKS3obJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KeIdrVvF
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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

Kilian, All,

On 2023-08-20 21:09 +0200, Kilian Zinnecker spake thusly:
> > Also, it misses your own Sign-off line:
> Thanks, I was absolutely unaware, that adding a signed-of-by in case one 
> commits other's patches as patch files was necessary

Yes, the SoB line shows who handled the patch along the way it took to
us; you are part of the chain. In the DCO, that's be clause (b):

    https://developercertificate.org/

    By making a contribution to this project, I certify that:

    (b) The contribution is based upon previous work that, to the best
        of my knowledge, is covered under an appropriate open source
        license and I have the right under that license to submit that
        work with modifications, whether created in whole or in part
        by me, under the same open source license (unless I am
        permitted to submit under a different license), as indicated
        in the file; or

> and also that an upstream 
> link must be provided.

Having an upstream tag helps track whether a specific patch is still
needed when the versions of components are updated.

This upstream tag is a relatively recent addition, so people are getting
hit by it, no worries (I caught it as I have a git hook that runs a
bunch of checks on each patch I apply or commit I make).

Regards,
Yann E. MORIN.

> I tried again - hopefully I did it right.
> 
> I send a v3 of the patch.
> 
> Thanks and best regards,
> Kilian
> 
> 

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
