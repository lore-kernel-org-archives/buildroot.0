Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79890EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 10:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E530417D4;
	Tue,  1 Aug 2023 10:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E530417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU02RfDf89Kz; Tue,  1 Aug 2023 10:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED8B0417B4;
	Tue,  1 Aug 2023 10:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED8B0417B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A997E1BF290
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 10:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D61C417D2
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 10:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D61C417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKci-x4xSbwk for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 10:11:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5545417CE
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 10:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5545417CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA14520002;
 Tue,  1 Aug 2023 10:11:19 +0000 (UTC)
Date: Tue, 1 Aug 2023 12:11:18 +0200
To: Afshin Pir <Afshin.Pir@gallagher.com>
Message-ID: <20230801121118.72610acf@windsurf>
In-Reply-To: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690884680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM6MoabcZEFzUF1kYaSt2e1kNiQPHKuTf3JOIPRQDuE=;
 b=CC0suaAbNLaJkvcCBTo4gXFJKCis6IF9qDXT5aXRIdWOpR8F1PuLF32PyWQG9K5x4Lt+/V
 RjhZnW/Z0gKA92uPCWYIJg890IsEsQmivxmNbb4ulaD1xNMJXJaHwsCVJ1gqPv/B0QyGzU
 kWBvZSAnJZWjUd3bJ1U1FgFSM/E7rxGEWsO5Yh4kLzgD/9E/IjIOvctUpquB3qec6+mnIA
 qdZ22E6ttKm1jpNTVfXWsYHDXESSkqgIsFp/BxQw98rZAjZRwTxKVu9QLkzzfRfqyVKcx6
 MeDIUf/o5W8Io8jeBZtbs0SFn1bo87cXbR/EvDtAcoEbaJR6zv4ho7HtpTsEPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CC0suaAb
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Afshin,

On Tue, 1 Aug 2023 04:36:24 +0000
Afshin Pir <Afshin.Pir@gallagher.com> wrote:

> I wonder when http://sources.buildroot.org is updated normally.
> Because from what I see, it is normally updates pretty quickly when
> packages are changed, but there has been no update for last 2 weeks
> while some packages like openssh have been updated.

It is normally updated constantly. I see right now the script from
Peter Korsgaard is running on the machine to do the update. But I
indeed see in http://sources.buildroot.net/openssh/ that the latest
openssh version is not there even though the bump was done quite some
time ago. I'll try to see what's going on, though it's usually Peter
that takes care of maintaining this part of the infrastructure, so I'm
not super familiar with it.

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
