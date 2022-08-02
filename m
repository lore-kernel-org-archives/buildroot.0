Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F07C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A58D40593;
	Tue,  2 Aug 2022 22:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A58D40593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzZWU388hZe4; Tue,  2 Aug 2022 22:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F38140354;
	Tue,  2 Aug 2022 22:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F38140354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B88B21BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FFEF814C9
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FFEF814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqlpwjyHir3s for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:12:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417FF813E0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 417FF813E0
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:12:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C81E31C0006;
 Tue,  2 Aug 2022 22:12:04 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:12:03 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20220803001203.3b341222@windsurf>
In-Reply-To: <20220802202142.1770838-2-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220802202142.1770838-2-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659478325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MiaSAWYFtzsPYv7t87YxOg/7rPtmtsVZmtjRoEQu08=;
 b=cyKWAaVV09/JFblXBjr15vvBPAhCzYGvTsmfeq4zVpKENWyFwlBH5sIGfXjdF1Dzz1Ul6L
 /Gnl7Y2EmfTT53L1p338VuQhzGsHZ3kI4zQ/jQZSzd41Y7iNfarodelWv0MG85TvYcu6bI
 ENbVPq5mamtOZdRGCYzb7ZWVcjSQiZNoiJlfndhMlgZYRoa0atECn9ZC1Mi+v5iYL/cacZ
 BKFOYl/SeUN60w3vAYvrVttUwaQqvh42D/2v/MLd4VTT3SnQdc94vZG+Nj9l2m+RNukxSl
 +NKWnLDcHXkI4UstczIed+BFFPkk8UJn597/1BnQwCy2MtQFWgR5JDZShJtAIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cyKWAaVV
Subject: Re: [Buildroot] [PATCH v2 1/4] Revert "arch: drop now useless
 support for FDPIC"
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Tue,  2 Aug 2022 16:21:39 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> This reverts commit 58dcd28dfbed481becb822b009583a63efbc6ffa.
> 
> ARM supports FDPIC, so this code is needed once again.
> 
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> ---
>  arch/Config.in           | 14 ++++++++++++++
>  package/uclibc/uclibc.mk |  8 ++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 1c0c400a98..c5d481b9e5 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -12,6 +12,9 @@ config BR2_SOFT_FLOAT
>  config BR2_USE_MMU
>  	bool
>  
> +config BR2_ARCH_HAS_FDPIC_SUPPORT
> +	bool
> +
>  choice
>  	prompt "Target Architecture"
>  	default BR2_i386
> @@ -418,6 +421,7 @@ endif
>  choice
>  	prompt "Target Binary Format"
>  	default BR2_BINFMT_ELF if BR2_USE_MMU
> +	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT

This default means that existing defconfigs for ARM noMMU, which
currently use FLAT binaries will "automatically" switch to FDPIC.

On another topic, I am wondering what happens with external toolchains?
For example at https://toolchains.bootlin.com/releases_armv7m.html we
have ARMv7-M toolchains that produce FLAT binaries. So probably it
means that the toolchain-external-bootlin package needs to be amended
to only offer the existing ARMv7-M toolchain when FLAT binaries are
selected.

I haven't really thought of all the implications, but to me it seems
like the case of external toolchains should be considered, to see what
is the impact of the FDPIC support.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
