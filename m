Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425A0C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 19:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B0740821;
	Tue,  4 Jun 2024 19:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b655w0oTRN9y; Tue,  4 Jun 2024 19:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0BA4087E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0BA4087E;
	Tue,  4 Jun 2024 19:25:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B09D1BF3E1
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5787A405F2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9UTCTT2eERF for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 19:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B4840542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B4840542
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B4840542
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 19:25:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B202C13F8C6;
 Tue,  4 Jun 2024 21:25:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 21:25:29 +0200
Date: Tue, 4 Jun 2024 21:25:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Zl9qKai-hMy4xPIe@landeda>
References: <904c1a18-623f-45c1-af36-f6b661a86a54@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <904c1a18-623f-45c1-af36-f6b661a86a54@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717529131;
 bh=90FZQItwd8ip7SUG0k2sQsMYS2MpxcI4ekY56xA2Sm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuRkSPdqvPcJeFiGNdePnDtmmfsEDuOURVRSKKVkWsRy63EoKrUP3Q0TyJJKi/+b6
 G1DpDHpy7C86FGYn7ZN+QRedK1PNwJ0T3eT/clYd/U0DK+LvKk2t1zaZ8QU6SS7BpC
 acE+MJxvOxLIuUOp6/N7qx2B7IZ5hVrFMwX/zjeH++tDy6EIRjsBs5jiyRRoPUQ8+v
 CbiPaz6+qsISg/lcDrc2a9RLHd9hrtT2LqAmSjhx/O84g5cv+HaC0VH4ttH7WgEPwr
 xi1HunOIewE+kp7z7E+jq8G/u7rbnO2s+lRnWtCUGgD+tZjFzZYNBdcDRN7Es11ob8
 x/h71fVE9/nIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GuRkSPdq
Subject: Re: [Buildroot] Init scripts for Busybox daemons?
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

Fiona, All,

On 2024-06-04 21:20 +0200, Fiona Klute via buildroot spake thusly:
> for a system I'm working on I've needed to create init scripts for
> Busybox daemons, specifically crond and ifplugd. The scripts are fairly
> generic, so I'm wondering if it'd make sense to send a patch to
> optionally install them (similar to BR2_PACKAGE_BUSYBOX_WATCHDOG).
> 
> Is that something that could be merged? If yes, I'll look at preparing
> patches.

Sure.

You may wish to do like S01syslogd, which only gets installed if no
other syslogd package provides it.

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
