Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B8BEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 10:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51DA660AB0;
	Wed, 12 Jul 2023 10:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51DA660AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faO5p9i-IZYN; Wed, 12 Jul 2023 10:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD2B61198;
	Wed, 12 Jul 2023 10:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD2B61198
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 186C11BF409
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9E382210
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 10:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9E382210
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJ8__ctskG2K for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 10:05:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28093822A5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28093822A5
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 10:05:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C01E1BF20D;
 Wed, 12 Jul 2023 10:04:49 +0000 (UTC)
Date: Wed, 12 Jul 2023 12:04:48 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230712120449.43a7938d@windsurf>
In-Reply-To: <20230705143023.233143-1-romain.naour@smile.fr>
References: <20230705143023.233143-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689156309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwFSXmmqtj70p1pSt2shfeYpkJj3DOGsWyHUrJqm5sA=;
 b=S2zc4e3W72eI9z+wknnJlg2MToT5pWVR1XuJizZCC7+oiU55DuZY0SR5glLly5kDKo48CO
 iQXtn18T+gnY4vJiV928E9jJXArd5McMFGOStLGuCq5n/bv9wUs1/qU69OcKU0VvPYCF17
 GiQ0nO/iXPOl2xWo0B7/fNi1ifgMbqeCnWzS2IQodZvQjUvXJAFHN7i7x5qM3hDMUCPeIG
 g8kHdmm+54zW2xwHnz9j0XjbUbZZ8kA2eFJrhr2IcC9MAGgZvLun4YnoED7GlYB2eENh/m
 +o12Sb8k/rDT9d5zFCBWmiynjg4e2BaH/RC6ktwK93VsksyiAGS/Btv8hC9zGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S2zc4e3W
Subject: Re: [Buildroot] [PATCH] support/testing: test_edk2: bump ATF
 version to 2.9 for binutils 2.39+ support
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

On Wed,  5 Jul 2023 16:30:23 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Following the toolchain-external-arm-aarch64 bump to version 12.2-rel1
> by commit [1], binutils 2.39 is now provided by the toolchain.
> 
> This new binutils version break the ATF build due to new linker warnings as
> reported by the EDK2 test:
> 
>   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
> 
> From [2]
> "Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
>  of a new warning when linking the bl*.elf in the form:
> 
>    ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
>    ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>    ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
>    ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
> 
>  These new warnings are enbaled by default to secure elf binaries:
>   - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
>   - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
> "
> 
> Bump the ATF custom version to 2.9 for binutils 2.39+ support.
> 
> [1] 90404e84c1c9d65b4f38cc3ebc30ef6a4da314cb
> [2] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4581325484
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  support/testing/tests/boot/test_edk2.py | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
