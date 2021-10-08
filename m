Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09429C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:40:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E37561177
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 20:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E37561177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E012D83E1B;
	Fri,  8 Oct 2021 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNQwcXSLXIRG; Fri,  8 Oct 2021 20:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40F7783DF9;
	Fri,  8 Oct 2021 20:40:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78CB41BF337
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 678CD40140
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeFhVsviqgxS for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 20:40:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD298400FC
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 20:40:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1566:cdd4:783e:b9fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 31DBE2003BE;
 Fri,  8 Oct 2021 22:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633725621;
 bh=Rro/IzHBxJ12VcTjceyJdicfEOru2/tYgnJnu6uPQJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAjsWq3VR5C/DMigZn6iPK0fk/ABZvntNr/jePjeP/yTVHyjX7VpdcCIrmuJe7Ad1
 /ykbRlNlxYYbgnGoJ7etnsrPQrAUnyLO13LaRsMmU3xmnB+z/8+9ewphDR2Mra3J5W
 WLRUoREIJDuj0eKOHVRuaTlS4bAC8ITvBZQ0p0BuoBSrbjcG1nRcl0bWkB9AeutFyc
 noWe+YYHGffVm6kdCK+V7LJFEYRnfagglCTKBBmUskqHDd8fQLD2SeSzjJrGdmkwRE
 q0vnpffwPC+jyPZE+KBySVPPJlsIWdDCdtz5AHwr9P9JrUhQOLau0K0PcKDbO7mGD+
 YD+mAzkm3p+ig==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Oct 2021 22:40:16 +0200
Date: Fri, 8 Oct 2021 22:40:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Loridon, Martin" <martin.loridon@barco.com>
Message-ID: <20211008204016.GI2081069@scaer>
References: <AM0PR09MB3907D9CFEE70F772597A1E7896B29@AM0PR09MB3907.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM0PR09MB3907D9CFEE70F772597A1E7896B29@AM0PR09MB3907.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/RFC 2/2] package/nodejs: bump version to
 14.17.6
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

Martin, All,

On 2021-10-08 13:54 +0000, Loridon, Martin via buildroot spake thusly:
> Just letting you know that this patch contains a wrong LICENSE hash.
> sha256 for the LICENSE file being part of that nodejs version is: 4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc

I can confirm that indeed I also got the same hash as you:
    4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc  LICENSE

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
