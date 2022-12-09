Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD12C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 048D841BF2;
	Fri,  9 Dec 2022 17:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048D841BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nneKyO1OnvVn; Fri,  9 Dec 2022 17:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AE841B9C;
	Fri,  9 Dec 2022 17:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AE841B9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4761BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1141040002
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1141040002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Au5TloLw0WNy for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF194103C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF194103C
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.98.184])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 51945B0059F;
 Fri,  9 Dec 2022 18:00:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Dec 2022 18:00:58 +0100
Date: Fri, 9 Dec 2022 18:00:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221209170058.GL2855@scaer>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670605261;
 bh=tJ1gJaA02p2iovOYGKNIsEb8oS9SmFnId/syD1nsc7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJvcUwuo8M0a3U7R0/kmyJ9Rha5843/xllEAxMTnoZ0G07vJTzRzauZCPRLK6FJjf
 NKUBFuVfFCpzd57gl/QVoVgblNALUyBgsAOzH8wCTxU9Dz2yLqpGfEsQLjd6IHOD2I
 G0QqLBFXPMWqQYDeowE7yFAqXt8RNJrQMrT4zGu5VLqncn/fMhJ6Y6P7iStvQ2T9Ps
 UHmPLw6XiQIlwoQ0GNVefS0gDdIeIpaseCDfvPF9ScSKbAlRxxS0TU5LXJdnngCmRP
 VHSitLdpE8BVVIZTumPbav/kqmgYKqGLWSWx36UJ+mWfqaOdtyobqFNpZiFw04MvrG
 CQHCoA4OQoiDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fJvcUwuo
Subject: Re: [Buildroot] [PATCH 00/70] package/x11r7: various version bumps
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

On 2022-12-08 23:37 +0100, Bernd Kuhls spake thusly:
> this series bumps various X11 packages and, when needed, switches the
> tarball to xz format and updates _SITE to https.
> Also two broken X11 drivers for ancient hardware are removed.

Series applied to master, thanks.

I'll further reply to two patches, for which I had to fix some stuff...

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
