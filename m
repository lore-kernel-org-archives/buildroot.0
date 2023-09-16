Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115ECCD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C020C40C2E;
	Sat, 16 Sep 2023 12:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C020C40C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HbOplPJSdLB; Sat, 16 Sep 2023 12:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17B3F40B25;
	Sat, 16 Sep 2023 12:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17B3F40B25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E59381BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF63281457
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF63281457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fEzNR78Vx_F for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:09:39 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D505081456
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D505081456
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 05F192003DE;
 Sat, 16 Sep 2023 14:09:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:09:33 +0200
Date: Sat, 16 Sep 2023 14:09:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230916120933.GX2571@scaer>
References: <20230916104040.315026-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916104040.315026-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694866177;
 bh=79En+keIuskkhWK6iadip0xqsuBsDm7kpIHW9i6jrTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KN6PaOIK3ITDATuLzAWTuzWpZrFOlXNSzjY6uGXCS11HHlhUOEftGDO6ulJ5AgXq8
 J0Yuse8joKIPO3tdOn56Cwtn9jXeocYf0RK2whY+kV+dSEXQQuyNRAlZZV3RSR/jku
 /71YlQe1rzzX+Y4IxDoRBkQvPieH7WONvb5z10jUBvQYUBAb2sfsbChpPyzD2wwTp8
 BOFYy4zArsGFM9zHugWVxNBPaLD3qn/u75DGnUHKOYjqcgvBieQwlYNO+paHzYgels
 EmUZ4vDNO9ByN+zmZJeq05TkVul2Ig7TfH2VFsdnu6BTdXIaCWPxhXF/OK/nbXtMJg
 LT4lSN6EZ1TxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KN6PaOIK
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: link with -latomic
 when needed
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

Fabrice, All,

On 2023-09-16 12:40 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since at least bump to version
> 0.15.04 in commit 00553ea186357fd3e2b3c89fa560e9711cc67472:
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/127ed4c110d99c6453a01ce221f628d40e566dc1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/stress-ng/stress-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
> index 0f204bcf79..a7b57459f1 100644
> --- a/package/stress-ng/stress-ng.mk
> +++ b/package/stress-ng/stress-ng.mk
> @@ -20,6 +20,10 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
>  STRESS_NG_DEPENDENCIES += keyutils
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +STRESS_NG_MAKE_FLAGS += LDFLAGS_EXTRA=-latomic
> +endif
> +
>  define STRESS_NG_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(STRESS_NG_MAKE_FLAGS)
>  endef
> -- 
> 2.40.1
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
