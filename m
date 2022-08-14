Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB613C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 858F460C03;
	Sun, 14 Aug 2022 15:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858F460C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qB35eRCnNfVV; Sun, 14 Aug 2022 15:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA92460BE2;
	Sun, 14 Aug 2022 15:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA92460BE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91C341BF41C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B49441678
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B49441678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AQvqzzDOba3 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:15:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4A0415C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C4A0415C0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:15:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DA0036012A;
 Sun, 14 Aug 2022 17:15:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 17:15:22 +0200
Date: Sun, 14 Aug 2022 17:15:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220814151522.GI2775145@scaer>
References: <20220813105152.1403602-1-thomas.petazzoni@bootlin.com>
 <20220813214316.GA2830119@scaer> <20220813234606.7f118c81@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813234606.7f118c81@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660490127;
 bh=n/3VIOuahFAmvAzof1rYTZv1pDukT9HkwVpn+0qiVlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pt5d8c5llEHdke0C4REPo04JkyLU2OE3GNQV1U7tMtlM2CidvtGnvZ34VSq/YSxhB
 obWKYvanvKUNzgRXzUo8FzkNyyif5D+4sjo04w3G8jWvW8i3nxMgSslZmyu2lSFDNf
 1DyNKLtcv82x/BnLtpmQPQHpFcHbj+yO0CRCusUk/HNFBJ23552tdkK/X2pTKFeaO6
 vIblGZuRwxWxvTRJ9KcLe66qEVtP/Tymh7CygSpHbXJwok6SZA61e/+aag/sTTU4QL
 VUVk124oXWWvy+KlK3Va2EmZEIfiCCFDFMX2nuEZeqZYoB3Jjc/nLRPJthAJSNQnUa
 ehCIbRedJ1qig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pt5d8c5l
Subject: Re: [Buildroot] [PATCH] package/binutils: handle gprofng as an
 optional feature
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-13 23:46 +0200, Thomas Petazzoni spake thusly:
> On Sat, 13 Aug 2022 23:43:16 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >     $ make check-package
> >     package/binutils/binutils.mk:97: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*
> >     package/binutils/binutils.mk:99: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*
> Meh, weird, I definitely tested it: I got a build failure before, and
> not after. Strange. Anyway, thanks for fixing and applying!

Gah, I totally forgot to amend the commit before pushing. Grrr....

Fixed and pushed, now...

Damn, this heat-wave really had a toll on me... ;-]

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
