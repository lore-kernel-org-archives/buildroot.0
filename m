Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D0BE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 07:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9108156F;
	Sat,  4 Jan 2025 07:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMuMw6HZQJWS; Sat,  4 Jan 2025 07:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D55DD81570
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D55DD81570;
	Sat,  4 Jan 2025 07:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2671DF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1477841243
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTw6tfJyp61k for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 07:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C6ED41242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6ED41242
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C6ED41242
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 07:23:52 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 42A06240FDF;
 Sat,  4 Jan 2025 08:23:51 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 23C43240588;
 Sat,  4 Jan 2025 08:23:51 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id D7817240569;
 Sat,  4 Jan 2025 08:23:50 +0100 (CET)
To: buildroot@buildroot.org, Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Sat, 04 Jan 2025 08:22:50 +0100
Message-ID: <4951013.GXAFRqVoOG@kilian-laptop>
In-Reply-To: <5ff49b76-caae-4707-a1ad-c8836d37d87a@grenoble.cnrs.fr>
References: <6114083.lOV4Wx5bFT@kilian-laptop>
 <4618658.LvFx2qVVIh@kilian-laptop>
 <5ff49b76-caae-4707-a1ad-c8836d37d87a@grenoble.cnrs.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 237
X-purgate-ID: 154282::1735975431-667702C4-8E489CCF/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735975431;
 bh=MEC2qOSs0fh+dLZBD4MkDjFhV9xoXtjC0IcR1fa2J+M=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=aOzBSlhdqiBFJACv70yRh5DaV+lvZakz0Izj2JaC1OmjQmJgskCwFyE+e9/kRL85d
 yq3aZrqUIfUJUZ7gfiZE0vZGpmL/J1wcKRltlAqhtco46vk6UNlIXrpK7mjTz/5owX
 2rRSTZYIS3SgBVNHQtwIbO5wtbuCEDkb3xtNKbiMf2lcU86X5j+arBuwoTonQHcyBN
 qy9uW+4sEU5UHaaw3t8bIFDWY9UvlQhq7869LBFSmO5mf0csfW3fm+1fT3JCzTgfSA
 4hICnfU6iPlthe3w4al4n/FSMcjPbBCmS+I0MXjBIhwU991UtG+ArrmBWeOAR9F+R/
 QUAeEcUPbS3gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=aOzBSlhd
Subject: Re: [Buildroot] [Help] Problem with
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and kernel 6.12
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

Hello Edgar,

> I just sent a v3 of this patch. If you have a chance to test it, could
> you please reply to the patch with your Tested-By?

Just did so: It worked on my side. Thanks for issuing a fix!

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
