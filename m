Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE3CC07E8F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 09:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B4240133;
	Mon, 22 Apr 2024 09:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sc2TbmjW5k7Y; Mon, 22 Apr 2024 09:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9892C40175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9892C40175;
	Mon, 22 Apr 2024 09:46:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2A611BF5DD
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 09:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D65F81E74
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 09:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpFgL50oRPTf for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 09:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E34B381E6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34B381E6F
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E34B381E6F
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 09:46:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 80C7FC6366
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 09:40:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 156DFC0011;
 Mon, 22 Apr 2024 09:40:20 +0000 (UTC)
Date: Mon, 22 Apr 2024 11:40:19 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240422114019.0e8ac84e@booty>
In-Reply-To: <fc33f5e4-094a-4cab-b6b1-c9212fea6e37@benettiengineering.com>
References: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
 <fc33f5e4-094a-4cab-b6b1-c9212fea6e37@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1713778821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOZLkIjzeLDSuEsDZcRE3gMclsDJccOd5V9Mrn+9wbA=;
 b=OOTDMB0xiBsufr/wMy8Jt+gOk2x/m4eWEhsl0bvNJhH9dY9q/2hTLdpCGJ1ELgplZ5e5lK
 jSe9b1fSiUO2aqaaoI0Db1CvNLMuQhNT+OgqWxx+ra8Yq7pagopPu/B8cgySF6UZN5vbCT
 kT8yx/22x8GZyyFI0TZgSESzObQvXA/j8qLLYqAaVHl6+HCIEaceHcYv3wgWKW+9WN5ULZ
 zUg0JA2bAoyreSEs33Zqqg23g7bqUEtqsm126u2ThltVeRW0nYKoXpgdGe+wFmZZKZ6zez
 TTkyDsom7PlHPZzraprd28QWhXJIQP901uRImfeos1Depws8DIDnZF12GnAN/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OOTDMB0x
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 2024-02-06
 version on v5.2.2.4 branch
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Thu, 18 Apr 2024 16:03:02 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> On 07/02/24 22:47, Giulio Benetti wrote:
> > This version allows to build with Linux 6.8  
> 
> Fixes:
> http://autobuild.buildroot.net/results/c2524c7580d97f7387ec22da62be71d77f2ed8ec

Ouch, had missed this!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
