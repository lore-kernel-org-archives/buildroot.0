Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798CDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2026E82A4E;
	Fri,  7 Jan 2022 21:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3C7S7JTmp07t; Fri,  7 Jan 2022 21:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E76981C0A;
	Fri,  7 Jan 2022 21:31:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 667911BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6190E81C0A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKQ_qkNXyUks for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 520F180BE3
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 21:31:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b97a:249a:cc8b:fe2e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9CEAD5FF93;
 Fri,  7 Jan 2022 22:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641591076;
 bh=a4sTMkq5uYNlIoT2kDLvm08zmABTOyW7ymLCnKdve+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WD06w+ksUdd3jHqlPspAJt1OlMFiBT9Kubvqc4OQvYR+Gx4VlOyioT295F7xqrv10
 YPpyzm4rMfpYhbTeL3pmeEhjho5CPJW7zR56pNSD9j6ilAy+EHaNzivaWlDedCg35H
 ORD9nZNrx3J+diK6n17ilmDeH52TSmbParZrARdNC7YbuKzXeUw89fXZW9TYXnOSV8
 fzBSxeLPhsn6wYqhFniGlWlEVv3fctcIFgbcjiFgmIfAQ4VEuyB8W/+mHELzYiZ1aj
 KpCFlwuANKOgxIx/J1oME5aLo/Qi78ayrOIwxbgDpkaIpUJd6yKXuIYZpNTfuPPx/+
 FlygCG4ArBBTA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jan 2022 22:31:10 +0100
Date: Fri, 7 Jan 2022 22:31:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Drake <michael.drake@codethink.co.uk>,
 Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20220107213110.GA1881783@scaer>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 00/30] Add Chromium Embedded Framework
 library
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, Thomas, All,

On 2019-12-05 17:14 +0000, Michael Drake spake thusly:
> This patch series adds the Chromium Embedded Framework library to
> Buildroot.

We've discussed this series with the other maintainers today, and all
we can say is that we are very sorry that we could not address it
earlier.

You are more than aware that this is a huge series, with a lot of
complicated packages. I did not have the guts to delve into it
initially, and as more time passed, I dreaded even more going back
and look at it. The other maintainers also felt similarly...

On the other hand, except for Romain who dared two comments, no one
else ever replied or even pushed forward on that series; no one ever
even sent a reply stating it was tested and worked for them..

It would have been nice to have chromium in the tree, I agree, but
this is so big a stack that it is very hard to grasp and understand
all that is going on in there...

As a consequence, we have marked this series as rejected in patchwork...

Thank you for contribution.

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
