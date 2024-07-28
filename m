Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F019C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 20:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D33080D08;
	Sun, 28 Jul 2024 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCmYpBfC_pA0; Sun, 28 Jul 2024 20:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451CD80D46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451CD80D46;
	Sun, 28 Jul 2024 20:11:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07A5B1BF47D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E95B54045E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCH_LLvwUA5W for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 20:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94BF9401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94BF9401AD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94BF9401AD
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 20:11:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F6AB1C0002;
 Sun, 28 Jul 2024 20:11:41 +0000 (UTC)
Date: Sun, 28 Jul 2024 22:11:40 +0200
To: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240728221140.01aa7ed1@windsurf>
In-Reply-To: <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722197501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCixFpSsYvFpaJnY8DpnnCRGT8E9bfUB6lfivKiF3OA=;
 b=PAL36zU1UQH714uL9rULT8nciMg3HTpU2OYwOsFqTXEsoFzBQienMNdXGkjNdEg8wpFYHi
 wdQmOc7KZFvXjNdx0mFx6pFozHPaDjoVGCpfRZMb0P0uYtwmNANI4PG5tmi8quqvBAW8qi
 4zvC6UorxO2EvbY1367+8QhJ1vXbYf1JfsQh/QGcOzxls36UDCosIUmQv+aCH2rOpG6LZJ
 oKRVGthVNvye9sszbsjDVwMHwes/mafY3CBxCsIfTtClbhHwsRbc5NEIUnw9HgMGF1TPzl
 Tx3LJ1F3gbE0x3+Dr2mI5X9/bjadSTzkDldFu2WbS0sy4T1GPrh8OUXmOLeiGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PAL36zU1
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 28 Jul 2024 19:21:20 +0300
Dmitriy Chestnykh <dm.chestnykh@gmail.com> wrote:

> Hello Thomas
> The SuperH4 issue has already been fixed by patch number 0002 (
> https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce113bfbbc03d4b8e4df7
> )

Indeed, thanks!

I still have an issue with SuperH 4 though.. it doesn't boot in Qemu:

  https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1391146782

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
