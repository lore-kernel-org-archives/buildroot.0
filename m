Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989A0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 14:28:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF75C61183
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 14:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF75C61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91492404ED;
	Thu, 11 Nov 2021 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKRKkpl_NEit; Thu, 11 Nov 2021 14:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BCF40439;
	Thu, 11 Nov 2021 14:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 641F61BF288
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 14:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 536AD600CB
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 14:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltaDHulv2FVc for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 14:28:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244E1606D9
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 14:28:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8F4AE19F595;
 Thu, 11 Nov 2021 15:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636640901;
 bh=yfQ0XQ+0nk3kK0ApxXruUWyTSsd0P/IT6Zwklky2tpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RK6Iy4v6GF3rTCsoZi54FHSwQSk6knbZ25XIXbmwcFSDXSa0bQgZOm5KcpoWJQaMx
 VWYlU26lBJpYdJ7j8rKT5aSKIBTi8Zzj6V+nBIbM+wsB44NCheL+Lh0t+JRmzY9N7B
 tpCA1PnxWCjrxMJtX8yKLY5WIktxNEhzh6plIGcj6JG2QnHwXgZtBg0AkeLghdhxG6
 db53qyGK0MGWe3VxAWDmVgzh00gedfXypADerKJ/ZKlFZCOvQiK1f0J7FlE1qgroeg
 7euGmZo9sae4Z/hkR6ykXiKCEhSgyD36la0/Xi9KkfYSZ4pC0bmkyXegrWgwQeO1BE
 JyJPcUtWXakFw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 15:28:12 +0100
Date: Thu, 11 Nov 2021 15:28:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20211111142812.GA2609@scaer>
References: <5cd31e7e638246aeb7321933b088a743@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cd31e7e638246aeb7321933b088a743@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Add 'IRIX mode' to top.
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
Cc: "'vda.linux@googlemail.com'" <vda.linux@googlemail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2021-11-11 12:28 +0000, David Laight spake thusly:
> Add 'IRIX mode' to top.

Thanks for your contribution.

So, this does not look like it is a patch that was aimed at Buildroot,
but maybe at busybox? You should respin there with the proper list
address:

    busybox@busybox.net

If you did intent to send it to Buildroot, then first, it is incorrectly
formatted, and second, in Buildroot we usually do not take a feature
patch, unless under very strict conditions (e.g. it is badly needed and
is an upstream backport).

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
