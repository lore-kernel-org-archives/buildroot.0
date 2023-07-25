Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B754C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7D26110E;
	Tue, 25 Jul 2023 19:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7D26110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0AG699Rc621; Tue, 25 Jul 2023 19:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD9061105;
	Tue, 25 Jul 2023 19:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD9061105
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1BE51BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 839F5418B4
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839F5418B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yWQh-r-GAw3 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:42:49 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F37DF4186A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37DF4186A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 213757802D7;
 Tue, 25 Jul 2023 21:42:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:42:43 +0200
Date: Tue, 25 Jul 2023 21:42:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230725194243.GJ3544423@scaer>
References: <20230725185004.3276758-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725185004.3276758-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690314166;
 bh=G/p8t3aD7JsaNRf/JDir096klysIVZ+OtE72YQQxZxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QocRCxE+8oEfvO0wseGwm+9FUKp6u4juWyT76bXjVPrCEkWnzycJflB5O9HYCZ/Xg
 F5TCL5Gikjl+kmlUtW81jKGoKb4fE+5NktK85XStWi1GNmabEh/vmODMbBkEjeXXkt
 PUu5poY86++RzaDzzlwl/0Pp96Axw69cvAaAiLUazbrudFzVfN2/7+BzjrkceLoV44
 o5W4TIHZOInvmGYtXNEB9Tyx207Aovue56+t+oWAQS3XQh51dl5kdBGwBy/Vo+uqgP
 RlKEhDttug3SByw1RZV3/270/32PimmFRhSopLxU+nlowbS7NnJkMat3FAGa6hzPc4
 ME66Wz3DHcVsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QocRCxE+
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: fix configure
 option for libatomic
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

Bernd, All,

On 2023-07-25 20:50 +0200, Bernd Kuhls spake thusly:
> Without this patch openssl adds -latomic twice to Libs.private in
> libcrypto.pc:
> 
> cat output/per-package/opensc/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/libcrypto.pc | grep atomic
> Libs.private: -ldl -pthread -latomic -latomic

This is not fixing an actual build failure, but is really just a cleanup
fix, right?

> Instead of passing -latomic to Configure we use the target arch
> "linux-latomic" which is provided by upstream since version 3.0.0
> especially for libatomic handling:
> https://github.com/openssl/openssl/commit/535130c39d33df41b6a7d14302a93ffaa10ebc46
> https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737225f1aaafd0f1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Build-tested using this defconfig
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBOPENSSL_BIN=y
>                    bootlin-armv7m-uclibc [ 6/45]: FAILED
>                 bootlin-m68k-5208-uclibc [ 8/45]: FAILED
> Reported the two unrelated build errors:
> https://bugs.busybox.net/show_bug.cgi?id=15709

Those two are not a regression, they already failed to build before this
patch, but the phrasing was a bit ambiguoug, so I had to check...

If you can confirm that this is just a cleanup fix, then no need to
respin, I'll amend the comit log when applying.

Regards,
Yann E. MORIN.

> 
>  package/libopenssl/Config.in     | 1 +
>  package/libopenssl/libopenssl.mk | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index 26c8f4c085..fdfa135f52 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
>  	# linux-generic{32,64}, see
>  	# https://github.com/openssl/openssl/issues/9839
>  	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64 && !BR2_MIPS_NABI32
> +	default "linux-latomic no-asm"		if BR2_TOOLCHAIN_HAS_LIBATOMIC
>  	default "linux-generic32 no-asm"
>  
>  config BR2_PACKAGE_LIBOPENSSL_BIN
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 06eac8f3d9..41626d20e1 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -73,7 +73,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			$(LIBOPENSSL_TARGET_ARCH) \
>  			--prefix=/usr \
>  			--openssldir=/etc/ssl \
> -			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
>  			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
>  			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
>  			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
> -- 
> 2.39.2
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
