Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79700CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 08:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1FF82179;
	Sat, 23 Sep 2023 08:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C1FF82179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49fjuFZbUxwu; Sat, 23 Sep 2023 08:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DF282176;
	Sat, 23 Sep 2023 08:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DF282176
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0451BF2CA
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 866E882176
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866E882176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZgSSqJAxHe7 for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 08:47:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88CAF82175
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 08:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CAF82175
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BEED513F8B5;
 Sat, 23 Sep 2023 10:47:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Sep 2023 10:47:26 +0200
Date: Sat, 23 Sep 2023 10:47:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230923084726.GB1469982@scaer>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
 <20230923083500.GA1469982@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923083500.GA1469982@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695458854;
 bh=wFvpkPqnQX+S4MOLC2KiTJNW9deTFFXYIhk0fxCDPmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cYI3J5P6WIMcgRJrKiXlFLmzQqdrVnk+coFHDU9EhzblQthIpBbC/JF+5F5lIxDJS
 HXOUvvJzBV1cPH8pIbRTGrWszLKwO2Urim4Tc7lqjqiU4d8O6+W2mRP8GvQyngaTdC
 SV1CmtjvEI03IkjBCTedE54YSEx8/+0QhA6E+UZ0al+/BPn0z6jhsQiC0/Oi8cSImC
 7ULlsj2nKeLfRUa34uWHduv5z3NJVGbfi8mLGE6Kivza9uS6jNzm5QGtvNEKg61Yt4
 orgyPAYdWaFMbW+4t9hh1VyDqT2su87kiaamm7095cwktQQbcs80NjNt+pUMd3I5rg
 u6QZSe0nov/kA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cYI3J5P6
Subject: Re: [Buildroot] [PATCH v9 7/7]
 support/testing/tests/package/test_flutter.py: new runtime test
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-09-23 10:35 +0200, Yann E. MORIN spake thusly:
> On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
> > This is a simple test that builds and runs the futter-gallery application and
> > checks if the service is active.
> This runtime test does not demonstrate a worlking flutter stack, because
> the application in fact does not work:
[--SNIP--]
> Can you look at that test, please?

As discussed on IRC, I did quite a few substantial changes in the other
patches of the series, so I've pushed them to a branch so you can grab
them and rebase on those:

    https://gitlab.com/ymorin/buildroot/-/commits/yem/flutter/

Please grab those. Once the runtime test works, I can apply the whole
series.

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
