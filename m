Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41CCC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D5FD61124;
	Tue, 25 Jul 2023 20:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5FD61124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoOihKWdSMYl; Tue, 25 Jul 2023 20:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C36861135;
	Tue, 25 Jul 2023 20:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C36861135
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 405CE1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A07940447
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A07940447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7Ytbgdy4qeb for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:49:00 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD0234014B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD0234014B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E7A6F78035D;
 Tue, 25 Jul 2023 22:48:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 22:48:54 +0200
Date: Tue, 25 Jul 2023 22:48:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230725204854.GO3544423@scaer>
References: <20230725185004.3276758-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725185004.3276758-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690318137;
 bh=1NMnKvERAAEfNNePHPX4210XTMB4xzXbTRyxCjfz2VQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n4fwuiaT/I81bAwSufxnj6tBR8wUywWZc2epCeCUmLhih7nO+eq5+6WCkg2VkS3+d
 ojekM8TF/dq/iXvsJ9qEoeIhFRMQRFk3L7AiYBXoUQsQ/faq/dN5mA8gatfSYyhUD4
 3KhQSj/aMTMN5NdWnyFnikK0hkVB/yOQuBUbZFatnK11vaZgg4n/8luCW2xpZwPjwo
 Clc1Isv1SHrxP3uPltDT0uD9BnlpqdzjJHHtYukgkHu7Q0S6AUH0QZUou5EDox/fqa
 4/RBAHTtLdzcHnopCNlMTggDWPXXr7xKxoF2dpRgux9X+UL7lOlccsPHZZniJuSw4z
 wngwKmjKo+RNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n4fwuiaT
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
> 
> Instead of passing -latomic to Configure we use the target arch
> "linux-latomic" which is provided by upstream since version 3.0.0
> especially for libatomic handling:
> https://github.com/openssl/openssl/commit/535130c39d33df41b6a7d14302a93ffaa10ebc46
> https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737225f1aaafd0f1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Build-tested using this defconfig
> 
> BR2_PACKAGE_OPENSSL=y
> BR2_PACKAGE_LIBOPENSSL_BIN=y
> 
>                              arm-aarch64 [ 1/45]: OK
>                    bootlin-aarch64-glibc [ 2/45]: OK
>                bootlin-arcle-hs38-uclibc [ 3/45]: OK
>                     bootlin-armv5-uclibc [ 4/45]: OK
>                      bootlin-armv7-glibc [ 5/45]: OK
>                    bootlin-armv7m-uclibc [ 6/45]: FAILED
>                       bootlin-armv7-musl [ 7/45]: OK
>                 bootlin-m68k-5208-uclibc [ 8/45]: FAILED
>                bootlin-m68k-68040-uclibc [ 9/45]: OK
>              bootlin-microblazeel-uclibc [10/45]: OK
>                 bootlin-mipsel32r6-glibc [11/45]: OK
>                    bootlin-mipsel-uclibc [12/45]: OK
>                      bootlin-nios2-glibc [13/45]: OK
>                  bootlin-openrisc-uclibc [14/45]: OK
>         bootlin-powerpc64le-power8-glibc [15/45]: OK
>            bootlin-powerpc-e500mc-uclibc [16/45]: OK
>                    bootlin-riscv32-glibc [17/45]: OK
>                    bootlin-riscv64-glibc [18/45]: OK
>                     bootlin-riscv64-musl [19/45]: OK
>                  bootlin-s390x-z13-glibc [20/45]: OK
>                       bootlin-sh4-uclibc [21/45]: OK
>                    bootlin-sparc64-glibc [22/45]: OK
>                     bootlin-sparc-uclibc [23/45]: OK
>                     bootlin-x86-64-glibc [24/45]: OK
>                      bootlin-x86-64-musl [25/45]: OK
>                    bootlin-x86-64-uclibc [26/45]: OK
>                    bootlin-xtensa-uclibc [27/45]: OK
>                             br-arm-basic [28/45]: OK
>                     br-arm-full-nothread [29/45]: OK
>                       br-arm-full-static [30/45]: OK
>                    br-i386-pentium4-full [31/45]: OK
>                 br-i386-pentium-mmx-musl [32/45]: OK
>                       br-mips64-n64-full [33/45]: OK
>                  br-mips64r6-el-hf-glibc [34/45]: OK
>                br-powerpc-603e-basic-cpp [35/45]: OK
>                br-powerpc64-power7-glibc [36/45]: OK
>                        linaro-aarch64-be [37/45]: OK
>                           linaro-aarch64 [38/45]: OK
>                               linaro-arm [39/45]: OK
>                      sourcery-arm-armv4t [40/45]: OK
>                             sourcery-arm [41/45]: OK
>                      sourcery-arm-thumb2 [42/45]: OK
>                          sourcery-mips64 [43/45]: OK
>                            sourcery-mips [44/45]: OK
>                           sourcery-nios2 [45/45]: OK
> 45 builds, 0 skipped, 2 build failed, 0 legal-info failed, 0 show-info failed
> 
> Reported the two unrelated build errors:
> https://bugs.busybox.net/show_bug.cgi?id=15709
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
