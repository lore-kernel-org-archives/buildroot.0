Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95283CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 19:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1964661295;
	Fri, 19 Sep 2025 19:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6VseQpUAFis; Fri, 19 Sep 2025 19:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A2546129A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2546129A;
	Fri, 19 Sep 2025 19:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EA3D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE194102F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 19:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s1WSiMnjjf0 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 19:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC5044103A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5044103A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC5044103A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 19:00:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BD1AD1A0F1D;
 Fri, 19 Sep 2025 19:00:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D204606A8;
 Fri, 19 Sep 2025 19:00:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0F24102F18AC; 
 Fri, 19 Sep 2025 21:00:46 +0200 (CEST)
Date: Fri, 19 Sep 2025 21:00:40 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org, Antoine Tenart
 <atenart@kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20250919210040.6f247422@windsurf>
In-Reply-To: <aM2kFrdPdzNWbXhj@waldemar-brodkorb.de>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
 <20250909120822.1069595-2-thomas.petazzoni@bootlin.com>
 <14e1befe002ce593820b4bc1dd63d04e@free.fr>
 <20250915080605.579fa2e0@windsurf>
 <aM2kFrdPdzNWbXhj@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758308450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LnwEtYVuSLFJyRBivbIgvr4K+4bIIewG6Ity49Ka5Oc=;
 b=P1y0dS21gDQzUJK230it/AreMxuXeC5T6tADAatIDji3VA9/zaj1RzcHuYDVyvIEF2GarR
 VAytTdi0R9yME+xlUmjnC8yfvKpamTLpL6UhS2HuV1ef0Sy/5cAIPPmvG7eB+zFytWyDnB
 g3oF01a5UP1pdIVDrIoFVwjVFY+pctJsWdscWnapno86jMnxS0lzUuVmlcLy8h0WAoLMs1
 byx378+/vgTlKRFP3dW8GYzQFN3FNlIJYqfxfwzd/SpMWBdQ2/xs5Jl6hSN8SM5YWFjQZC
 HodZXc6KWDDga1NJCRSb5hRzbLEu7tE0f3tQBgZP8JlIuzbsLRwp6SOd+d6znw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=P1y0dS21
Subject: Re: [Buildroot] [PATCH 01/11] package/libselinux: fix build issues
 caused by 3.8.1 bump
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

On Fri, 19 Sep 2025 20:42:30 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > Dammit. I must say I don't quite grasp what they are trying to do in
> > these matchpathcon.c checks.
> > 
> > It seems like:
> > 
> > #if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
> > /* alias defined in the public header but we undefine it here */
> > #undef matchpathcon_filespec_add
> > 
> > /* ABI backwards-compatible shim for non-LFS 32-bit systems */
> > 
> > static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
> > static_assert(sizeof(unsigned long) == sizeof(uint32_t), "inode size mismatch");
> > static_assert(sizeof(ino_t) == sizeof(ino64_t), "inode size mismatch");
> > static_assert(sizeof(ino64_t) == sizeof(uint64_t), "inode size mismatch");
> > 
> > is for 32-bit systems? And here you are building for x86-64, but it
> > gets detected as a 32-bit system, or something like that. Is it due to
> > the fact that we always build with _FILE_OFFSET_BITS=64 even on 64-bit
> > systems, where I guess it doesn't make sense because off_t is anyway
> > going to always be 64-bit.  
> 
> So would the right fix to enable _FILE_OFFSET_BITS=64 only for
> 32-bit systems? Or do you think something in uClibc-ng is wrong?

Defining FILE_OFFSET_BITS=64 all the time works fine with everything
but uClibc-ng, so I'm tempted to think that something else is wrong in
uClibc-ng, but I'm not 100% sure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
