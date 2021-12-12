Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417BCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FD4429FB;
	Sun, 12 Dec 2021 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFaWgOIeETFp; Sun, 12 Dec 2021 15:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F11B429C5;
	Sun, 12 Dec 2021 15:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 066F71BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 034B88519A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U561pO9XzQiP for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:56:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3628685181
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:56:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 665F92003DE;
 Sun, 12 Dec 2021 16:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324573;
 bh=EsO1NO95HX6pZ5uhEDPkimW7ojeqtYkMnB75+pxOkR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NexvpUBgWfNn19uzw7/avAMZvPHK959neyob91Qi1k4WWsPCH2VkqGNAxf7eL8X7n
 2TpxEvNHdnoyCsLQ8KVlKw031hr7UnL46fsFdpKZhBpdoF6Nya9NU2LtVycsmC1I5V
 gjGgDphgEhhpgvBFOCqcc7SoCxHk8FgK+jFcbky6TtZ9YDKKwn9R9Vi2B3BzwW8J5y
 G9vkPEM0tcGTHjScowxpopAmoB9OWPOJab3fxE+I5/NAxwEQRWo3Bzw7IUQRgHQqRC
 bdXE85T2fQROyqAOAVvndLpLyCQTd9tFscnNWP52Ki+LzV9sc74au380mqCl8zMQfU
 FOW7pJiP81HNQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 16:56:04 +0100
Date: Sun, 12 Dec 2021 16:56:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212155604.GT2603@scaer>
References: <20211211213632.537666-1-fontaine.fabrice@gmail.com>
 <2d06257f-8acc-6876-e892-1626c29fa8a4@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d06257f-8acc-6876-e892-1626c29fa8a4@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump to version 0.103.4
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-12 16:11 +0100, Arnout Vandecappelle spake thusly:
> On 11/12/2021 22:36, Fabrice Fontaine wrote:
> >ClamAV 0.103.4 is a critical patch release:
> >https://blog.clamav.net/2021/11/clamav-01034-and-01041-patch-releases.html
> >
> >Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
