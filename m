Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EFAC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A58F407A7;
	Sun,  3 Mar 2024 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krqn7AvdcewG; Sun,  3 Mar 2024 10:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DBDD407B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DBDD407B6;
	Sun,  3 Mar 2024 10:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA891BF5AE
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39361407B6
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZ5OzTB9bd89 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 382CC407A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382CC407A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 382CC407A7
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:32:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CE33413F8D5;
 Sun,  3 Mar 2024 11:32:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 11:32:39 +0100
Date: Sun, 3 Mar 2024 11:32:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRRx1lGESCrwajh@landeda>
References: <20240303084122.157151-1-thomas.petazzoni@bootlin.com>
 <ZeRJFqxy-YtrzYBI@landeda> <20240303112514.3ee1d3e8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303112514.3ee1d3e8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709461962;
 bh=c0DgIyffFJQQVo0D//PdHUtN+g4VBJOCGS0V8q5ZAnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uu03Eq+H9P/H9K4ZoC4dGSshMNb6RNTgjDhI3JsK+8ZAv+IqM48zWx9E5zmO09jK5
 4U7txswD9g+MZPyM7w6DUS4TPuceER0bHaI3dwp4d6aJa07yM1U+e1Fbgt+iuw/u6A
 pAf+SrHrUkEqYqVsyri7lAoAaXWvlLdRT3c+OngJV3c2z4OFRadkJK0LLAg5ZS/iXG
 8ya0AJBwz5e0lLT9fj3bOXW7jxe/HIwKfqfJb6tNi1m2q7lgGM4INA2cr6TU+LWuOT
 dIErrLdDtdh9ij0GFm1IA//k1ixDSlS7bLWkJeUAY2sNJ28Pvuy7ZERpEGTD1Dsv9J
 Bc7ETfdA5/2Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uu03Eq+H
Subject: Re: [Buildroot] [PATCH next] package/musl: bump to version 1.2.5
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

Thomas, All,

On 2024-03-03 11:25 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Sun, 3 Mar 2024 10:55:34 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I did a simple arm build, it worked. Let's see what autobuilders will
> > have to say about this, now.
> > Applied to master, thanks.
> To master? This was intended for next.

Yes, yes, yes: Applied to next!

Sorry for the confusion...

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
