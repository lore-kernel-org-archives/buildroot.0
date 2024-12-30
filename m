Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4136E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 600C081164;
	Mon, 30 Dec 2024 21:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgR3UpJOEf4t; Mon, 30 Dec 2024 21:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78DD581167
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DD581167;
	Mon, 30 Dec 2024 21:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6143FE0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 427CF81167
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMOHGbTCRIGd for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:22:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21A5481164
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A5481164
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21A5481164
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:22:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2936940004;
 Mon, 30 Dec 2024 21:22:36 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:22:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?=
 <jan.kundrat@cesnet.cz>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241230222235.26d27832@windsurf>
In-Reply-To: <20241230113710.679717-3-heiko.thiery@gmail.com>
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
 <20241230113710.679717-3-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735593756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvRqqFbdqu2aLcchKV9dD7K+cOr2bwwygcHgGBXjZG0=;
 b=a02nilw04H3jvnFD2dRECXFrb7OJUlz8GA70ai8jHxNv5yKA3DW6rzICnnnSMphtnDpqiu
 Bf4+3Z5JPip+x4kH/lFGWjnVu7SNKpwnifReVsb0+S3LmRDsaXLsHvsUurBRsCu+bRItx6
 8dAzUCc1s6jSYqy9aFp9/jdrie1QtIRNmMKHDuBsQNoVqJFuz7ZLljybvl1wzJ/WwMOCh1
 afvBb5ZVZVaAO4CbN/wh7FXnGCZ9bgfSKJiOrVhhiN107xJGPcOQu/auFNVyySCq+LfJg/
 zegbtMtUJF91PXc3ZCDxt3MHCBIrIF8ENM8RLF90xOrjbZYHzl4DFIqRuwS6Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a02nilw0
Subject: Re: [Buildroot] [PATCH v3 2/6] package/libnetconf2: bump to version
 3.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Mon, 30 Dec 2024 12:37:09 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> -LIBNETCONF2_DEPENDENCIES = libyang
> +LIBNETCONF2_DEPENDENCIES = libyang libxcrypt openssl

The addition of libxcrypt here is not mentioned in the commit log and
is actually incorrect. Indeed your Config.in file has:

        select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC

So only glibc configurations select libxcrypt, so you cannot
unconditionally add libxcrypt to your dependencies.

You need to keep this:

ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
LIBNETCONF2_DEPENDENCIES += libxcrypt
endif

which was already there.

You could have spotted this issue by doing a uClibc or musl build for
example. ./utils/test-pkg can be of great help to figure out this kind
of problem.

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
