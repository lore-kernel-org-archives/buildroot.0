Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723A8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 12:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C28FD410C7;
	Sun,  2 Oct 2022 12:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C28FD410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRwKfhip1u-c; Sun,  2 Oct 2022 12:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A398E410C4;
	Sun,  2 Oct 2022 12:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A398E410C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72F4D1BF41F
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 12:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59A72410C0
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 12:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A72410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiJGytmK-X-5 for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 12:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07DE9410BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07DE9410BE
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 12:11:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18ed:6838:5d1b:de4b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECFB013F8CD;
 Sun,  2 Oct 2022 14:11:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Oct 2022 14:11:21 +0200
Date: Sun, 2 Oct 2022 14:11:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221002121121.GB2517@scaer>
References: <20221001213928.6B43A86743@busybox.osuosl.org>
 <20221002120618.70631fe4@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221002120618.70631fe4@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664712685;
 bh=i5hdQS2kzjz5KnVih6iMjnZVe6ZuzMBB/PKfsvW6NqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7ugI4rI2mQByXYQpPCu6nwYnYkOsfwhLHTascDSlcyXDQVwKCUoS+kz2U2ekkqEF
 G3R97Jl3M2L76iqm6/4CHomL2Grs4rwRxIyv1JKWgxWuipJmD39vzsdxN3Ha6WVsmY
 cQVD3QJZ7QtDyWrVPoMAafB2L3HS7/w+CTpmDME7xGk8mJ9pQjIczVWWSV8yQZvQaZ
 lUprcODpuMLzSRxdXcuS7Un1iQBwv1K70MrrGGZhsG5OAeoltIIiWt6/rZfZPRoabn
 F0OT0R9QJrhiS9JKsERC5QCyrIaNkOxpTi9ZjclnIiH3C8YjayIB+DDUJRiefjV02U
 Vl0tD2SBKQMPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e7ugI4rI
Subject: Re: [Buildroot] [git commit] package/volk: fix licensing information
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

Thomas, All,

On 2022-10-02 12:06 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Sat, 1 Oct 2022 23:35:46 +0200
> Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > +VOLK_LICENSE = GPL-3.0+ LGPL-3.0+
> License list should be comma-separated, not space-separated.

Woops, fixed.

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
