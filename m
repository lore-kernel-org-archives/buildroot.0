Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B567C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3EA41770;
	Sun, 25 Sep 2022 12:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3EA41770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcVba3LeOGFF; Sun, 25 Sep 2022 12:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 174644174C;
	Sun, 25 Sep 2022 12:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174644174C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6291BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 199CD4048A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199CD4048A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srvs0IGTAPGe for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3AAF4038E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3AAF4038E
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:35:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 120C013F85F;
 Sun, 25 Sep 2022 14:35:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 14:35:00 +0200
Date: Sun, 25 Sep 2022 14:35:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220925123500.GX1419013@scaer>
References: <20220925095024.306230-1-fontaine.fabrice@gmail.com>
 <20220925121755.GW1419013@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925121755.GW1419013@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664109304;
 bh=3PPQm4bitPGFhySAK+masSH/jLXyfW+1OY0ECb8dql8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ra+Bbosc4bessvXBzuWT09ba+x7Dgu0oAy9CDN07Jxf850q5AqBK3WLQkJbUmj6b3
 L0Ll1eWi1WXvaoBMZqWNCyRDep+ITEbi0tc55w6jdlqnX4EhvsI/L5AfWKcUaQoSq9
 X6HzWG0lJPz6uCBx615YrT6hzRANvNbLqLs4i27aSBqMbp9jS15DlOJdUr27ksbTMi
 qplRITZZKvNQwT1clkt23DxsW0kkafca4nDjtlp3RoBrQaOAFGve75odsVte0bPgLK
 w3dVk34LGRcCa7wtr6usbcBaWVoxAEeLlUx0eIAW7H/+Sv+a5cCI9J9ezh7+Pxd7W2
 Ddvad09Ww6pkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ra+Bbosc
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: fix sparc build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-25 14:17 +0200, Yann E. MORIN spake thusly:
> On 2022-09-25 11:50 +0200, Fabrice Fontaine spake thusly:
> > Fix the following sparc build failure raised since bump to version 0.24
> > in commit 9b5caa2ab45d7ec01e1657b10f94c2f60c7afe8e and
> > https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
[--SNIP--]
> > ++#ifndef B4000000
> > ++#define B4000000 4000000
> > ++#endif
> The problem I can see with this, is that the kernel explicitly does not
> define them for sparc:
>     https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cb

Sorry, bad copy-paste; here's the proper URL:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/sparc/include/uapi/asm/termbits.h#n157

>     These have totally bogus values and nobody uses them
>     so far. Later on we'd have to use say 0x10000x and
>     adjust CBAUD constant and drivers accordingly
> 
> So, I believe the proper solution would be that the case clauses be
> guarded by a condition that the corresponding value is defined:
> 
>     #ifdef B2500000  /* Not available on all archictectures, i.e. sparc */
>         CASE_BPS(2500000, &tty_attrs);
>     #endif
> 
> and so on...
> 
> Regards,
> Yann E. MORIN.
> 
> > + struct serial_pdata {
> > + 	struct iio_context *ctx;
> > + 	bool debug;
> > +-- 
> > +2.35.1
> > +
> > -- 
> > 2.35.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
