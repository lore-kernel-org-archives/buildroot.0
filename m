Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30CAC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6929261142;
	Sun, 24 Jul 2022 10:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6929261142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv5pVMoMrPp4; Sun, 24 Jul 2022 10:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10EF61004;
	Sun, 24 Jul 2022 10:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B10EF61004
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CCC71BF85D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D92DB42499
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92DB42499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIpaGJuSNeT1 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6879942462
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6879942462
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:16:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 000C213FA39;
 Sun, 24 Jul 2022 12:15:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 12:15:46 +0200
Date: Sun, 24 Jul 2022 12:15:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20220724101546.GQ2641@scaer>
References: <cover.1658007000.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1658007000.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658657773;
 bh=VodbfPTGg056pP30fQu3j0HJ+Xm8daQQ8jrMcz25uPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BLRdLGvslazo7qXB+OkCCJKj1v2K3WoHtytsZNVrzYwKjb2lv3+By9v+xz5brs3CE
 +2YH+N62Sjkmmv8pVYdgJAtpQrQFyrB4CdS+y+epZiiTc+TLyIwyYx0q5roaD4M9QS
 AVq4rk1H+rHibP6aZBlOXdsM+aJXqBnxZWjaqun/0zZYX8vEpflGuMKL3o3xE4maSC
 F8/48AiCkVCA/i44CvLgSjaiih+qdVBKw/DOyMgVSMRLOdcxxZw76P67XoV1dvubs0
 7y50pa6xlH1rXCY7w6bAPNRAUwCslpHhda8+Iq4ePIirPgE5GWomFQSpHmzHiMvm1Y
 byJg1+8f6Mxww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BLRdLGvs
Subject: Re: [Buildroot] [PATCH 0/2] pacakge: drop remnants of
 $(HOST_DIR)/usr (branch yem/no-host-dir-usr)
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, Antoine Tenart <atenart@kernel.org>,
 =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Vadim Kochan <vadim4j@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-07-16 23:30 +0200, Yann E. MORIN spake thusly:
> Back in 2017.08, we dropped the use of $(HOST_DIR)/usr as a prefix, and
> just installed with $(HOST_DIR) as a prefix. At least, the migration
> information was added as c8f51a00d8ec for 2017.08.
> 5 years ago.
> And we still had a few packages that installed stuff in there, or used
> stuff from there.
> Fix those.
> In the process of testing the change, we noticed that the conditions for
> the rustc tier-1 and tier-2 platforms were incorrect, so we fixed them
> too.

Series applied to master, after fixing issues pointed out by Baruch and
Romain.

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
