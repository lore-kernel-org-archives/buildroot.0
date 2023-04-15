Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1AEC77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 08:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6117001F;
	Sat, 15 Apr 2023 08:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6117001F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OO6LEx_Oei9K; Sat, 15 Apr 2023 08:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530687001A;
	Sat, 15 Apr 2023 08:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530687001A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 658FF1C3FA8
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CDF4844CE
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 08:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CDF4844CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05jvoJBxS5x0 for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 08:41:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F9A8436B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7F9A8436B
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 08:41:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6C2EF5FFA2;
 Sat, 15 Apr 2023 10:40:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 10:40:56 +0200
Date: Sat, 15 Apr 2023 10:40:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20230415084056.GD2819@scaer>
References: <20230405201403.1410075-1-pevik@seznam.cz>
 <20230410172429.GE2819@scaer>
 <CAB1t1Cyz6=SM2MWOeqMtj9U8KKsarvFEcJaPeJ_nDXtaQ_bK1w@mail.gmail.com>
 <20230414190117.GY2819@scaer>
 <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
 <20230415080547.GC2819@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415080547.GC2819@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681548061;
 bh=p0EQ3SvKQ/RY1DnSrY+FwcESJS6D20I9bLN99SAkv0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxB/SBQX95RsqfejcovUy7jOfoq0tg8Pz7RW63C8NApT3E3Hy7WodnYZWYAzYyMoP
 OiLZcRcR78e+w0R6rtNzgHjFFeJRTJY5RPCf+O9vDm5j4ChUKcz1hc1lUZXDkNPbX0
 5TZphqE5RUpQtdo0nc1iKyHIddApl0vWhnmjZkok/zHUGwvphdDUaO3jApLp3YkfJY
 QKllv6gi+3MlkoyMYOGHfARJ4Crgrbd9+VltslXP45vKGRRLCNABPavm9woo2jQRxR
 X3EqDJYggv8BQHfErdF25yrEojAV0842G0GPUOD3ToTFr2Ue84FyJeDbtzsjE+Dx5V
 5+MMG+0BBY8ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YxB/SBQX
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump version to
 20230127
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Petr Vorel <pevik@seznam.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2023-04-15 10:05 +0200, Yann E. MORIN spake thusly:
> On 2023-04-14 22:54 +0200, Petr Vorel spake thusly:
> > On Fri, 14 Apr 2023 at 21:01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > Unless the upstream ltp has provision for supporting both kind of
> > > headers, with or without the fix, then yes, I think this should be
> > > rebased and kept. And re-submit upstream to explain it will support
> > > older, existing toolchains.
> > I'll verify again support/config-fragments/autobuild/toolchain-configs.csv, if
> > there are tests which will fail.  Or are these toolchains elsewhere? I'm asking
> > to give some proof to upstream that there are toolchains with older kernel
> > headers. Because upstream expects that old distros are being tested with old
> > version and if people want new software they are able to update their
> > toolchain. They will see a real example than just claiming "it's needed".
> > Also have a way to check in the future that workaround can be removed.
> 
> I looked at toolchain/toolchain-external/toolchain-external-arm-aarch64/
> which is the first external toolchain in the list of toolchain Buildroot
> knows of.

So, that's a glibc toolchain, right, so it is not impacted by the bug.

Still, the reasonging stands: in the wilde, there are toolchains that
have been built before that fix existed, and people are not updating
their toolchains for various reasons, the most prominent one being "it
is suplied by the chipco, so we use it".

It is not just about the toolchains we know of in Buildroot. by the way.

Now, we could also very well decide that ltp-testsuite depends on kernel
headers >= 5.11 for musl toolchains, which would probably be the actual
solution, if upstream really does not want to fix that situation.

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
