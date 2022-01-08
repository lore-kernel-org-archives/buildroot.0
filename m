Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32727C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 00:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C034A832FF;
	Sat,  8 Jan 2022 00:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ciqb7szdfqdC; Sat,  8 Jan 2022 00:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335168329E;
	Sat,  8 Jan 2022 00:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2B71C1189
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 00:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1292E60B2E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 00:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1DVEqsNX9RC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 00:23:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B1AB607A1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 00:23:42 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id t8so5861271ilf.12
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 16:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhVuC4aMUkUSb3KyX9391OGItk1UNELX28EKnG7RrNQ=;
 b=p4VuLli/34WM8o6jrO9MlV4XKNnf7x+LhbY1x3+r1I1FhTTb8nxMIScJDlRaS1cyyk
 GDrb16ih0eAwr9o9Qtoaj1nRIRZJbFFn4dyChPJv55EvXTCCVz0rUPbe88jwL48ZwBET
 6IssK4LeG6Nvm7U4OYcnvJuS97lnFigzwfYnvuP9GkEadDKsSXwaX6flIj4scJhGnKjb
 k6nHpRwHgIhZqOie890FlW5SNeSUcIZKY6ttVNAP7orXSoh/eD40AZE0Rb7eIFe+w66K
 4B7HEoM7Q9MBuKgwCrMwoLwxnQxKCw8ZWdrpabB5UE3WdsU1CJxm1U+gLPJs8+98dT7W
 yEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhVuC4aMUkUSb3KyX9391OGItk1UNELX28EKnG7RrNQ=;
 b=zNhpIpqxQe+/81L3KNiCI/jizWeMPHs53AWMc9ZElRK/xSY8Aydb9vdRStZysGU8Oz
 WHPC+tdkTJKWj2ZZd/G/ZgogW1N5z+dhhDR9okpffrPOXvLWzvH0Q2lYyv9a6dXsWgP2
 bksEkYuIz2Og+Gbi8ffG2o7opQVx56lHOuB2wtgEGH3KfRP+3m9gN7nnsSv69KLCUWmF
 USH5y+1LC3qXFuQvpXPAPrD0L+1PgjShqZymY7bRqBLd8K/9DYHtJn2mYfo5nXxWCLZx
 1QH8ZSNPEfZ5AB4UaD6h7lu6ri0IQqA6EmyIUcRQoUgXsH8Qvzo9GKzxjr1Y7uvcxD8w
 zc9Q==
X-Gm-Message-State: AOAM532Je9vamccRXT9qrQ5IbXwQSHoGr/SyG/iW6OLC3ZDxrh7240va
 wxiAT8/fSn0003zl54jIMh4hMSa4kzpg0RqHuzgrwIZQG9mzWgGZ
X-Google-Smtp-Source: ABdhPJz6RlaNh45clegmqKrWhrtAo6XSuASbsOhr0xHBot9Yb7qrP1PrYDuk/OruxqDEhHk2SKgKN8tS9dPvulCn898=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr29723158ilu.290.1641601421343; 
 Fri, 07 Jan 2022 16:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
 <20220107171318.1423075-5-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220107171318.1423075-5-thomas.petazzoni@bootlin.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 8 Jan 2022 10:23:15 +1000
Message-ID: <CAKmqyKPKHCyDCS1K4jB66+Q8Wv=OZmsT3JCyS=OcV37JGQigCg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 4/7] package/rustc: fix the riscv64gc
 architecture handling
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 8, 2022 at 3:14 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> riscv64gc was made available for BR2_riscv, but RISC-V can be 32-bit
> or 64-bit, so we need to restrict it to BR2_RISCV_64. There's no need
> to keep the BR2_riscv dependency, as BR2_RISCV_64 can only be true
> when BR2_riscv is true.
>
> Also, BR2_PACKAGE_HOST_RUSTC_ARCH needs to be set to riscv64gc to
> allow rust-bin to download its pre-compiled standard library
> correctly.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/rustc/Config.in.host | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 05324ad755..8c8b75c0a2 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -49,7 +49,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>         default y if BR2_powerpc64le && BR2_TOOLCHAIN_USES_GLIBC
>         # riscv64gc-unknown-linux-gnu
>         # "g" stands for imafd, and we also need "c".
> -       default y if BR2_riscv && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
> +       default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
>                         BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
>                         BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
>                         BR2_TOOLCHAIN_USES_GLIBC
> @@ -104,6 +104,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH
>         string
>         default "armv5te" if BR2_ARM_CPU_ARMV5
>         default "armv7"  if BR2_ARM_CPU_ARMV7A
> +       default "riscv64gc" if BR2_RISCV_64
>         default BR2_ARCH if !BR2_ARM_CPU_ARMV7A
>
>  config BR2_PACKAGE_HOST_RUSTC_ABI
> --
> 2.33.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
