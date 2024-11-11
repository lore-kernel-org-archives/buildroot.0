Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F34D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46760402BD;
	Mon, 11 Nov 2024 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHsub84tJyzq; Mon, 11 Nov 2024 21:00:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A2F402B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A2F402B9;
	Mon, 11 Nov 2024 21:00:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4264BD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3054880B90
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsDms7zaFULK for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 21:00:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 004C480BAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004C480BAC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 004C480BAC
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 21:00:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4323E60002;
 Mon, 11 Nov 2024 21:00:11 +0000 (UTC)
Date: Mon, 11 Nov 2024 22:00:10 +0100
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>, Brandon Maier
 <brandon.maier@gmail.com>, Niklas Cassel <cassel@kernel.org>
Message-ID: <20241111220010.63fe44a1@windsurf>
In-Reply-To: <ZzIVSTNPFHE_V3yR@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
 <ZzICaWfSt7aJ2y1B@ryzen>
 <CADwxmT=bajsScNg33csd+zBRBEkTyo3YjBiW553Tmr860MKzRg@mail.gmail.com>
 <ZzIVSTNPFHE_V3yR@ryzen>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731358811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peCOSZnBKnNN96Lr8FkCT6N0Hp75ylf1xVmANQDd8Rg=;
 b=RxFHjWo147wMpXuOgNxC/rzjcfB31FS8TIHcq9aD0FLmpfwyslI/HB/MWQtwRWgqCLY1DJ
 q89HKJUdtymsYgyupdG+mHx5M8TNqZPc7MI0BEpuXW0+biak9/bsCrO1PV41FQk1l6Oyhy
 c0XxA/tmKi4ItetWwjgh9p4/6rXY4Co/nRkDBs1aqbkYbYOiHGbJwICcunuQJR0Bactk3M
 QFOn97Zr3Vn7CR13xTCvxYgCK5NCM2FU7JyLlAcHXIsxw2Qe4M20NNjnN2zeSFe9EIBJUt
 zFI4jgzyC1peNp6xjqUicMvXZAxoeswXzkL2FNenPVMXzX6O1+/W1ti/Ss8Jlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RxFHjWo1
Subject: Re: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 11 Nov 2024 14:31:38 +0000
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> > I left it out of this series as I haven't looked too closely into
> > which of "L" or "root-*" is better. It doesn't seem like a simple
> > choice, as U-Boot has a lot of board-specific settings.
> > 
> > Do you and Thomas feel confident that root-$ARCH should be the preferred type?  
> 
> For new boards being added to buildroot, definitely.

I don't have a strong feeling at this point, but it looks like the
Discoverable Partition Specification is getting quite well standardized
(https://uapi-group.org/specifications/specs/discoverable_partitions_specification/)
and adopted. And genimage indeed supports those now, so we should
probably move in this direction.

That being said, having as a first step our defconfigs comply with our
existing policy would already be good.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
