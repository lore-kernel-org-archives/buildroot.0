Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4711C28B28
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 22:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D24B405A5;
	Sun,  9 Mar 2025 22:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeZG746nwC1q; Sun,  9 Mar 2025 22:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDD94066B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDD94066B;
	Sun,  9 Mar 2025 22:14:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFABF1C1
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF24606A8
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qv7Nw86cxGEd for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 22:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 806DB6066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 806DB6066B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 806DB6066B
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:14:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4A75E19F5BA;
 Sun,  9 Mar 2025 23:14:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Mar 2025 23:14:41 +0100
Date: Sun, 9 Mar 2025 23:14:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <Z84S0bpr6mgpYFWL@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
 <Z8wjZJRIUpG0iiOx@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8wjZJRIUpG0iiOx@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741558485;
 bh=69EuC2DttMUw/+JarKTkFR0o0+8cuz8JuwfZ9x1CWJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJz49i65PWubvqUb/qWukPWpom/b/YSrMHbJpwcwMIeLl31Meq9oFGF5NXNBt5F7h
 7TPzuzZ1JwD9VSyLkRtsKG1PZak4XO4BXNlHvMDpxPv0fhBMwe+d6TuisBFFJhoy1T
 x4pX8LvDdjlm9py2VRbX8L5AKOX++SDnItdzONy/F57Q+MNIis4Zd6C6ZPBLJnqPsd
 q794tb3lQikGgR+tC0t9nRw4Wf5BjjJ4eWRKQujc+IKoqqF4x5VGKiuac7G9c/M0G6
 8gGFhh8itc31FY0UXJMFMfXbmBDc9/v41fJbkCiiXcuQ9b+9sqSXr9cCdj6fnxV+/S
 tHJVgEE6BzvBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XJz49i65
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

raphael, All,

On 2025-03-08 12:00 +0100, Yann E. MORIN spake thusly:
> On 2025-03-07 14:40 +0100, Raphael Pavlidis spake thusly:
> > On 3/1/25 16:05, Yann E. MORIN wrote:
[--SNIP--]
> > > +	select BR2_PACKAGE_IPTABLES  # runtime
> > I am sure that you do not need iptables if you are using nftables.
> I briefly tried with nftables, it did not work, so I did not investigate
> further; IIRC it was before I had to write containers.conf, so maybe we
> can specify the firewall driver there... Ah, yes, it seems we can do
> that:
>     firewall_driver=""
>     The firewall driver to be used by netavark. [...] supported drivers
>     are "iptables", "nftables" [...]

Doing so was not enough to use nftables. Even with every NFT modules
enabled in the kernel, netavark would still whine than nft would fail to
list rules, or apply them.

So, I eventually got to the bottom of the issue: netavark requires that
nftables be build with support for JSON output. Once this is done, then
it all magically works (magically, as with all the tears ands sweat and
swearwords as the trinkets and incatation needed for such a spell...)

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
