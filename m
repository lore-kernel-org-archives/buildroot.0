Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD20C04A94
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879EE41D89;
	Wed,  2 Aug 2023 19:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879EE41D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VUhyWUzs77K; Wed,  2 Aug 2023 19:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1E841DCA;
	Wed,  2 Aug 2023 19:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1E841DCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BA91BF2F5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F35BB41D73
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35BB41D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-h-IoRUz71k for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:26:02 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E30A941DA7
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30A941DA7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:79c1:a9ed:b3cf:6f2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1A6ED2003B4;
 Wed,  2 Aug 2023 21:25:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 21:25:56 +0200
Date: Wed, 2 Aug 2023 21:25:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230802192556.GH421096@scaer>
References: <20230802164628.389812-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802164628.389812-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691004359;
 bh=FVLfb4DHPt3EJyZII1k35ZtzBqmv+aGJfDT+Di6Da50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Af7s4MEKmig7fXtaT+Ok7d8zr/dOSUqMq5Na/JI+d7PFqbQdpfsOctZNNFRzf4WCv
 63Jkm8rYbH122r5aLmrrYi949MM/WysHQn1jE1VzDQc5/aL8EPcZ0aDiCM6xtoIZM+
 yuylgKVguTiZDY9oukx6jexD17xXoicdeb+bwnHNZYmwIgQzzWeAuRfMf7pOmUB/xH
 CoGXu1BWqV7ilHZNP1nk6GNdAGU63IDZm2GaDFjyT+oumhMUrBjZHkAENKYpoiU3Pb
 Oc32fEH0wk6/n9E34tXd2TwnbUzdW9ms06cWpLT3cN3cQMfYT0vWk12cTjVNlRrC9F
 lSH7JNb/yFFew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Af7s4MEK
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestLxc switch to the
 Arm Bootlin toolchain
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

Romain, All,

On 2023-08-02 18:46 +0200, Romain Naour spake thusly:
> TestLxc uses systemd as init but the recent update to systemd v254
> requires a toolchain w/ linux headers >= 4.14 to provide
> LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).
> 
> Since no other toolchain that the Bootlin one is available
> switch to it.
> (ARM Arm toolchain requires BR2_ARM_CPU_HAS_NEON enabled)
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
> [2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561390
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_lxc.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
> index f66b31f3ba..5be4782e2d 100644
> --- a/support/testing/tests/package/test_lxc.py
> +++ b/support/testing/tests/package/test_lxc.py
> @@ -10,6 +10,7 @@ class TestLxc(infra.basetest.BRTest):
>              BR2_cortex_a9=y
>              BR2_ARM_ENABLE_VFP=y
>              BR2_TOOLCHAIN_EXTERNAL=y
> +            BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>              BR2_LINUX_KERNEL=y
>              BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>              BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
> -- 
> 2.41.0
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
