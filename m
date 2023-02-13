Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3514C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 07:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4556640370;
	Mon, 13 Feb 2023 07:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4556640370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZSeb4L1lNfA; Mon, 13 Feb 2023 07:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C8B5401DF;
	Mon, 13 Feb 2023 07:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8B5401DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 535101BF2F3
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 07:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05150401DF
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 07:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05150401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZad0XCSNvY0 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 07:47:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A604010D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9A604010D
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 07:47:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E390100004;
 Mon, 13 Feb 2023 07:47:36 +0000 (UTC)
Date: Mon, 13 Feb 2023 08:47:35 +0100
To: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>
Message-ID: <20230213084735.5318a511@windsurf>
In-Reply-To: <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230210231454.4f3aedbd@windsurf>
 <d851f407-ddbd-4942-bee4-6b28b5387fe7.84fc06e6-1edc-441d-a0d1-fbc3c0d71619.a6a05d4b-f834-4abc-a293-13151789bb4f@emailsignatures365.codetwo.com>
 <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676274456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwHKzhuqiKbdpevSkTcVD8uaLsM0eeB7jth1atbI7qs=;
 b=iBdKIc8Ppjc2TxViZmFlhdWXA1CYeu6+72pix/IR71PvP8VX4xqHde0zxYWSDdLsVOsNv7
 6tp75lmbSHzkY9kiIw8orVrb6C/tWH0/nDYWeHiURrxyGIytxCTQdQnQEeORBpWvTmAXVy
 2ELztYxo2u1Hc+K+97N2WJzHx2LDCXWYQ1sYjlj9rE4DHD0C5gkEZOqYi3sTxAsGo7p1Qu
 eZf6cDrrMuryAZNkj5Slock/K0araA8NZYy6dCoJqG0z6lGAiNxLF0hHY1cvCh8wx0fZaF
 f9KrPom494Ou0kH2xpJrHXVZZiYEO5fpFMm11jXFyoLc3cPAqdfcxFTtt/GBTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iBdKIc8P
Subject: Re: [Buildroot] Dependency problem for gtkmm3
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
Cc: Steven Boucque <steven.boucque@ebo-enterprises.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dirk,

On Sun, 12 Feb 2023 08:51:17 +0000
Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com> wrote:

> Thank you for your quick reply.
> Will this issue be fixed in the 2023.02 release?

It all depends on whether someone submits a fix for the issue. Do you
think you could have a look?

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
