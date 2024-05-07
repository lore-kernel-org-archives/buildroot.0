Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C651C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D991D812A7;
	Tue,  7 May 2024 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrm361WtxQuT; Tue,  7 May 2024 20:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318D181289
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318D181289;
	Tue,  7 May 2024 20:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90FDD1BF281
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5BA401BD
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wt2_VYoWjtJF for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3F3240277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F3240277
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3F3240277
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:09:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 74DB813FA4F;
 Tue,  7 May 2024 22:09:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 May 2024 22:09:28 +0200
Date: Tue, 7 May 2024 22:09:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZjqKeObcP8cjtoHG@landeda>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
 <87msp1wqqo.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87msp1wqqo.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715112573;
 bh=RVyWss9B+XVkMXw4c4CqMzLBFK1cz9lBeHy2ZrqC84A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZMyv6zcRzSlkBoXsdrBeQDYuEl5Vv39rlLOlWQyzHRvE8bwY4CJJeGl3mYUCCLxo
 4VZd1qtlyZw8VtFJCSIkG460IeBkv7tQbAgYwjyQFCsIg/W2U++9bbrvNIo2geXEmH
 GpvR9c95ePoo2pBwXXuBxBhmu3FH2JTqw/neKUv7Eml3AByWy92Ap2au/mREQ93PuW
 zisCipgZNbNc0IYFGR9cTsO1Kqctzj6ISR2TJAV0hqIDbCFGmrYvhc6+ozNIcyz2ai
 Adh/vUqmKuOqZ1RKyf4FY8lvJhfubJKXSWU0pr6i0ZZaYsiIP3ELdMM6dsBY9g6RCm
 8Tim6Ym9E9axQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NZMyv6zc
Subject: Re: [Buildroot] [PATCH v2 1/3] package/bmap-tools: update GitHub URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-07 18:06 +0200, Peter Korsgaard spake thusly:
> >>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:
>  > As reported in the README file of the old GitHub URL (i.e.
>  > https://github.com/intel/bmap-tools), "The code at this location is no
>  > longer maintained and will likely be removed in the future. This project
>  > has moved to https://github.com/yoctoproject/bmaptool".
[--SNIP--]
> I wanted to apply this to 2024.02.x, but this change of repo changes the
> hash of the tarball (I guess the name of the toplevel directory
> changed):
> 
> ERROR: while checking hashes from package/bmap-tools//bmap-tools.hash
> ERROR: bmap-tools-3.6.tar.gz has wrong sha256 hash:
> ERROR: expected: 0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7
> ERROR: got     : 7a2e1305bf7e06bc4a580cc719f0facf9d99af8d41659b57c0acae4ad93ff45a
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Indeed, that's because the top-level dirctory changed, from bmap-tools/
to bmaptools/ as it is generated by github.

I missed that, because I only tested the whole series, which ends up
with a version bump, with an explicit hash change then, which was
correct...

I totally missed the fact that the top-level directory would change,
sorry...

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
