Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B319C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B8160B31;
	Sat, 18 Dec 2021 22:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1ZrFIcfMnJl; Sat, 18 Dec 2021 22:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB2C60B2D;
	Sat, 18 Dec 2021 22:28:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 931751BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90EAB41DA4
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1H8Mz9ymt9SB for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:28:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 880A4401D2
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:28:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D2EBC5FF23;
 Sat, 18 Dec 2021 23:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639866523;
 bh=Gqn9UsQdjV2HgpZoWbraw7/7/21oiXY1c3j3YFBaxEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AtwQoWJHJRnZTrM7iGVGftpgoAtBNRwbUwUv4eFYjNn0wzrQ5126es4PpJeXIfuFW
 WviqRffEaGlMVPtaMvz8IlUR591ABWxctL4HWMFPotQJ7mMv4meZ2TU5s6KjQxS9Bq
 YBH6LcWkx4/sjmZhBzszZqIMhXWsKKKBKvrJ1/tgj7/+X3NP5jKcnKPNEr9sLYUbY1
 j8LVwvvHOsFEUnVQ6T5vDq7p/C6v7x+YmoOGmg1Bw4pUd72plLgOIYkDW3XfjF1EUg
 Ijz+O+fJN0bGL7AjRvngh9kVXC0+YHy18s+SCZR2WObj+LrmoRfZtgbTmTJ+yGQX+b
 iIO6fNwS/VZsw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 23:28:38 +0100
Date: Sat, 18 Dec 2021 23:28:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218222838.GW2603@scaer>
References: <20211217191442.30637-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217191442.30637-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: drop first patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-17 20:14 +0100, Fabrice Fontaine spake thusly:
> Drop first patch which is already included in guile since version 2.0.1:
> https://git.savannah.gnu.org/cgit/guile.git/commit/?id=ffd3e55cfd12a3559621e3130d613d319243512d

I was wondering why there was no autobuilder reference. The patch still
applied, albeit with fuzz 2, thus duplicating the code.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ch => 0001-calculate-csqrt_manually.patch} |  0
>  package/guile/0001-fix_arm_endianness.patch   | 25 -------------------
>  ...efile.am-fix-build-without-makeinfo.patch} |  0
>  ...tem-base-target.scm-support-riscv32.patch} |  0
>  4 files changed, 25 deletions(-)
>  rename package/guile/{0002-calculate-csqrt_manually.patch => 0001-calculate-csqrt_manually.patch} (100%)
>  delete mode 100644 package/guile/0001-fix_arm_endianness.patch
>  rename package/guile/{0003-Makefile.am-fix-build-without-makeinfo.patch => 0002-Makefile.am-fix-build-without-makeinfo.patch} (100%)
>  rename package/guile/{0004-module-system-base-target.scm-support-riscv32.patch => 0003-module-system-base-target.scm-support-riscv32.patch} (100%)
> 
> diff --git a/package/guile/0002-calculate-csqrt_manually.patch b/package/guile/0001-calculate-csqrt_manually.patch
> similarity index 100%
> rename from package/guile/0002-calculate-csqrt_manually.patch
> rename to package/guile/0001-calculate-csqrt_manually.patch
> diff --git a/package/guile/0001-fix_arm_endianness.patch b/package/guile/0001-fix_arm_endianness.patch
> deleted file mode 100644
> index 67c0b606ee..0000000000
> --- a/package/guile/0001-fix_arm_endianness.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Fix support for ARM endianness, otherwise it gives the error
> -"unknown CPU endianness"
> -
> -Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> -
> -diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
> ---- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
> -+++ guile-2.0.11/module/system/base/target.scm	2014-11-03 23:05:01.789338997 +0100
> -@@ -70,7 +70,15 @@
> -             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
> -                            "mips" "mips64"))
> -              (endianness big))
> --            ((string-match "^arm.*el" cpu)
> -+            ((string-match "^arm.*el" cpu)
> -+             (endianness little))
> -+            ((string-match "^arm.*eb" cpu)
> -+             (endianness big))
> -+            ((string-prefix? "arm" cpu)          ;ARMs are LE by default
> -+             (endianness little))
> -+            ((string-match "^aarch64.*be" cpu)
> -+             (endianness big))
> -+            ((string=? "aarch64" cpu)
> -              (endianness little))
> -             (else
> -              (error "unknown CPU endianness" cpu)))))
> diff --git a/package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
> similarity index 100%
> rename from package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch
> rename to package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
> diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0003-module-system-base-target.scm-support-riscv32.patch
> similarity index 100%
> rename from package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> rename to package/guile/0003-module-system-base-target.scm-support-riscv32.patch
> -- 
> 2.33.0
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
