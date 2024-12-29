Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E49E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 11:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F6C4049C;
	Sun, 29 Dec 2024 11:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7F02MjJCgio; Sun, 29 Dec 2024 11:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E2840268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E2840268;
	Sun, 29 Dec 2024 11:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FE472
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9717180D71
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 11:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJNroKqV022p for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 11:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C30B780D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30B780D76
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C30B780D76
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 11:41:47 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 0CE48240AD8;
 Sun, 29 Dec 2024 12:41:46 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id E1183240571;
 Sun, 29 Dec 2024 12:41:45 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 6F07C2414E4;
 Sun, 29 Dec 2024 12:41:44 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk, alistair@alistair23.me
Date: Sun, 29 Dec 2024 12:40:50 +0100
Message-ID: <2763196.mvXUDI8C0e@kilian-laptop>
In-Reply-To: <1990935.PYKUYFuaPT@kilian-laptop>
References: <4632342.LvFx2qVVIh@kilian-laptop>
 <ead4cfe5eaae652ae308c78b6b23e66b@free.fr>
 <1990935.PYKUYFuaPT@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 467
X-purgate-ID: 154282::1735472505-657722C4-4D21F280/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735472505;
 bh=hUYe/U8kDxBRsXO5dctqv1MDS9pDQTkS2pLVKnEPKew=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=WtH9iOL7OrqHB50BMboIpCkWqeDBWsWEufniwoUxu3nVo7blfr0OCUZYOX0kGrJXO
 +HLb08pDLV9Bs6zsQC10z7dubhcNXUB72A9FDO+v1LT9ZTPZRDCLvm2V08BPiQ8/FA
 ePjeoDP6PjToU6H5ixLFuTvLBnVDgtFnW5BE94IGx1XmiGwATsANRQSZtNA2x+I14c
 nXrd5S2Z2slTBRz39+MjPKqFpvAZUfg6mF0A1n2VQy1n4sMsEqS8lwQEfbbNvMdQ2S
 Jvz9htD56XoL6ztQ8tTEPFQbQle4/ri5fVK5wGJrXmZGjCkiRLDTVj0crkLolUam9D
 Z8vmy83T5QjFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=WtH9iOL7
Subject: Re: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
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

Hello Julien,

[--SNIP--]

> Do you want to adjust the defconfigs or shall I give it a shot? If the
> later, shall I add you also with a signed-off-by to the patch, as if I
> assemlbe the patch, I heavily rely on the information you provided?

I prepared a patch to also update the qemu board defconfigs. Will send it after 
the OpenSBI patch was accepted. Tell me, whether I should add your signed-off-
by as well.

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
