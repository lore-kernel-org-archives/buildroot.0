Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0C6C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1218D81E68;
	Wed,  2 Nov 2022 21:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1218D81E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4f0GHZT00sq; Wed,  2 Nov 2022 21:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E15081E65;
	Wed,  2 Nov 2022 21:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E15081E65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 162561BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E488541697
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E488541697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhSJ0keRlubE for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:21:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 814824168E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 814824168E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:21:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51F2B100007;
 Wed,  2 Nov 2022 21:21:39 +0000 (UTC)
Date: Wed, 2 Nov 2022 22:21:38 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221102222138.50541ee7@windsurf>
In-Reply-To: <20221102211923.GA3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221031214739.6b258cb3@windsurf> <875yfzf8gy.fsf@gmail.com>
 <20221102180608.4ac368ae@windsurf> <20221102211923.GA3918838@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667424099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JelMbve+e+6AmkHQDFCgnyQkpppHZjQSSv0M2UNE1YU=;
 b=E1eTdh2apEC704MLzQk88UpzE+4mToqUQ88DjK+kCVWyFEJcYdP1LGporwiUHjrA52+sqA
 HxCc6a2J1EQa2H8NkYOCQ3t0ZqFINGONwt2kI3liL+b1i7OvRFpdVkybrUB6LZBuqjtQ3n
 kCfv06VWB/L08dPCKMoBGfkJnlQc8S8Aid0vmC0XJycsMqdHFnAGRqN6UT8AfHv/N2it0h
 ux8xO1xZJbSoWpg2ljq0aeUN42IvDb/KvbbehPKJ0iAaaVeENgj7fL48PQWySW3rNoY01l
 HByqwnZDe0hulobiENlpEyx0/gEoR66eNZQAYu2LyNfkcH9mBFXtfIBkO1Y8KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E1eTdh2a
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2 Nov 2022 22:19:23 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I think you missed the part where Joachim *does* priovide that
> information  in his commit log, copied below:
> 
>     Changes:
>      - New command line options to ssdp-scan
>      - Update copyright years (affects LICENSE file hash)
> 
> So, our expectations were met! ;-)

Sorry about that, I definitely read too quickly, my bad :/

My apologizes Joachim for missing this: it was all good from the start!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
