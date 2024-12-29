Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B12E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263F18048B;
	Sun, 29 Dec 2024 20:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yfms8eHnNmBR; Sun, 29 Dec 2024 20:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E5B804CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E5B804CB;
	Sun, 29 Dec 2024 20:27:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3083C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C0F6088C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ww4qqV4uKGwT for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E547A60876
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E547A60876
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E547A60876
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:27:27 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 1D924240B78;
 Sun, 29 Dec 2024 21:27:26 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id F2FFC2405A0;
 Sun, 29 Dec 2024 21:27:25 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id ABBED240CDF;
 Sun, 29 Dec 2024 21:27:25 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk
Date: Sun, 29 Dec 2024 21:26:31 +0100
Message-ID: <2763562.mvXUDI8C0e@kilian-laptop>
In-Reply-To: <fcb5575736e0856d9b24e1c43d727e2d@free.fr>
References: <20241229184035.5026-1-kilian.zinnecker@mail.de>
 <fcb5575736e0856d9b24e1c43d727e2d@free.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 597
X-purgate-ID: 154282::1735504045-A3D3A89E-C2D9E830/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735504046;
 bh=waGGYi1KBUsUYGgqdGHHJUSXx7CVPGFJ/mhMuWaHUIM=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=LXrBFDTvl2a3K2Vc0oO8BQzKdSHUbCiPlzY+zhnhQcQKNRP+2Kzt0vyoB28IIzE20
 HpvzLHlejSVWfUCUFH/miVUC4EWMFFwQIRpXF8wIvdDONbYfYRoyG4PaSCf7ZFWsNh
 nkqBCdc2wFxH9chVFQ5PUOlxsNUjmds1r/hIdAb7feDTwIaQJUfpu2Awe7eKavZELl
 qkerkCfCjgZAmneU34DmNmOz0OSRkVO9eUpxLaQOEMWHcA1XfeZ8B2jaj3UC4Tdwq/
 8j3S6J8IRpj+IxUzCMuYP1sDNY72E1OQewa9OSCT6+mr+olRA5xtM9hEzVMIqn2T92
 VPgSRArcEJgRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=LXrBFDTv
Subject: Re: [Buildroot] [PATCH 1/1] configs/qemu_riscv{32,
 64}_virt: Bump OpenSBI and Linux
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

[--SNIP--]

> Could you send an updated v2 of this patch bumping *only* OpenSBI
> to v1.6 (and fixing the readme.txt qemu command line), please?
> 
> We are trying keeping all qemu defconfigs at the same Kernel version.
> You can see that by doing:
> 
>      git grep KERNEL_CUSTOM_VERSION_VALUE configs/qemu_*
> 
> Since 6.12.y is the new LTS, it will be better if we update all those
> defconfigs to a new Kernel version in a separate commit, later...

Oh, I wasn't aware of that. Thanks, v2 without updating kernel versions just 
sent.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
