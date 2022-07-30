Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2BBC19F2A
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 19:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E588A60E5D;
	Sat, 30 Jul 2022 19:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E588A60E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tr77dsZXt7Yb; Sat, 30 Jul 2022 19:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0CEE60E13;
	Sat, 30 Jul 2022 19:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0CEE60E13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDDD1BF35B
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F3E81249
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 19:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F3E81249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ultga3ORKFQk for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 19:43:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EDB80EE3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0EDB80EE3
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 19:43:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AFF556012F;
 Sat, 30 Jul 2022 21:43:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 21:43:31 +0200
Date: Sat, 30 Jul 2022 21:43:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Message-ID: <20220730194331.GA2515056@scaer>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659210217;
 bh=toIn4zr3jm7RnNJ2NaGZMLWlejRbbA7X80WUzGmSAtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sDDHet4tf8qprV5zMWTXUhEanX9MLSM6BKvDR8/V08A5UUcpCO9mgT+Sxz8kQFky+
 s/R9mGFR+LbYlFKoEZh2mhrRG7K5xCjZarXGNaTfpXoo4E064NMqSjQMV4BMI32tFM
 qp9ilALNy8YBRLEOhSQDzCNNey8S2CAslSvdHW/TO2xyn9pXjw/zsG+jSuNiAOKdRX
 q53A0aVJn9RPoJDVKKmGxElbM4CDf49IGB3zMJ+8HKY2r3pL18i9UjfBRy6wt4emE5
 Kssbui2t0bhpq5K+G9fTTFYtCgvVWT2v+R2pAL4xIgb6RaK60WL73k4ZHzhT2pUq1L
 0zQt+eZfJmR/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sDDHet4t
Subject: Re: [Buildroot] [PATCHv2 0/7] Basic support for 64-bit kernel and
 32-bit userland
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-15 21:02 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Even though there are already cases where a 64-bit kernel is combined with
> 32-bit userland, like MIPS64n32, that Buildroot can support out-of-the-box,
> there are other combinations that don't currently work.
> 
> At work, we have two such cases:
> - 64-bit x86_64 kernel with 32-bit i386 userspace
> - 64-bit aarch64 kernel with 32-bit arm userspace
> 
> This series adds basic support for these cases, with the limitation that the
> user still needs to know what they are doing.

We've discussed this series, and Arnout provided some feedback.

It is not entirely clear that this is something we want to carry,
especially, as Arnout suggest, as there are other ways to do so.

I agree with most of what Arnout said. If your tooling can't handle
building two defconfigs, then I would adapt the tooling (it's very easy
with e.g. gitlab-CI to have two jobs in sequence, where the first builds
the kernel + modules, puts that artefacts, retrieved from the second job
that builds userland + final image).

It also look a bit to fragile and complex (as someone put it: "spit and
ducktape").

So, we're going to decline the rest of this series, sorry.

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
