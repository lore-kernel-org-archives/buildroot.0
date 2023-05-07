Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F920C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B73CE404F4;
	Sun,  7 May 2023 13:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B73CE404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtNVq1jwAJzL; Sun,  7 May 2023 13:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F219A40192;
	Sun,  7 May 2023 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F219A40192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD7571BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADDA18223A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADDA18223A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-aR1weKm2um for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57EE82239
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C57EE82239
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:22:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BBF0719F734;
 Sun,  7 May 2023 15:22:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 15:22:12 +0200
Date: Sun, 7 May 2023 15:22:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20230507132212.GV252090@scaer>
References: <20230418191923.1113413-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418191923.1113413-1-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683465736;
 bh=otQLpOu894b2L078AqCXa37Zonvnl33ptJHJ+bVutq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gocNfckw5cz/4JWvUWAAVrCMN2wpvJdPlCOvLT0TegzDf+PxwzvOqxmVvxVE1TcVv
 voOzMhS0MWr5xrGycQJANIVl8UckHd4WeycQqdC2VDKA/kLj9iA+j3lonURa1heeJb
 JDLcQcXQHDxlachKFVL5zU/zLxTfM20oCAV2i3RBL5MzJ1KjeB72ZMBUOdGSIZfevP
 iO/cW8CuGu2WK2UF7lvnf7JcH5R3WFlT+yp5HqCYwa/PhUrIFzZveNknptM0SFuW6R
 MVyeCfwAmjirFz5vyQGtamW3yQJupoZrW4nphEqDq2kFAg6FQgSPfnYfSpJiMmg7yw
 tkP46fB5dE7YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gocNfckw
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: add support for riscv
 architecture
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sergey, All,

On 2023-04-18 22:19 +0300, Sergey Matyukevich spake thusly:
> Package binaries can be successfully built for and then executed on
> RISC-V platforms including RV32 and RV64 variants. Tested in QEMU.

I was wondering why we needed to add something to cmake for riscv
support, since we've been building a lot of riscv for quite some while
now, so this was a bit confusing...

But it turns out that this is just about ctest, the only thing from
cmake that we build for the target.

I've very slightly tweaked the commit title to reflect that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/cmake/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 3c47fdcb49..4ef5612b57 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
>  		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
>  		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
>  		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
> -		BR2_s390x
> +		BR2_s390x     || BR2_riscv
>  
>  config BR2_PACKAGE_CMAKE
>  	bool
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
