Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6C6C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A95460EE2;
	Wed, 21 Feb 2024 17:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWez3ldg4TQ3; Wed, 21 Feb 2024 17:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D20E60EFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D20E60EFA;
	Wed, 21 Feb 2024 17:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A84E41BF384
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95DB881DE2
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMwrshiHwp7S for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 729868222A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 729868222A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 729868222A
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:08:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8DE7313F8A7;
 Wed, 21 Feb 2024 18:08:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:08:14 +0100
Date: Wed, 21 Feb 2024 18:08:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZdYt_stfXR6pbvR5@landeda>
References: <20240219182604.1287000-1-buildroot@bubu1.eu>
 <ZdPEzH3kvBYikWcY@landeda>
 <04a28a98-2699-44b6-b5d5-697a1a6fe893@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04a28a98-2699-44b6-b5d5-697a1a6fe893@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708535297;
 bh=Dsocv8IOEq88ZE6gAQDTbH4hYJn1+k3wOo0oD5t1210=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKnr+ixy4+hpfYb4VKdWajPKQSDAe8iUhR5bbhb9gOmyjyGdukv7D7tLsvU2xQwpt
 VnF0OOXvtzty9fwNCLcJeXP+hviFvbOurXNZ7aOXVk9PGYRceCb2bT3XeXYodl+l0l
 tNfocBrybEWarM5hcXaL75MaKKDPfx/YBJmpPD2hLVfDT9vbAKaiPLNhkWzuChdUSI
 jQImK8WLKP1J6/R3sZMCBW2q36ouCW97zsSpuPXxjtdSeCZmiiB0ZcV9IMYo9D3R7F
 H4lnKlaiwBQL+2N3N1LBv6oeEJpnqM6RjJZE1kzhnSk0PLfJOcWVbegPEvRepAflPv
 XYj+LpxOJRL3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sKnr+ixy
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to version 254.9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

+Thomas

On 2024-02-19 22:30 +0100, Marcus Hoffmann via buildroot spake thusly:
> On 19.02.24 22:14, Yann E. MORIN wrote:
> > Please watch the gitlab pipeline for any failure of the runtimet tests,
> > just in case this minor version bump breaks anything.
> So if I understood that correctly I can add myself as a maintainer of the
> runtime test files and I'll get an email when that test fails? Or is that
> not how it works?

As far as I understand, yes, this is what should happen. Thomas has some
scripting (somewhere!) that sends the daily emails, so he'd have the
authoritative answer.

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
