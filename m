Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16480C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A41C4400F5;
	Mon,  1 Jul 2024 21:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFPBdGk9HBiq; Mon,  1 Jul 2024 21:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E174012E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E174012E;
	Mon,  1 Jul 2024 21:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96BC1BF329
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965EC400F5
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xIxjshD0v1Y for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 21:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60BF240024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BF240024
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60BF240024
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 21:07:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7004113F846;
 Mon,  1 Jul 2024 23:06:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jul 2024 23:06:54 +0200
Date: Mon, 1 Jul 2024 23:06:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Kennedy, Andy A Collins" <Andy.A.Kennedy@collins.com>
Message-ID: <ZoMabkU62M2XlPZv@landeda>
References: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
 <708a7766-b35c-4b94-ab28-21e53020f1f6@mind.be>
 <SA1P110MB1069DE425FCD67C56045A0EEC8D3A@SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA1P110MB1069DE425FCD67C56045A0EEC8D3A@SA1P110MB1069.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719868017;
 bh=KBuJp/jBxaumEbRg6biXcAwmJPEaesGIYY9mGQjKENI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdUCK01Yxo7kd0wD0wgPnq72iqYo2/Cle35Uv5qV80vkWpuZf/IKCR3StsdRgUM1n
 a8hd4OxsWNYezpZIHLdlwXM98kakSnmWm/tIUb0OATilv/voXfFtOc+4QrBhPA0UCf
 FVT/HdLgD3mNnC6iNHBDbYnmnhlKrWJBwOa1q2fS7pElpe0aIQUJW1nBqyq5QFYOWA
 cb5D6HpPrgjWovdc+GcA+u8xcloONvl+YIlTV7LRZ4figDA1qsNjExhcZptvYjD+Ds
 T6idXrhUPaT2JcOQKDJNPE1r9fRntKDvVNPEuxDu8/acy1SLdaPe+vzhpINhEbTmBf
 OHq7fyRxpM7/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KdUCK01Y
Subject: Re: [Buildroot] [External] Re:  host gcc?
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

Andy, All,

On 2024-07-01 20:07 +0000, Kennedy, Andy A Collins via buildroot spake thusly:
> On 30/06/2024 09:25, Vandercappelle, Arnout via buildroot wrote:
[--SNIP--]
> >   The relatively easy path is to build GCC 9 outside of buildroot, and specify
> > it by passing HOSTCC and HOSTCXX in the environment. Or making sure that
> > GCC 9's
> > installation dir is earlier in PATH.
> I have to do this inside BuildRoot as I'm not root.

You don't need to be root; just install it anywhere you have access to,
line ${HOME}/gcc-9/  and export that in the PATH.

Alternatively, build in a container runing a distribution with a more
recent compiler suite.

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
