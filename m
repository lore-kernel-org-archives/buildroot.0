Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274BEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 12:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A04181F55;
	Sun, 20 Aug 2023 12:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A04181F55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHW0qNyIxQyF; Sun, 20 Aug 2023 12:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663C881F57;
	Sun, 20 Aug 2023 12:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663C881F57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C15C81BF420
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 12:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AEFC40472
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 12:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEFC40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTuVwvI40_6n for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 12:51:41 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1839940114
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1839940114
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C47BC19F58D;
 Sun, 20 Aug 2023 14:51:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 14:51:35 +0200
Date: Sun, 20 Aug 2023 14:51:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230820125135.GI1778688@scaer>
References: <20230820103343.353423-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820103343.353423-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692535897;
 bh=PYRxzX1HIMsHjJSM+FiH85YD4Z9mR2mgRuekCc+kKcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1Di58IuAqL9THYy9mC3Ld1l5m73b0BXVaCMK6Pq8J0XKurpEWUSgbrkmhQNl1z1m
 xpz0hPMSNXKK4pZie8N42QI05oHCVz9BSeiorNUlIYe1hvCxh1YjSHfO5witOBGAUl
 iyMVvDriJ8L/wmBsNCCGMDmONUbW7Bu8VqMWwe3HNeumyfz2dxa3aD7lHfjYJar6yK
 QXyyS+gUIVc/m8jElo8CkvrFtlDpRj9svR+3zkCSQoyWzcbzy9PN9pjJGpDKEjORpB
 hZXH/YtFgYtaRL3ldKEzdkp8Rf2d/PlXS2Ih1BthHebnGytSoQoG02xA4jKBCyshHD
 QSc58xt5nlMSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D1Di58Iu
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_nftables.py: new runtime test
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

Julien, All,

On 2023-08-20 12:33 +0200, Julien Olivain spake thusly:
> This runtime test was suggested in discussion [1]. It should detect
> potential runtime failures such as the one fixed in commit eb74998125
> "package/nftables: fix the build of the pyhon bindings".
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2023-August/672864.html
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks for this new comprehensive test! :-)

[--SNIP--]
> diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
> new file mode 100644
> index 0000000000..7fcc2902b6
> --- /dev/null
> +++ b/support/testing/tests/package/test_nftables.py
> @@ -0,0 +1,110 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestNftables(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y

Why do we need to build a special kernel, instead of using the pre-built
one?

> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.46"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_NFTABLES=y
> +        BR2_PACKAGE_NFTABLES_PYTHON=y

BR2_PACKAGE_NFTABLES_PYTHON=y is the default, so it is not needed.
Except fir the kernel question, I could have fixed that when applying,
but I'd rather know why we can't use the prebuilt kernel (because it
takes so long to build a soecial kernel...)

Regards,
Yann E. MORIN.

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
