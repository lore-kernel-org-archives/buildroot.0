Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5E6CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF832419D5;
	Fri, 15 Sep 2023 21:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF832419D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfSw6tpEAClT; Fri, 15 Sep 2023 21:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F27C740482;
	Fri, 15 Sep 2023 21:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27C740482
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB22F1BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9452540482
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9452540482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzK4V6dmrNHy for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:39:22 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C902402A8
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C902402A8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8B3EB2003C1;
 Fri, 15 Sep 2023 23:39:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:39:17 +0200
Date: Fri, 15 Sep 2023 23:39:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230915213917.GN2571@scaer>
References: <20230914215606.309735-1-fontaine.fabrice@gmail.com>
 <80eccb888c17302f362990c956de8529@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80eccb888c17302f362990c956de8529@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813960;
 bh=ZdieGBD9TXnoA/UFpuTZZFuJx4oplbOS9fgCx+Ch72c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qf71FyPfArITFC7zWjNBuV6XmvgsSm9hnPyPOVDP5UxpQ9EBURnqLbK6hFcQdemys
 59SqcxFzZO4rcGzGfaiYwm7d1hy7h4o25jPw5x5wBaLPF9XU/mbaUJrjQ8xfyW6wu6
 6V9gGLIRdBRWrHulLUFz5a5dEks+PKL94dMpRuL9zyxkrtDn20Tf9d8ISJdD/WSVWN
 i/i8LXX8IUWCPthqcLsAJgspAhPaNwxlk/pEC1oDtWpxAssgU2XsrwnH1kATo6P6yA
 4TyLM4zDZag0Yl0qgZXZ6zi6wPs4diCfshQuHjQu5LGfxTmYe7qiUrHo0sA0xkofyV
 RtAmmlozLcxrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qf71FyPf
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.8.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-09-15 21:30 +0200, Julien Olivain spake thusly:
> Hi Fabrice,
> 
> I tested this patch on branch master at commit 3557a7b
> with commands:
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_libjxl
>     ...
>     OK
> 
> While trying with:
> 
>     utils/test-pkg -a -p libjxl
>     ...
>         bootlin-riscv32-glibc [17/45]: FAILED
>         bootlin-riscv64-glibc [18/45]: FAILED
>          bootlin-riscv64-musl [19/45]: FAILED
>     ...
>     45 builds, 11 skipped, 3 build failed, 0 legal-info failed, 0 show-info
> failed
> 
> I had those 3 build failures. They were introduced by v0.8.1 and are
> unrelated to this patch. I proposed a fix at:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230915192308.1432032-1-ju.o@free.fr/
> 
> and also made sure this fix works for both v0.8.1 and v0.8.2 proposed in
> this patch.

Thank you! I applied your patch already!

Regards,
Yann E. MORIN.

> On 14/09/2023 23:56, Fabrice Fontaine wrote:
> >Fix CVE-2023-35790: An issue was discovered in dec_patch_dictionary.cc
> >in libjxl before 0.8.2. An integer underflow in patch decoding can lead
> >to a denial of service, such as an infinite loop.
> >
> >https://github.com/libjxl/libjxl/releases/tag/v0.8.2
> >
> >Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Reviewed-by: Julien Olivain <ju.o@free.fr>
> Tested-by: Julien Olivain <ju.o@free.fr>
> 
> >---
> > package/libjxl/libjxl.hash | 2 +-
> > package/libjxl/libjxl.mk   | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
> >index 6b4c9d8d0a..c8f98d10ea 100644
> >--- a/package/libjxl/libjxl.hash
> >+++ b/package/libjxl/libjxl.hash
> >@@ -1,4 +1,4 @@
> > # Locally computed:
> >-sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56
> >libjxl-0.8.1.tar.gz
> >+sha256  c70916fb3ed43784eb840f82f05d390053a558e2da106e40863919238fa7b420
> >libjxl-0.8.2.tar.gz
> > sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede
> >LICENSE
> > sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575
> >PATENTS
> >diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> >index f603327bf6..47c110eb53 100644
> >--- a/package/libjxl/libjxl.mk
> >+++ b/package/libjxl/libjxl.mk
> >@@ -4,7 +4,7 @@
> > #
> >################################################################################
> >
> >-LIBJXL_VERSION = 0.8.1
> >+LIBJXL_VERSION = 0.8.2
> > LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
> > LIBJXL_LICENSE = BSD-3-Clause
> > LIBJXL_LICENSE_FILES = LICENSE PATENTS
> 
> Best regards,
> 
> Julien.
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
