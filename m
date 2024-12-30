Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ADEE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDF5406C1;
	Mon, 30 Dec 2024 18:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlTtEtEDvWCM; Mon, 30 Dec 2024 18:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C563406B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C563406B3;
	Mon, 30 Dec 2024 18:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3D2CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB63581309
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3c-yA-N-HAE for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10618812DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10618812DD
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10618812DD
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:14:39 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 398E3240D01;
 Mon, 30 Dec 2024 19:14:38 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 199BD240572;
 Mon, 30 Dec 2024 19:14:38 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id C73B8240A44;
 Mon, 30 Dec 2024 19:14:37 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:13:42 +0100
Message-ID: <12579010.O9o76ZdvQC@kilian-laptop>
In-Reply-To: <9a7e549a885d5e587fee6e7f6eaea0a8@free.fr>
References: <20241229202456.23018-1-kilian.zinnecker@mail.de>
 <9a7e549a885d5e587fee6e7f6eaea0a8@free.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 610
X-purgate-ID: 154282::1735582477-0577A2C4-A8AAB805/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735582478;
 bh=E0zavOyR1yrU128S/j4CipKPFKNRxiFbGKgwR+t+KuM=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=tQvcNxhKGU1PZjgs25JT8ycKh2RKYuraJfxhp0T9dBP3f1i4jimff5De4JLiXq0Z5
 v2g6IjaJYUCn/ViDBHtddIOo/UtT73GqCNVdPRjGSJOqwyXzEX74hNyk7Nx6jHlVfz
 +w7zSCRDVQdZUsKNEkpAirs2QbmHvWVlT6plQVI6+r2z44I+VpzhSbGdfDWY91mZ1t
 2mQ8X2Q7rS6hVw0xHIwFjNIeGplpfOf5UvrRInkn4BJibvJu6pbdYlBBmnVOrsTN6A
 yWHKHKtaplL+ke5wVmBfAYWQ2yASr2ob4+cQHgchg9vGfrExXVzaz63Y5RX7jnVKJE
 4AwMWRK0O/4fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=tQvcNxhK
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/qemu_riscv{32,
 64}_virt: Bump OpenSBI
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

> I applied this patch on master, thanks.
> 
> I added a new-line before your "Signed-off-by:" tag to match the commit
> log
> format. I also updated the opensbi hash file, specific to this qemu
> defconfig. It was working because the boot/opensbi/opensbi.hash file
> happen
> to be at the same version, but we have no guarantee that those will be
> bumped at the same time in the future.

Oh, I didn't realise that the qemu boards do have their own hash file for 
OpenSBI. Thanks for changing the hash and thanks for applying the patch.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
