Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDEAC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 21:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3696118B;
	Thu,  4 Aug 2022 21:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3696118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fv5HN1rIE9fN; Thu,  4 Aug 2022 21:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6419C60E8A;
	Thu,  4 Aug 2022 21:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6419C60E8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 083351BF842
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEBB160E8A
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 21:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEBB160E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jilWS_aphKb for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 21:16:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711AE60B78
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 711AE60B78
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 21:16:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f073:cdc7:ea6e:59e9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3480519F4F8;
 Thu,  4 Aug 2022 23:16:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Aug 2022 23:16:28 +0200
Date: Thu, 4 Aug 2022 23:16:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220804211628.GA3501245@scaer>
References: <20220803165240.BEDEB86D85@busybox.osuosl.org>
 <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659647791;
 bh=91+qO3/9kaX3sFRDL1Cxu1Ob3JzQHj3NptauZSCqpKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QAqF2IPYIH+cJQm5eVe0m5aOh2yWXMplbI+TvASIsd+jZjBuCGPavgmIrn7iWCUK1
 3wV7wOL1G68elnI9WtU6pBaxXBZ78xjwy6oHNCKP9RSx/pdoab/uPv+Up8fDdlpo+9
 383dfVK9r1JHXcjEypaVR+1JSFUsHQ0mu2sVwLsSF/Khx7aXNiARuNA3fSc+kAmOot
 IznLHHvMbvj+pmFFEQbg5Rf210ATSC2vgNobLS3PwNoU17JGGM7g9uJxc6B6WMz7wc
 3J+BUt56yuVTj4SWCGgzH4SClWlCXKbMRbFZ9O4BTCP128pt/DA2nRDX4i0XqGOJbE
 5Acvw+7fOzE5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QAqF2IPY
Subject: Re: [Buildroot] [git commit] Makefile: error out printvars target
 when VARS is empty or unset
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DAvid, All,

On 2022-08-04 08:00 +0000, David Laight spake thusly:
> From: Yann E.MORIN
> > An error message making explicit what is required from the user in order
> > to use printvars is however better than silently doing nothing.
[--SNIP--]
> >  printvars:
> > +ifndef VARS
> > +	@echo "Please pass a non-empty VARS to 'make printvars'"
> Shouldn't that have a >&2 ??

As usgested by Arnout, I changed that to use $(error).

Thanks for the nudge!

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
