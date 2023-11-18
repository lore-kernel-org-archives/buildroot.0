Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD02C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EA782155;
	Sat, 18 Nov 2023 16:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EA782155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwOQGY45Z9na; Sat, 18 Nov 2023 16:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E83F68213F;
	Sat, 18 Nov 2023 16:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E83F68213F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006401BF2F4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 16:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9EE281298
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 16:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9EE281298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0D7uC7GgrPl for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 16:20:47 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D0F080EC9
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 16:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0F080EC9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 89D967802D6;
 Sat, 18 Nov 2023 17:20:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 17:20:41 +0100
Date: Sat, 18 Nov 2023 17:20:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: hanyuan-z <hanyuan-z@qq.com>
Message-ID: <20231118162041.GH996011@scaer>
References: <tencent_D6A6E9BF418910070340A731CA97A2A5C606@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_D6A6E9BF418910070340A731CA97A2A5C606@qq.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700324444;
 bh=ZkLZouT1aPYL8C0ylC7apDkgv/JKN+LAKk++V8BRnn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKxak1t58pDlKcI3JWOwBYBC9powRmhxJZEy4lXPQd3gHFEcBUKJBUf3I3McQoXbP
 n8T3DrMywIzZ08xcejsZP9VKIyIGpqzm0tm4XIcNLFY3YRJipyLdQjlI1gA/lTv6E+
 jgve7Amu5aFsC07ShazCmafG6kq8tZlEXOdYuK6/EVCuxTe0z6jUWnrAKnZNOfCjUO
 gnLw359T652Pe3kxipc2IeYoMLchMgfF8YRowItC6ynyZdBEGVA9TRmvcW7dpZO/f5
 gIjf426WVWUjxSri08YBqDV+Qr7HSaVNZUaH3kGfMxKj8zZQSKhq6KOQPviUBbGoLR
 qPG4CbFyZoKgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iKxak1t5
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO
 library wiringX
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
Cc: "s.martin49" <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hanyuan, All,

On 2023-11-18 23:31 +0800, hanyuan-z spake thusly:
> I apologize for my misunderstanding of the RESEND word. But I
> This email and the accompanying patch had been sent for more than one month,

Yes, I understand it can be a bit distressing, but as I pointed out, we
have almost 200 patches pending from review:
    https://patchwork.ozlabs.org/project/buildroot/list/

Everything that is listed on there is not forgotten; we'll eventually
get to it.

> however, unfortunately, I still get no reply, even if I
> write an email again to Samuel. I am not clear what happened. Maybe my
> email is blocked by gmail by default? So I tried to email to
> you.

Yes, Samuel has not been contributing to the Buildroot project for quite
a while now, and he's been unresponsive shortly afterwads (but was OK
last I managed to talk to him).

> Once again, I am sincerely sorry for any inconvenience caused by my
> repeated attempts to contact you. I appreciate your
> understanding and assistance in this matter.

There is not much that you can do except just keep waiting a little
bit...

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
