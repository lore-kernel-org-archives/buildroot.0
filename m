Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B706C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1885660E25;
	Tue,  2 Aug 2022 22:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1885660E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PXCbo6O7bJI; Tue,  2 Aug 2022 22:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A5F60AF8;
	Tue,  2 Aug 2022 22:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A5F60AF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BB231BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E1BC818AC
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E1BC818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWyQ1YBM5HCb for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:29:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C01FA818A7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C01FA818A7
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:29:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B20BB1BF203;
 Tue,  2 Aug 2022 22:29:34 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:29:33 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20220803002933.0e959c3b@windsurf>
In-Reply-To: <20220802133625.1285283-1-Ben.Wolsieffer@hefring.com>
References: <20220802133625.1285283-1-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659479374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ClquGaKVgPJWPELGmNJXUX7SsdULtkjsK5IW9AIBLk=;
 b=HiphXRxiUTp2ejTgSdLoV9NK5V7uMcyAT2Z9eNuFcuAokZ8vnfdLwnDIHOWmBkUnycXCc4
 SLDPbbVPISYAPnuKye+JJRMyOwE4Kvnx8kDAs+feawyjxssqaIHNrU4X6P0v8fz3vzjjAP
 8d7jz/cJOUoDgBQ+7H0hPl4R/DOcV5tePfK30TttFIyRuhCe/mkKFcIuKgsJ3qdwRGtrqe
 4xALNK9UqV9DrCztV87v1TXoUKtSDfyqapfk6We7yX3far1yfenY1ZOJHB7Ztm9p+gqJTE
 mBFfOUB2DblTuAk/LKb9WePdrcs7RtTjoayM9c+KryeEwxfcVopzsUjjZbAZJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HiphXRxi
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix usage of DODEBUG option
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

Hello Ben,

Thanks for this contribution, good change! Below some
comments/questions.

On Tue,  2 Aug 2022 09:36:25 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> The DODEBUG option passes -O0 and -DDEBUG to the compiler, which has a
> significant impact on runtime behavior and performance. Currently,
> DODEBUG is enabled by BR2_ENABLE_DEBUG, but it makes more sense for it
> to be enabled by BR_ENABLE_RUNTIME_DEBUG.
> 
> This patch implements the above change, and also disables the DOSTRIP
> option when BR2_ENABLE_DEBUG is set, allowing debug info to be retained.

We want to disable stripping unconditionally. stripping is done by
Buildroot on the $(TARGET_DIR) when stripping is enabled. Ideally,
packages should not themselves strip binaries.

> Lastly, this patch passes all of $(TARGET_CFLAGS) to make, instead of
> just $(TARGET_ABI). This enables debug symbols when appropriate.

This has a bit more impact:

TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)

TARGET_CPPFLAGS means we will now be passing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64

TARGET_OPTIMIZATION means we will now be passing -Oxyz, perhaps
overriding the optimization level chosen by uClibc? We have seen that
causing problems with glibc for example, I don't know if we need to be
careful in a similar way with uClibc.

TARGET_HARDENED means we will be passing -D_FORTIFY_SOURCE=1/2 if
BR2_FORTIFY_SOURCE_1=y or BR2_FORTIFY_SOURCE_2=y.

I'm not saying no to this change, but again we need to consider the
impact.

One more careful option is perhaps to do:

UCLIBC_EXTRA_CFLAGS = $(TARGET_CFLAGS) $(TARGET_DEBUGGING)

This achieves the same goal of having the debugging symbols, without
risking of introducing extra flags.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
