Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA07CFC29F
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CF242900;
	Fri, 21 Nov 2025 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHmVgDN_a-Pf; Fri, 21 Nov 2025 20:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265C74145A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265C74145A;
	Fri, 21 Nov 2025 20:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 195621CD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39DB84BEC
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 20:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-r3OFOSlJjc for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 20:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 205EC84BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205EC84BDF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 205EC84BDF
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 20:21:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DF4701A1C99;
 Fri, 21 Nov 2025 20:21:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A79CB60719;
 Fri, 21 Nov 2025 20:21:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F37CE1037162E; Fri, 21 Nov 2025 21:21:12 +0100 (CET)
Date: Fri, 21 Nov 2025 21:21:11 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20251121212111.427407e5@windsurf>
In-Reply-To: <0a4122d8a302d456424d8e61b9ea06fd@free.fr>
References: <20251120221558.1138538-1-thomas.petazzoni@bootlin.com>
 <20251120221558.1138538-2-thomas.petazzoni@bootlin.com>
 <0a4122d8a302d456424d8e61b9ea06fd@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763756476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4a7KmfO1QAtfCuq2G3EddnXTaK6ay83DdXrMsGy8bSU=;
 b=mBcYERZY7L018pnL/CYiRj74M8yb+5VvcKHmSdk6S6QcGKdte4R6yRBRKY3ivcwMnjS4PA
 2YeWj7+iclHmNKxj5HAF+xZNGbOBt1L5Lwt+ptz2whmNKeL7kGbl6LTqJy2Vma1bTfXCcC
 s04jQkIfbsRPaQ9JNnA4+zhicaWZT7OKXJpdq810rE2Wnf+0o2Lp6eI6YKxRgkgmo/vY08
 xszWVst/2YxRXURlHNRXUuFhZK7baubtGhscNrgLEjOryeUtrE4cotID8dmv15z8ULSjmb
 LHfUaw+9AGlWgo6pM3bXrcpCtalAYIvj5zvdylIgf2Tx8yowiyrH/iDasbQozQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mBcYERZY
Subject: Re: [Buildroot] [PATCH 1/3] package/binutils: add support for
 binutils 2.45.1
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

On Fri, 21 Nov 2025 16:13:35 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Series applied to next, thanks.
> For info, I fixed the binutils version 2.45.1 Kconfig prompt. See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/b7d5ff9d51507dcef721ff3d5db862f8715d3351#48ea993dbd04b7e5bbf317a81c0aa3446cd106dd_36_39

Thanks a lot for the fix!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
