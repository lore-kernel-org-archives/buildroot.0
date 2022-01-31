Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A2740242;
	Mon, 31 Jan 2022 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUIhgSKnioqu; Mon, 31 Jan 2022 17:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8224027A;
	Mon, 31 Jan 2022 17:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5BAB1BF35C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B553781C93
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXJzVCuDXMR7 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 17:14:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7071F81AD7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 17:14:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b1b4:bb20:1902:cd8e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 00CBC2003C6;
 Mon, 31 Jan 2022 18:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643649239;
 bh=sRARqBp9nnxmkutaYAUBMA1zrAp5J1E0IYmImEPOKmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=erQqjiz0y+sgXnp8+0OCKHh51LbERpcd3povBCrmnrrT3w8eT+Jw6nIK3V5Wok91a
 ZbJhT1/0AhTETPZ+m3eEUO2k/keulFhU4DyuF1TYosw6KGL9AnkDbVBEhpDy6QE5l5
 m5a8lGBEjZAkMIMZxBjJjWhXWgYm0ORSjbLMTFsSZPKI/fdrliXc2xlgJJgrHWMu9l
 sNki1SID9GqZ8hzP0tCdqo11YbKNTOtJxDwyuWS/I0lT40f+fqUe95sYD1N+zyGG+x
 u/eNkklnMuG7o1c5Zwbrcjd+CJSFicEHS5vU4LD2YM3QTMDmPqvnj2H0PRJB9lY3Qr
 jMfJ63LmIcjbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Jan 2022 18:13:55 +0100
Date: Mon, 31 Jan 2022 18:13:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220131171355.GU457876@scaer>
References: <cover.1643577025.git.yann.morin.1998@free.fr>
 <cb658b0784b6174058f01eb1db7ffb44885952f1.1643577025.git.yann.morin.1998@free.fr>
 <45a93a2b-2172-2cd2-8ccb-77f251e55dbc@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45a93a2b-2172-2cd2-8ccb-77f251e55dbc@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: fix build with host-gcc 10+
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-01-31 08:42 +0100, Arnout Vandecappelle spake thusly:
> On 30/01/2022 22:10, Yann E. MORIN wrote:
[--SNIP--]
> >Upstream just dropped that line altogether:
> >     https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73
> >So, we use a little sed-grep combo to do the exact same change.
[--SNIP--]
> >+# Older versions break on gcc 10+ because of redefined symbols
> >+define UBOOT_DROP_YYLLOC
> >+	$(SED) '/^YYLTYPE yylloc;$$/d' `grep -l -r -E '^YYLTYPE yylloc;$$' $(@D)`
> 
>  Why not use
> 	grep ... | xargs --no-run-if-empty $(SED) ...
> 
> which also avoids the "no input files" problem.

Yes, this is the obviously correct solution; I just did not have time to
handle it this morning... ;-)

>  Also:
> - Isn't it enough to search in $(@D)/scripts?

I was also a bit conflicted on that one. It should even be enough to
look up scripts/dtc/ (kconfig was never impacted).

> - I guess we should use -Z to make is 0-separated. I'm not a 100% sure, but
> I vaguely remember encountering a U-Boot or Linux vendor fork which had file
> names with spaces in them.

Whether that exists or not, I am now trying to always use -Z et al. when
dealing with lists of files in shell.

Thanks for the input; v2 incoming shortly...

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
