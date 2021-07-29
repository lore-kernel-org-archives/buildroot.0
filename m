Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19935C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:33:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88F36054E
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88F36054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703BD6FB51;
	Thu, 29 Jul 2021 20:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6tpoEwIE85A; Thu, 29 Jul 2021 20:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F1726FB52;
	Thu, 29 Jul 2021 20:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 533FC1C115D
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF1740695
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMF-XmiRNruj for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 20:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C280240685
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 20:33:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74eb:7ba7:9fce:257b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0C10019F576;
 Thu, 29 Jul 2021 22:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627590778;
 bh=okUovyvwKsZ7Us4DS8KWNf+Y/QHhu5bGwOE/sSUA5VA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OncU76SHgYTKorMEzzLqB01tUQ32AOGh5G5p+dYAI6CeeBhCIVHUIkMCL83qNIbqA
 0+zAYpUUxr6AaCsU5ub9oehJwxQyFblnnc3QjHxq2qadcJOk2yUNDYlHDPyHtD+9Nt
 lWT3kxZNaKj+gMHS8ngz/nF35zAKv7W5dluDET+7qpTUjO1UnFbMs1Hbb9N4WsIYL4
 0AuVzQ4uSOvv2zNxtNC4IUbK2xMuNWjGxWWdF9+B0G4rAv4YdndqQ+uLdZYsyUrt4E
 1LUaWBjhAHBR77LEgvFtyf5R5Wv0V1fZzgZnX/Xok8w0X6V5dElN7gqa9eEWnB8R7p
 VpiwENrKNhbJg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 29 Jul 2021 22:32:47 +0200
Date: Thu, 29 Jul 2021 22:32:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniil Stas <daniil.stas@posteo.net>
Message-ID: <20210729203247.GG3189549@scaer>
References: <20210725125746.1169974-1-daniil.stas@posteo.net>
 <20210726235821.58ea502b@windsurf>
 <20210729004347.15063008@ux550ve>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729004347.15063008@ux550ve>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Daniil, All,

On 2021-07-28 21:43 +0000, Daniil Stas spake thusly:
> On Mon, 26 Jul 2021 23:58:21 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > On Sun, 25 Jul 2021 12:57:46 +0000
> > Daniil Stas <daniil.stas@posteo.net> wrote:
> > > Change sources location from bintray to github since bintray doesn't
> > > work anymore.
> > Applied to master, thanks.
> I think the original htop-3.0.5.tar.gz was overwritten after Yann
> applied the first version of my patch. And looks like now it's removed
> from http://sources.buildroot.net/htop/.
> That means that htop package is broken for the released versions of
> buildroot...

Indeed, I can't see the archive there...

Peter, Thomas: did you happen to remove the tarball from s.b.o ?

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
