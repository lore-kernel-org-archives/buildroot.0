Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A556DEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4891841930;
	Tue, 25 Jul 2023 21:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4891841930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1U7VKR8d5lu; Tue, 25 Jul 2023 21:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F3441928;
	Tue, 25 Jul 2023 21:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F3441928
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06B5C1BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF0641921
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF0641921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLo12FnWu-3M for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:04:48 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C15841911
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C15841911
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E06497802FE;
 Tue, 25 Jul 2023 23:04:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:04:38 +0200
Date: Tue, 25 Jul 2023 23:04:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20230725210438.GS3544423@scaer>
References: <20230725004322.3150281-1-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725004322.3150281-1-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319086;
 bh=G8h/GgYEX1FWehBq8lXq41CqEgq9/lvm8qzEvR+BKPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=moGbFvMbkzkVO1vfJXGhRd2CxO3t+98j0OIShkl6CuxH3WXKsmvg7yLqYBa7WxyWy
 mdxb5buvShFe6WnYEEtf09Nxsz6yAMdUfrG5i7HbrCBOTtYQP95Xq6kJtniDI2iD79
 JtaFJo/Q2v0vxjSoZad7mFX/QuP7Z+/HI/fnKufc1CKVn4Gsab8CFlg2YakPZoevYM
 cTxTLn+wRGQZXzvrjkoaCM+CMaE0xjH+nGEpJO8Lq8AZqV3hXhAQ/JXR56Nkg+Qd13
 zEBqiJ2xSc/nKPrwsxE4qyKb7Z0XbgJxN9+1Ycbi6SrEtQFsrTU86L3syWKK1u5i/q
 BsPx8wmN2qU1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=moGbFvMb
Subject: Re: [Buildroot] [PATCH] toolchain/helper: check_fortran: silence
 error message
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
Cc: Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2023-07-24 17:43 -0700, Markus Mayer via buildroot spake thusly:
> check_fortran will display an error message if there is no Fortran
> compiler in the toolchain. In the past, running into this error message
> would be unlikely, since the Fortran test was only execuded when
> BR2_TOOLCHAIN_HAS_FORTRAN was set.
> 
> However, since commit c7f641cbaae9 (toolchain/toolchain-external: always
> call checks with dependencies), the Fortran check is unconditional. The
> error itself benign, and the macro will handle the situation correctly,
> since that is what it is designed to do. However, the error message
> looks ugly and can be confusing.
> 
> [...]
> >>> toolchain-external-custom  Extracting
> >>> toolchain-external-custom  Patching
> >>> toolchain-external-custom  Configuring
> /bin/bash: line 1: .../bin/aarch64-linux-gfortran: No such file or directory
> >>> toolchain-external-custom  Building
> ... everything continues normally ...
> 
> Let's suppress the error message, since triggerig the error is an
> integral part of how the test works and doesn't mean that anything is
> wrong.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 86a90c0a834d..8e5d6a1f6b3e 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -394,7 +394,7 @@ check_fortran = \
>  	__CROSS_FC=$(strip $1) ; \
>  	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
>  	__HAS_FORTRAN=`printf 'program hello\n\tprint *, "Hello Fortran!\\\n"\nend program hello\n' | \
> -		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - && echo y`; \
> +		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - 2>/dev/null && echo y`; \
>  	rm -f $${__o}* ; \
>  	if [ "$${__HAS_FORTRAN}" != "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = y ] ; then \
>  		echo "Fortran support is selected but is not available in external toolchain" ; \
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
