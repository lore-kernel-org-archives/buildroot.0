Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E65CAC58E
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 06:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE0D46F568;
	Mon, 15 Sep 2025 06:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVbMxyt-zp8G; Mon, 15 Sep 2025 06:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8DBD6F846
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8DBD6F846;
	Mon, 15 Sep 2025 06:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDF422F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 516A34045F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDY3txO9O6O7 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 06:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4473D403FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4473D403FD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4473D403FD
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:06:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F0FC21A0DFD
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:06:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4CFD6063F;
 Mon, 15 Sep 2025 06:06:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93C35102F2A84; 
 Mon, 15 Sep 2025 08:06:07 +0200 (CEST)
Date: Mon, 15 Sep 2025 08:06:05 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20250915080605.579fa2e0@windsurf>
In-Reply-To: <14e1befe002ce593820b4bc1dd63d04e@free.fr>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
 <20250909120822.1069595-2-thomas.petazzoni@bootlin.com>
 <14e1befe002ce593820b4bc1dd63d04e@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757916370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=C0L2QfIbP+Fe3jTnGIq19ukmeqaTDGX5vLwtMhybRAg=;
 b=OixTwYUzwYRmcfiZUMyhmv7K2CsiCFVX/yWun42zf+SLcDq9S9eu2PWFjZ+7tG3gUHk0IU
 Xzh/1zweIiKSkCIz8o2z0NyzkEPPFw8r4kTy7DUjYy+pkd+gsE3uTiXsil9ijt4D7KUDAK
 YxLn0GI1/GxhV/zQXPTITva+Whb12oW9XdvFWZTPhWMUbJPjJj4m7tpOfIfGPBT5UDHNYx
 4WEKNH+QmP8BbimcDyFIWDxgsxqfc02zNRwwkGXpOXvc0shjey1qI54AFIezOSV3Ca+1dz
 f2Hp32Q6GUi/AVfVGI/viQZGmunh3nlbYuy4JZ+wrPJNnSQPA0UHu0+Ubdlzvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OixTwYUz
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

+Waldemar in Cc, uClibc-ng related issue.

On Mon, 15 Sep 2025 00:28:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> I applied the full series to master, thanks.

Thanks!

> While reviewing, I found one corner case build failure with libselinux 
> 3.9
> on x86_64 uclibc. See:
> https://gitlab.com/jolivain/buildroot/-/jobs/11350151899
> 
> It seems to be a followup issue related to the one fixed in this patch.

Dammit. I must say I don't quite grasp what they are trying to do in
these matchpathcon.c checks.

It seems like:

#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
/* alias defined in the public header but we undefine it here */
#undef matchpathcon_filespec_add

/* ABI backwards-compatible shim for non-LFS 32-bit systems */

static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
static_assert(sizeof(unsigned long) == sizeof(uint32_t), "inode size mismatch");
static_assert(sizeof(ino_t) == sizeof(ino64_t), "inode size mismatch");
static_assert(sizeof(ino64_t) == sizeof(uint64_t), "inode size mismatch");

is for 32-bit systems? And here you are building for x86-64, but it
gets detected as a 32-bit system, or something like that. Is it due to
the fact that we always build with _FILE_OFFSET_BITS=64 even on 64-bit
systems, where I guess it doesn't make sense because off_t is anyway
going to always be 64-bit.

And indeed, the check used to be:

-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && __BITS_PER_LONG < 64
+#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && !defined(__INO_T_MATCHES_INO64_T)

which would be false on 64-bit platforms... but now is true on
uClibc-ng.

That check was "improved" for musl:

-#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && !defined(__INO_T_MATCHES_INO64_T)
+#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)

So I guess some additional tweak is needed for uClibc-ng.

I'm not sure what the correct fix is.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
