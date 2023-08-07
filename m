Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD5C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 17:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EFF26073E;
	Mon,  7 Aug 2023 17:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFF26073E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zv8BnqumXZNd; Mon,  7 Aug 2023 17:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A14260E7D;
	Mon,  7 Aug 2023 17:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A14260E7D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2271BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4963E60EC2
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4963E60EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zx-jf_zpmJd for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 17:30:06 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C19606EC
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 17:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C19606EC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d6ff:7cb6:900b:4575])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6CF4AB0058A;
 Mon,  7 Aug 2023 19:29:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Aug 2023 19:29:55 +0200
Date: Mon, 7 Aug 2023 19:29:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230807172955.GX421096@scaer>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
 <20230726180433.7561-2-kilian.zinnecker@mail.de>
 <20230726214126.GC3544423@scaer> <8255697.T7Z3S40VBb@kilian-aisec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8255697.T7Z3S40VBb@kilian-aisec>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691429402;
 bh=Wfu7t2qNhX/OksBt4cbWrhCv0NAlDxma1LXfV+4DCJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCy5CuzVL8TX+1+CApbCJUo8lkc7c8lekXrfSsuRONTvobJGkruYIt+LatupGMVzb
 udH5ZYeVwaCDdyKygiu4D/7dIfm6onP02/zVneVqxln6ZzX0o8YdRr2SYv86Zuspwb
 vayvvHcdNta86VUfiTJjm4m8z0ZGqZAympjQdvHgRuy+sQOaALQW0Dggirffz2OQtF
 EIgx1cv53/zkEwEM0wYAnYy8XXi1DpRmpJhdLFMboOoWqM4h/MhTnMcmwftMhgRDsF
 d9gJvgclha3wqqX+UmeXqviKcf6JbbbIhvWxobsVRjneFUF/Vrc1VyX2fNKtsdnDHW
 vtCOyrV2AR9eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bCy5CuzV
Subject: Re: [Buildroot] [PATCH v8 1/3] package/rockchip-rkbin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kilian, All,

On 2023-08-07 13:45 +0200, Kilian Zinnecker spake thusly:
[--SNIP--]
> > > +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> > > +	string "Rockchip rkbin tpl file path"
> > > +	help
> > > +	  Full path to the tpl file inside the rkbin repository. The
> > I've driopped the "Full" qualifier, because that is not a full path, as
> > it is relative to the top of the rockchip-rkbin directory.
> > Ditto for the other help texts.
> Agreed. However, you introduced some typo on one occasion, by snipping "Full" 
> and "path" to "Fath ;)

You may have noticed that typoes are my hallmark, the very personal
signature of mine! ;-)

> https://gitlab.com/buildroot.org/buildroot/-/blob/
> 8d1180aa483b624f1be27bd0858c2f6665ebf36c/package/rockchip-rkbin/Config.in#L12

Fixed, thanks.

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
