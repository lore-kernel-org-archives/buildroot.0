Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B0C46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 20:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81560404D3;
	Sat,  7 Jan 2023 20:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81560404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q54LsEqiANqy; Sat,  7 Jan 2023 20:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F4C40142;
	Sat,  7 Jan 2023 20:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F4C40142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46A781BF5AE
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 20:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB198201B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 20:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EB198201B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59D5T_0vVmq1 for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 20:15:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B94BE81E8E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B94BE81E8E
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 20:15:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6635:e839:5c45:c60e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3A0005FF27;
 Sat,  7 Jan 2023 21:15:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Jan 2023 21:15:26 +0100
Date: Sat, 7 Jan 2023 21:15:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nevo Hed <nhed+buildroot@starry.com>
Message-ID: <20230107201526.GA151997@scaer>
References: <20230105015759.63582-1-nhed+buildroot@starry.com>
 <20230105015759.63582-2-nhed+buildroot@starry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105015759.63582-2-nhed+buildroot@starry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673122530;
 bh=k5rnqgPjaEz263vDxg4EA3KEodZX1bnAHO45r1Mqzcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+Zj2l4tlyujiULbqLyjTgQP9hA5IW2SSuUOWf0f1d1AZ2ZCnkknpejcWcqgNEo5W
 5LYFM+qqSoraPI5bgv0gOcKT3LQjzf5hAAoTdR/qFZAUxD1g8lClKD7n1uu+TGy1Rd
 50NK+Ru4q1SiQ6Qc4TkDiL8Tjzk8YIl6w33CuSdHylQUycTspA4rGfUvGcACKOu7IY
 BaHFSnTY3Kiwv59uSFtLCbt6zqym4UVRIyE1q5nGXAotJCdmpPYfkQcHAjwbtSNRKo
 Bdd3/SISSONkf3KuDV62rKK/8WhFd3c1RduSDfFp1+KZEgV7JaugFWD19zTlkdz8oD
 Lb5INaYjz8tsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R+Zj2l4t
Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig seems to
 impact performance
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nevo, All,

On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:
> Noticed a significant slowdown with rise of number of external trees
> in our env.  This slowdown seemed to be related to invocations if the
> percent_defconfig function (GNU Make 4.3).
> 
> While I have not do a deep dive in analyzing the performance issue, it
> felt like redefining the %_defconfig rule N times impact performance.
> 
> This patch makes %_defconfig a single rule which combines uses the
> first return of a wildcard expression.
> 
> Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external
> trees:
> 
>     #Trees    Before    After
>          1      0.38     0.37
>          2      0.32     0.31
>          3      0.31     0.33
>          4      0.36     0.32
>          5      0.45     0.35
>          6      1.26     0.36
>          7      9.10     0.36
>          8     85.93     0.42
> 
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>

Thanks for the respin, I like it better than your first iteration, and
most importantly, better than my own implementation!

I however used most of my commit log, a=exteneded it even further,
provided my reproducibility script in the commit log and redid the
timings up to 1000 trees (heck, it's manageable now, so why not!).

I also slightly reformatted the code, to split the long lines.

Finally, I also added David as the reporter, and that his bug #14996
is now fixed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88f90cd2fa..ad866f1f24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1013,13 +1013,14 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
> -define percent_defconfig
> -# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
> -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
> -	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
> -		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
> -endef
> -$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
> +	@defconfig=$(or \
> +		$(firstword $(foreach d, \
> +			$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/configs/$@))), \
> +		$(error "Can't find $@") \
> +	); \
> +	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
> +		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
>  
>  update-defconfig: savedefconfig
>  
> -- 
> 2.38.1
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
