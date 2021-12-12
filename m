Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A15BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E553C60E92;
	Sun, 12 Dec 2021 15:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFTsCB4AU3kB; Sun, 12 Dec 2021 15:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527E060E8B;
	Sun, 12 Dec 2021 15:56:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A881C1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9790C859F3
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-gRAmTgF_LQ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:56:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B908D859F2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:56:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 317472003CA;
 Sun, 12 Dec 2021 16:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324601;
 bh=fLz97dDJ3QIj1gCw72jQYiFLmYxFoc2haD8xnj7tjrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MR34OfffYN2IH4XeuC+4azqKyy3spp1YADvyeP3f3jHUyFbWklFKJ+f+YV8JQqMYk
 gX98SXk4PNMYXchWhBognDTMjiYXEgoJpESi2PbhgJhvbpwFFtJqSo7ZJAIxd0+S4N
 wwPG2q9ii4Yw646/3+XLOVNgGMg5v9Y0lBCjKEOxr5Pv8MH7jrmiO3VUysXAU6HTmB
 GyrYFJy8pah5eHI2ttA1JPXT25gUz76qFlGDAaQjUWKLQAPBOTrHYOpI8m5vCN4wAm
 VtfvDS55nPThnZrOYKOdFupt/HiaHzTEYg6CaHOO2YGBbpCbwjdHcPPw1K1uem2qbZ
 eqDZbIxmzIBGw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 16:56:34 +0100
Date: Sun, 12 Dec 2021 16:56:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212155634.GU2603@scaer>
References: <20211211213904.562446-1-fontaine.fabrice@gmail.com>
 <54843277-cacb-beda-f25a-02a8510f9a11@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54843277-cacb-beda-f25a-02a8510f9a11@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-12 16:11 +0100, Arnout Vandecappelle spake thusly:
> On 11/12/2021 22:39, Fabrice Fontaine wrote:
> >Drop patch (already in version)
> >
> >https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.1
> >
> >Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
>  Applied to master, thanks.

Arnout and I stepped on each other's toe when applying, and Arnout ran
away before he got the opportunity to push the patches he applied. So I
did.

Applied to master, thanks.

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
