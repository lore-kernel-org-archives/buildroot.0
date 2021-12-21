Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04A1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 21:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3730240605;
	Tue, 21 Dec 2021 21:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9RNC08rvZ30; Tue, 21 Dec 2021 21:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF3640399;
	Tue, 21 Dec 2021 21:19:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D29EC1BF40B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C909582E4C
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uu1rEZ1jYbTn for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 21:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAE0082E14
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 21:19:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9900:b0a2:6ae:59e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0957819F576;
 Tue, 21 Dec 2021 22:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640121567;
 bh=exbIZQk8ayfiRAABPa7lZeT5W/rGFnlrOIy+Ja1ySh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Twf8s9k7kTmsPY1o5uodjC9r4w/3zOh1Z/wyNJ+o0SB+rCOsMwpz9Q4h6RPhR/wzc
 iXpQtO7JmqHavYlMWwTWmk3eSqksPfYOR04sHi3JPJOw6SKXq0wF1i20/kXt4WlGAN
 xSZSywZJzyttSowiJaw8G7kNGzTGEQY4bSmPy2RI6qwb89KNyCgpBbvnfIDGQIL8Ro
 OJbw/rff/8zy8VtY5MTIyzp0KIqgd5Z0mdK5Y6Dw0x7Ac7Dgfau15kE+6wK9u4CNdd
 ExX9xwMQ6t8liO5wqxtCkypCMi4avRa55T+1335Hax5s5MDzziOzqqRcbphfUWfjZ2
 vdLxZhfcsfT9g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Dec 2021 22:19:14 +0100
Date: Tue, 21 Dec 2021 22:19:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211221211914.GK2603@scaer>
References: <20211219110405.2233620-1-yann.morin.1998@free.fr>
 <e3d18846-7065-2665-984f-03685b0b3ab0@mind.be>
 <20211220220807.GJ2603@scaer>
 <62ca9c6d-42c5-d5b4-c423-6d050fdf6ae1@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62ca9c6d-42c5-d5b4-c423-6d050fdf6ae1@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libopenaptx: drop package
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
Cc: Yunhao Tian <t123yh.xyz@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-12-20 23:30 +0100, Arnout Vandecappelle spake thusly:
> On 20/12/2021 23:08, Yann E. MORIN wrote:
[--SNIP--]
> >However, the LGPLv2.1+ does not allow one to *strip* the code of its
> >license and *replace* it with another license, even if the LGPLV2.1+ can
> >be "upgraded" to that other license.
> 
>  Yes it does. As I wrote, section 3:
[--SNIP--]
> I.e. anyone (not the copyright holders, but anyone) can apply GPL-2.0+ to
> the code instead of LGPL-2.1+ and continue distributing it under GPL-2.0+.
> Note the irreversible as well.

Indeed. This is something that completely eluded me. Thanks for poking
it at my nose! :-)

[--SNIP--]
>  Bottom line: *we're* definitely doing nothing wrong by keeping the package,
> and I don't think we're creating problems for our users either. We're
> creating more problems by removing the package, IMHO.

OK-ish.

Though, if we were to roll back to 0.2.0, or switch to the 0.2.0-forked
libfreeaptx, we would not have any issue.

Thanks for bearing with me.

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
