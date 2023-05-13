Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB388C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09AC42E6B;
	Sat, 13 May 2023 08:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09AC42E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWcINrCr8xhW; Sat, 13 May 2023 08:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9511742E65;
	Sat, 13 May 2023 08:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9511742E65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121211BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E665F60F65
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E665F60F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlTVL9r7m27a for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C83DF60F62
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C83DF60F62
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:13:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D3DDB19F738;
 Sat, 13 May 2023 10:12:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 10:12:57 +0200
Date: Sat, 13 May 2023 10:12:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230513081257.GB2582048@scaer>
References: <20230422090625.25006-1-ps.report@gmx.net>
 <20230422090625.25006-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422090625.25006-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683965581;
 bh=A6SuT/d1sYYMc8/nNZw/mSXXknIJ8d+LDGWlhsm0cY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNwSAxk9N8Tx1LCUqrEfRJLJeSxm9XzDHfeVm/0GRnFHJzCdwXh/Atc0HJtgrxFrq
 H0fg5WCVpdICa334ch+j3z74YJIq6XqgfDiH5teJEJS1bP6nimea4HavxYUjG/0dyK
 pq5mvnly8T0n2pTOFHbeWi79ZgYxMncjoIYK6Ki9MaFVV2eD2FxDD8gUacOv/vL2aK
 ImpKmtIAsoIuZsu0vXfWVP90aBMwkSAF/yA3vQh6HtDcDJ83SiGhZXk5FZZdPlqT3r
 pC8NPZ2PSILAcbxUnilHLb15JMpxH47Fpr1iV+WaLZVvYpp5NniviVsoXyXh7G63t9
 /yBkcH3pmnnNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bNwSAxk9
Subject: Re: [Buildroot] [PATCH v1 2/3] package/qemu: bump version to 7.2.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-04-22 11:06 +0200, Peter Seiderer spake thusly:
> - remove 0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
>   (from upstream, see [1])
> 
> [1] https://gitlab.com/qemu-project/qemu/-/commit/e34f86a2f91c39d610d58baa6f4c9ed9a5a5d791
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...k-restore-of-env-flags-from-tb-flags.patch | 36 -------------------
>  package/qemu/qemu.hash                        |  2 +-
>  package/qemu/qemu.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
> 
> diff --git a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch b/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
> deleted file mode 100644
> index 8dc2dd8823..0000000000
> --- a/package/qemu/0003-target-sh4-Mask-restore-of-env-flags-from-tb-flags.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From bc2331635ce18ff068d2bb1e493bc546e1f786e1 Mon Sep 17 00:00:00 2001
> -From: Guenter Roeck <linux@roeck-us.net>
> -Date: Mon, 12 Dec 2022 09:03:17 -0600
> -Subject: [PATCH] target/sh4: Mask restore of env->flags from tb->flags
> -
> -The values in env->flags are a subset of tb->flags.
> -Restore only the bits that belong.
> -
> -Cc: qemu-stable@nongnu.org
> -Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
> -Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> -Message-ID: <20221212011345.GA2235238@roeck-us.net>
> -[rth: Reduce to only the the superh_cpu_synchronize_from_tb change]
> -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> -[yann.morin.1998@free.fr: backport from upstream]
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ----
> - target/sh4/cpu.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> -index 951eb6b9c8..f0934b20fa 100644
> ---- a/target/sh4/cpu.c
> -+++ b/target/sh4/cpu.c
> -@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
> -     SuperHCPU *cpu = SUPERH_CPU(cs);
> - 
> -     cpu->env.pc = tb_pc(tb);
> --    cpu->env.flags = tb->flags;
> -+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
> - }
> - 
> - static void superh_restore_state_to_opc(CPUState *cs,
> --- 
> -2.25.1
> -
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index e671e1d184..93f7c98f1c 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157  qemu-7.2.0.tar.xz
> +sha256  8c85699acf9d7a43a5fe29a64cdd56370b0c2d1ad074baf7098a824d17aad73b  qemu-7.2.1.tar.xz
>  sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 3f51cb572b..12d52f61bf 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, check whether the list of supported targets
>  # needs to be updated.
> -QEMU_VERSION = 7.2.0
> +QEMU_VERSION = 7.2.1
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = https://download.qemu.org
>  QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
