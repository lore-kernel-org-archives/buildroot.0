Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA273C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 05:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 595C9409D5;
	Fri, 14 Jun 2024 05:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAi2mptcKyZI; Fri, 14 Jun 2024 05:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E04409D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E04409D8;
	Fri, 14 Jun 2024 05:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69FCF1BF337
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 05:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5841561078
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 05:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlaGdzqFSVZO for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 05:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD7A761074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7A761074
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD7A761074
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 05:44:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e3e1:fbb3:a41c:81cf])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CA21F2003AE;
 Fri, 14 Jun 2024 07:44:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Jun 2024 07:44:30 +0200
Date: Fri, 14 Jun 2024 07:44:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZmvYvp0LpjOofOR5@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-6-thomas.perale@mind.be>
 <ZltDc6AXn_CC83Gy@landeda>
 <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2r9ogzjdAjVon5UsU9TPp5wy+cYC+BUSGnRWF3bgnkMcg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718343875;
 bh=UHVcEcXYgYQopEJvkOJijn2T4L9tO9J7BEze99fUjcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C02QXihKTTl0s/YC6Z4zYp9jOafBbxsAQyleuJ+ArNqosuzMjT62Dodj1fs3bP9NX
 /nI8+ZDgnmi5YNOIsn1M5tONkqIbMhGk83cVfb0hY1MizJnZSI1p2NtBBUtf+x4EqA
 wjwc3UUfP+YYpMrNDHhLIcm95myjwakFkr9pv3z9x4X4lHeM+FW6KMmmkC/86PO+LT
 X9chIv9+lnwTKwHgYuXblUH2Pmshrw3jFwY4LEkL5VZxHbPj2E1qunbZIo+W2aRiTq
 EdMYG6YvIu1OFQaxdv+3qL86VFb2+Y8eXw6ViMvWuBjKXPKgcoN4OVbc8Q/GJSaE17
 rwgwZciU0G8Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C02QXihK
Subject: Re: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go
 provider
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
Cc: Thomas Perale <thomas.perale@essensium.com>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-06-13 21:07 -0700, Christian Stewart via buildroot spake thusly:
[--SNIP--]
> Do you have the modified version of this patch posted somewhere so I can test?

Not anymore. I will dig in my rfeflog if I can get it, but that will
have to wait until ~16:00UTC.

Thanks for the help! :-)

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
