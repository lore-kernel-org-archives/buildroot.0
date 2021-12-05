Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0E8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 08:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14DE0403B8;
	Sun,  5 Dec 2021 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB-t1uFG3y3M; Sun,  5 Dec 2021 08:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B374056A;
	Sun,  5 Dec 2021 08:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7ED31BF593
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A825882CFD
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1dT7fJ4oWZY for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 08:25:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FC3182CFA
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 08:25:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 63B4C5FFA9;
 Sun,  5 Dec 2021 09:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638692723;
 bh=ZLX76YVe7drnVWfdaJHi1+2LlSn634yAR1OsAcCCn0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBxoX+j7nH+3siYNME4UX9afq9giQ94roySjBhOFPHstxZ13NIJ+Pbg+t4cSJe8Jk
 O+v1Gk8K2OWRJQfM8lhEJxK8RUXWIWWKpXnUHO0ahcLO7SMyPcJlOUan1jPy0oL5I/
 cLc+JbRy6lqBJhsimL4OFJ/5aXbOLeFQgkaUcsbeXWueQHtOEXzukVxFeB6jnYzWUp
 l/JP283r6q3kRaDV3lDzyuP3PPFNOJmnDnzV3IiKav9DIXUkXdRhASWpkKvRMIoR5z
 /P8E3i/qyVj9p/JpeaaVUh8kXv3KAsiLvXXe7SqF9wIVTmDP2Tb5CKdxX2bXECf6Kq
 hY+OO19s/nLpA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Dec 2021 09:25:19 +0100
Date: Sun, 5 Dec 2021 09:25:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20211205082519.GJ472627@scaer>
References: <20211204112311.GG50662@scaer>
 <61ac6f898d44a_261771a149721@xultri.mail>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61ac6f898d44a_261771a149721@xultri.mail>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/atop: ignore already fixed
 CVE-2011-3618
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

Ricardo, All,

On 2021-12-05 04:51 -0300, Ricardo Martincoski spake thusly:
> On Sat, Dec 04, 2021 at 08:23 AM, Yann E. MORIN wrote:
> > Ricardo, All,
> > On 2021-11-14 20:25 -0300, Ricardo Martincoski spake thusly:
[--SNIP--]
> >> So ignore the wrong CVE report.
> > Instead, shouldn't the CVE be updated to state that it does not affect
> > version >= 2.3.0 ?
> Searching in the mailing list I found this URL
> https://www.elinux.org/Buildroot:Security_Vulnerability_Management
> 
> I just filled a form at https://cveform.mitre.org/

Hreat, thanks! :-)

> I guess this patch can be Rejected.

I've now done that. Thanks!

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
