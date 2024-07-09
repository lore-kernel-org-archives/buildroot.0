Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22569C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C83BB40E94;
	Tue,  9 Jul 2024 20:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhPhlWD1SVsX; Tue,  9 Jul 2024 20:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79BBA405F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79BBA405F6;
	Tue,  9 Jul 2024 20:18:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7411BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47AE160F44
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHf_c9SR_oPc for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C1E860F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1E860F48
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C1E860F48
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:18:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAD4E40004;
 Tue,  9 Jul 2024 20:18:02 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:18:01 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20240709221801.693bbcf4@windsurf>
In-Reply-To: <CA+TH9V=JtqxKcR+PC9xms+iDtPq9M2itUx3qpkvMdMzyjL6p4A@mail.gmail.com>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-4-fiona.klute@gmx.de>
 <20240709214519.2c8c5968@windsurf>
 <CA+TH9V=JtqxKcR+PC9xms+iDtPq9M2itUx3qpkvMdMzyjL6p4A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720556283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kORTM1aHd/5pGvWy5qI41v+tuxRn/RDEJ0LdGEQAX9g=;
 b=d5UiENPoSg/00g6/F+B9Y7oWFqplozbJUzuDP3o57XVrF8rwDjbeFupPch1gzvk2U/6Jno
 XuCdJKwMcDv+lKUP05O/r/iooSOJLkJ/NIJ6WO2ZTARCb2lUz00F8IGD9W4c1vf/7z+GcR
 dp/4BW5gkP/U6ZrTj6/mMkZluPt6f+fS4e4shCpTWBi8XONRcwGsS/2aePrSVaLt6lQdrh
 oFmhuTfCSmOd0/F+8i5mrBu8aPOTl78uiC8TfFLdFRNz1f7WR/x++oVmVKRJ39Ror+XICL
 ofHDNBRphVnftKijDB1nGLoF85WvimpHSCaBODqwuoYD89FfexRT0HzwMXijeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d5UiENPo
Subject: Re: [Buildroot] [PATCH v3 3/4] package/fail2ban: bump version to
 1.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jul 2024 21:52:21 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> It doesn't work without applying my previous fixes (for python and
> fail2ban).
> Fiona documented in the cover letter.

Dammit indeed, and Fiona even reminded me of this. I guess I'm trying
to work on too many different topics at the same time. Sorry about that
folks.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
