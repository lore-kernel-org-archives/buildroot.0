Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C171EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCFA409A0;
	Sun, 20 Aug 2023 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCFA409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVleeG6qhWgm; Sun, 20 Aug 2023 21:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2FC40959;
	Sun, 20 Aug 2023 21:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2FC40959
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDF3C1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B442F817AE
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B442F817AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwQ5cVk8J7jZ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:29:41 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC5608179A
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC5608179A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:583d:50bb:f558:e336])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 090CF19F5A3;
 Sun, 20 Aug 2023 23:29:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 23:29:35 +0200
Date: Sun, 20 Aug 2023 23:29:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230820212935.GU1778688@scaer>
References: <20230820190438.101920-1-kilian.zinnecker@mail.de>
 <20230820190438.101920-2-kilian.zinnecker@mail.de>
 <20230820192912.GR1778688@scaer> <3517885.iIbC2pHGDl@kilian-aisec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3517885.iIbC2pHGDl@kilian-aisec>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692566978;
 bh=oi0HOOkMROyD4kKrx//SbQxlG2tKCIkuk81MN/8qqt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8K48asqqSgFWjXEOajLSZAbuG7Y9/ibN1vqtI+2jILzg8nCJPF9OPBJY93INNxYq
 JE6zxPv1TzCypftsrNTFsIC+4fWI8cskhLx/Jg9CbCL2PIuEhSSzZOmQOiinT45SSw
 IvxUdsyTzbn9UxUZwGuH34q9Och+HYOb2aabcIOBbfBn6VjQlPFY1CFVmbRusTnZrl
 GZsScdP0aGsklhOIaGhkRCN8PvUj3sFTDlOtN79/YIGCb32ThmPs2B/+Fn9UiwUUu5
 dwjQbjh4bFZSaNekwIxrborjDvdPY/UBwYxLGDZjO/jVPn6nI8MWXj4P0bQa8ekW0D
 dAKCyUouWEcTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o8K48asq
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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

Kilian, All,

On 2023-08-20 23:09 +0200, Kilian Zinnecker via buildroot spake thusly:
> > Applied to master, thanks.
> Ahh, I actually broke it - I am sorry! The current master now again does not 
> build for the Rock 5B (for everything else it should still be fine). I guess 
> the two backported patches from mainline linux should be put into a subfolder 
> board/.../patches/linux and not into board/.../patches. I will test again and 
> then send another patch to fix that then. I will take better care in the 
> future.

Ah, IO missed that, because in the previous iteration they were in the
correct location...

I'll push a fixup patch shortly...

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
