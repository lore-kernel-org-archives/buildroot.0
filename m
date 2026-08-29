Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D898C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 16:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D78605FD;
	Sat, 29 Aug 2026 16:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBLHQsqqDySq; Sat, 29 Aug 2026 16:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788022334;
	bh=lepDyxvc0lcJnwgAjMYWjWuUbt404JceLf9NZYRFZVg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K6xUkMZe1afaSMeV3sDmWfD/RVvPkm+xHOSbBLp4A/3Yft1UkYxAAciZWxhNzrqtT
	 dwJQaFt/kCjSY8Ziv5VO6TTMYLoP4P47nFlTzaF5McxRlm6PjnYzVocQfsaooSSon2
	 WeRJEmts2RD/SToSSULARQe5D5Cq7WIXIOn9OXJP3sUd7FJfC3peWImeaulElzDUzA
	 78SfBOLslwWuLQYxqNqrpA+6l0+7N8FfCD8+7O93DTAEhFxkX3YjQk/BNPOvmbWS7j
	 MrPcG1ioqsemiHcMcnMmJCVYhsts6cI2y+Pf1bBiA3Yz6WD04fiGS9J3DZshvu7UzF
	 265a9fBZ4l90A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9523605F3;
	Sat, 29 Aug 2026 16:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFCD6355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4CC040669
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtzlFJm5cYmY for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 16:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 009794072E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:52:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6461A780331;
 Sat, 29 Aug 2026 18:52:08 +0200 (CEST)
Received: from 2a0d:e487:118f:32f7:a07:17e2:1c81:e739
 via 2a0d:e487:118f:32f7:a07:17e2:1c81:e739 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Aug 2026 18:52:08 +0200
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 18:52:08 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <8733vxypoh.fsf@dell.be.48ers.dk>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
 <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
 <8733vxypoh.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.18
Message-ID: <ea3adbc598ea273edba25e595fad4969@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Thomas,

On 29/08/2026 16:19, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni via buildroot 
>>>>>> <buildroot@buildroot.org> writes:
> 
>  > This commit adds a simple bpftrace test that ensures that not only 
> it
>  > builds fine, but it also runs properly on a minimal test scenario.
> 
>  > +    config = f"""
>  > +        BR2_aarch64=y
>  > +        BR2_TOOLCHAIN_EXTERNAL=y
>  > +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>  > +        BR2_LINUX_KERNEL=y
>  > +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  > +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
> 
> Any specific reason to use such an old kernel? The qemu_aarch64_virt
> defconfig uses a 6.18 kernel. Is it to match the default ARM 15.2
> external toolchain? If so, that one is built against 6.6.44.
> 
> cat 
> output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/linux/version.h
> #define LINUX_VERSION_CODE 394796
> #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + ((c) > 255 ? 
> 255 : (c)))
> #define LINUX_VERSION_MAJOR 6
> #define LINUX_VERSION_PATCHLEVEL 6
> #define LINUX_VERSION_SUBLEVEL 44

I initially had the same question. Then, I assumed this new runtime test
has been simply copied from the existing test_bcc:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_bcc.py
which was written with kernel 6.6.32, which was the latest LTS at that 
time.

Once the next 2026.08 release will be complete, I think we will do a 
cleanup
in runtime tests, to add a Aarch64 builtin kernel at the latest LTS. So 
all
those runtime tests will be updated.

> --
> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
