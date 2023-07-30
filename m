Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7758AC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81E061020;
	Sun, 30 Jul 2023 21:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81E061020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK81Ta05DV5l; Sun, 30 Jul 2023 21:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B646101E;
	Sun, 30 Jul 2023 21:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B646101E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4835C1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1502E81A3E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1502E81A3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ub9TTLsZzYxs for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:01:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 826AE81A3B
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826AE81A3B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D615240004;
 Sun, 30 Jul 2023 21:01:52 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:01:51 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230730230151.5a1de6c2@windsurf>
In-Reply-To: <20230730173242.6669-1-vfazio@gmail.com>
References: <20230730173242.6669-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690750912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3RE/YXYgRwrZn4XI3a5apzkl385jxGg4QNOkzTr6bA=;
 b=dbUfXr/fzikMhhnppKSyB+3nTbxLpV48xfG2hlwyoB5JQMSB4m+9RJEzwKvjOe/hCVGB8v
 j5DLGvFUmf68OcN5kXln7KwBTogTYKRi9RU9vAW+M0rupsFl/2KgWsgWHFURZHyRpUP2Ii
 GZLhjgGiegX9zJAN0Vb8R///BOlwoPOXVsApdavjLaSKH8fjHiIOJJ4dPOer98x5RleuV1
 XC4uSFQdegbUY2z+iPbaYbjC2PIV7Ppc7q0YLwzAhv+lKBJH+ky2yC+BKPI9eRdam3q8D5
 hRpA2fe3FBlbLPuTHAKux6JYNrDFyuqF8RnFX6xJ5I0zFxuMq7mW44wdLPSX7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dbUfXr/f
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add Intel and AMD
 GCC targets
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

Hello Vincent,

On Sun, 30 Jul 2023 12:32:42 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Sync the CPU target list with what's available up to GCC 13.
> 
> Multiple references used for flags and synonyms [0] [1] [2] [3].
> 
> [0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
> [1]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/config/i386/i386.h;hb=refs/tags/releases/gcc-13.2.0
> [2]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/common/config/i386/i386-common.cc;hb=refs/tags/releases/gcc-13.2.0
> [3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

It generally looks good (even though I definitely didn't check all the
CPUs and their capabilities, I trust you). However, I have one comment.

> +# BR2_X86_CPU_HAS_AVX512 is used to enable the x86_64-v4 toolchain(s).

I think this wording is not good. BR2_X86_CPU_HAS_AVX512 is not *used*
to enable the x86-86-v4 toolchain. This option is not there for that.
This hidden option is here to allow the CPU variants that support
AVX512 to indicate that they do offer this support. It has nothing to
with the x86-86-v4 toolchain per-se.

> +# Some CPUs have a _subset_ of AVX512, but do not meet the minimum requirements
> +# for x86_64-v4 (AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL).
> +# Reference: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512

I think a better wording is:

# CPU variants should only select this option if they support for the
# full set of AVX512 instructions: AVX512F, AVX512BW, AVX512CD, AVX512DQ,
# AVX512VL

Please note that if this is not a good choice, we can also revisit how
the AVX512 support is handled.

>  config BR2_X86_CPU_HAS_AVX512
>  	bool

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
