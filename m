Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F164C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBFD60F9F;
	Sun, 15 May 2022 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2v4AkiX_AMp8; Sun, 15 May 2022 19:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728A760ACB;
	Sun, 15 May 2022 19:32:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527A11BF3A0
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C53C60ACB
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9eugh1ciQex for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 19:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49C7F60A78
 for <buildroot@buildroot.org>; Sun, 15 May 2022 19:32:43 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f18e6ff0f6so2996988fac.11
 for <buildroot@buildroot.org>; Sun, 15 May 2022 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vx0C+M3Ppsh7J1fOViaBhSMoc1EDlHuvXDFwftzp9qQ=;
 b=CD/8vTKXqfYpOtcE+rq5XKdetcmEx9fBh6OpYNbmSx2N9BT0ckGFdttOB2m8zCyHzV
 xULIkU2c9iMHPOn4HZcZ/lBLjE9rugSoX4j+jqjpHOGUiALg0IQ9eskP18aeyGMiFRA7
 Sqzvhm1b5VZWcLOHTa09dW2xN2dGM4Uye9kflHkamxw+lfJzHM0TdIIHhH3PmmwYBSbt
 0SQQdpFGicfnnKH3YxfhEXc+lgoRVg8IFj4WVHS7vXr4bQP0GnQTSiVcD1vLpgMfaU3W
 ov9pd9i11anZv6Xo5CfIKiLlqVXBWc2LW3I6Ob8LdkGb1E2gJF/+FXGa1RkrqtS4aiW6
 BSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vx0C+M3Ppsh7J1fOViaBhSMoc1EDlHuvXDFwftzp9qQ=;
 b=CEM1QIbkTI80+a40cIZdThcjeHepJCmwQaf4qbcTyvRPHoro8gyDrxKNcFJ1WAa8f/
 zfQLSLevDZVeIsqGvrThuAxlqyHXnoxhwtLjnku/czfsVFCaeyGXsKUyZfH7NGF4fCUO
 JH/p89wYD6y4J1TXEvgkMGz5NGrol812wIn/Eg72Te4GFmb/b5AOnmIxIw3XlWD1JlSM
 64gdLByRyrLiyXW8j4RYF5rC3q9an2hR5y7GTSQWtH+AANRi4UWq4vrpLn9+OEsNcUb/
 zRDpUTuOA4q1AC8xD0pcKnGvffy3INRuMvDmmHfsTzCplv1F4XSxw9/qQJgeOhL4hpjK
 FscQ==
X-Gm-Message-State: AOAM533OHgd+0/bu083rm4fsEgtFZfbCH8D6gbQZtExsoKCJmCVIlGkS
 kcfQ4Ea61cx5CIZWkG3si+28QP5BvLGOdQMJ55Y=
X-Google-Smtp-Source: ABdhPJxXpqCYmhiHD5rEcA/CVGGBO1Nii0Q2trA+jConA+X+cKodYVTXJd6FJWjk5tY7vJs3G4KE5PCfQtu1RWPG/GQ=
X-Received: by 2002:a05:6870:fb8e:b0:f1:8e9b:f3d9 with SMTP id
 kv14-20020a056870fb8e00b000f18e9bf3d9mr2277387oab.99.1652643162236; Sun, 15
 May 2022 12:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220515110341.173923-1-romain.naour@gmail.com>
In-Reply-To: <20220515110341.173923-1-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 May 2022 13:32:31 -0600
Message-ID: <CADvTj4rsObRzgSQZcK9FJ7nyTg1DCCFfiaOQ21e7-S9227px1g@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-buildroot: error if no
 libc available
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 15, 2022 at 5:04 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Each libc available in Buildroot to build an internal toolchain have
> dependencies (architecture, static build only, mmu only etc...).
>
> For examples, uClibc-ng is the only toolchain that support static only
> builds. But since uClibc-ng doesn't support all architecture available
> in Buildroot (nios2, riscv), we must prevent selecting static only
> configuration (BR2_STATIC_LIBS) on such architectures.
>
> For such broken configuration, we can start building a toolchain by
> building host-binutils and host-gcc-final without building
> host-gcc-initial, linux-headers and uclibc package.
>
> The build fail during host-gcc-final build with the following error:
>
> In file included from ../../../libgcc/libgcc2.c:27:
> ../../../libgcc/../gcc/tsystem.h:87:10: fatal error: stdio.h: No such file or directory
>    87 | #include <stdio.h>
>       |          ^~~~~~~~~
> compilation terminated.
>
> We can't add an uClibc-ng dependency on BR2_STATIC_LIBS option since
> it's also used for external toolchain backend.
> Instead add a check if BR2_TOOLCHAIN_BUILDROOT_LIBC is not empty

I think something like this is probably better:
https://patchwork.ozlabs.org/project/buildroot/patch/20220506054651.2853406-1-james.hilliard1@gmail.com/

>
> While at it, add a Kconfig comment for the user.
>
> Fixes:
> http://autobuild.buildroot.net/results/42965d286285d5d6cfbb39f6195c87fa05dd3283/
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  toolchain/toolchain-buildroot/Config.in              | 3 +++
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 8d9cf4cc68..a97b17acb8 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -107,6 +107,9 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>         default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>         default "musl"   if BR2_TOOLCHAIN_BUILDROOT_MUSL
>
> +comment "No libc available for this target! Please check your configuration"
> +       depends on !BR2_TOOLCHAIN_BUILDROOT_LIBC
> +
>  source "package/linux-headers/Config.in.host"
>  source "package/linux-headers/Config.in"
>  source "package/musl/Config.in"
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> index b30cc332d2..7688d44615 100644
> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -6,6 +6,10 @@
>
>  BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT):$(BR_LIBC),y:)
> +$(error "No libc available for this target! Please check your configuration.")
> +endif
> +
>  # Triggering the build of the host-gcc-final will automatically do the
>  # build of binutils, uClibc, kernel headers and all the intermediate
>  # gcc steps.
> --
> 2.35.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
