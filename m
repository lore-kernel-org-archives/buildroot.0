Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8DDCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD81616A1;
	Fri, 29 Aug 2025 21:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U059SbD5bRl8; Fri, 29 Aug 2025 21:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA456178B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA456178B;
	Fri, 29 Aug 2025 21:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3700D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A536A4177E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhwKTLiss58P for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 21:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B508441770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B508441770
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B508441770
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:53:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1F58C4E40C2C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 21:53:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBC74605F1;
 Fri, 29 Aug 2025 21:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 355531C22CDFF; 
 Fri, 29 Aug 2025 23:53:09 +0200 (CEST)
Date: Fri, 29 Aug 2025 23:53:08 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <20250829235308.18037377@windsurf>
In-Reply-To: <20250829165238.3082564-1-peter@korsgaard.com>
References: <20250829165238.3082564-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756504397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yn9itmEezMEwJhEACupjXGUxjbEZzTFYgm4fVONqG+M=;
 b=JTWxR0bgxg23drHNL4kO5kVqHj7mSsMw0wLr1MPZmwsRLyeKCWHjPI3FcNKHg34x++qBN8
 IRk/8tuI+KBkBZhmZnZ58JLhtb7GGfGWUnUZP6y6v9sydcwvq+/IswcIZdDLfy4NmY7B1N
 tCgVFGZXpMOj26+Qch8a4IhHTJvaVgLX7devTqBGp7kp2Jxnv1LQ5iAViyBbmOOBbmTaY2
 Fe5dc0yRmaeUCzoSapQLeuD8vaJmVmjNZPGvu0JT8RT7IH/9q34PH4vPKAvhoEutLmX919
 O96daOuKmDnkHrxy8zWvHN+n2TrU+fvYUE0E234WyFEvCCDjVeOvBKstMQ0rJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JTWxR0bg
Subject: Re: [Buildroot] [PATCH] package/mbpfan: fix build on musl /
 uclibc-ng
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

On Fri, 29 Aug 2025 18:52:38 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  define MBPFAN_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE" \

Upstream seems to still be active, so what about doing the "right"
thing, which is adding #define _DEFAULT_SOURCE in the source file, and
submitting an upstream patch?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
