Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ECBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3FDA60E9D;
	Sun, 12 Dec 2021 15:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5IzaQDLHz4y; Sun, 12 Dec 2021 15:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4660C61CC9;
	Sun, 12 Dec 2021 15:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAFE01BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B85144299D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmm8GnKrqFFk for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF72A4298D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:57:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 48E412003A4;
 Sun, 12 Dec 2021 16:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324621;
 bh=zLF5cz9J9/mdMzbApKGxDBBy+KOvv7tZ1d6QFtXV96g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPmpQiBpypGuc7+VbSPweQnxcpCz+TGFu6tsRqVFY/XLHa8fy8be4CrTW4fPpA8YV
 b88mXyvQMK5hKlH7d65Mk1G7iOLSyicoaGf2fxR0JSI769LuQl+rjWDB80GZhxC563
 TB+a/pbTnnK/clFCcrWSLyON8WjhDrxrBU/73Q5j8LAnptxFGnKv/dkV5fqp4lo5zZ
 SGjKKsfLoKwt4cBCHABGsbyEQbaQDuVLhcH5jVb0woC1SEfFUfZkYNFwwRbrzuTm1t
 bIGDpXRCz/hs4qCVTKGihrzPvVtWnBrPIDdkeaLeYRPbaVppAXT8uKWOjSq9mguMh5
 nd77VhEsGNhPw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 16:56:54 +0100
Date: Sun, 12 Dec 2021 16:56:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212155654.GV2603@scaer>
References: <20211211223518.2634490-1-bernd.kuhls@t-online.de>
 <013b7045-1592-2e75-2608-eeb2aa08fb15@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <013b7045-1592-2e75-2608-eeb2aa08fb15@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/tvheadend: bump version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-12-12 16:11 +0100, Arnout Vandecappelle spake thusly:
> On 11/12/2021 23:35, Bernd Kuhls wrote:
> >Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
