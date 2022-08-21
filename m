Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C498C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E3A40502;
	Sun, 21 Aug 2022 11:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E3A40502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAaSKjCYkPRF; Sun, 21 Aug 2022 11:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C1C4034B;
	Sun, 21 Aug 2022 11:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C1C4034B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF2E81BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89F9160B02
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F9160B02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pP8DbyQqEbfl for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807EE60ACA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 807EE60ACA
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 11:39:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A95B213FA41;
 Sun, 21 Aug 2022 13:39:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 13:39:34 +0200
Date: Sun, 21 Aug 2022 13:39:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821113934.GT2775145@scaer>
References: <20220821112319.3445-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821112319.3445-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661081977;
 bh=gX2Prcut1vo0QR8Vq8uOY06ue/f92eoeutlP6Bll8SU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6h+PFpAJab2a9LD7jgpn4Hp2OHsTrG+eM+PIVG9pXmHfR51jJbXLhUNVDnKhR8VV
 vbAF8Xkulc+npPujLaWb253NN9cry55F5Gfq7LZLnVPSp6UjkSxYmbWTWgBseyKQ6g
 DWGx7Y8VokwC+IDndw+w9exVbrsHe8hHztZxFJVtpbnufWC+IU5SrOl1zyLzUiDElo
 zZVIuTt06rafxs1QhRh+dhyoUfTXWZvpM6WE63evliU63qvV8syUhiO1X4NBzcbvWG
 ag0yF4MQ+AQO0phDGBl126AOSVXhJ9kT6Uatob7yfqO/ZJmmMGd6Km9gNokJq8NGK1
 9FmHccIJ4TYrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6h+PFpA
Subject: Re: [Buildroot] [PATCH 1/1] package/tesseract-ocr: fix aarch64_be
 build
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-21 13:23 +0200, Fabrice Fontaine spake thusly:
> Fix the following aarch64_be build failure probably raised since the
> addition of the package:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...configure.ac-fix-build-on-aarch64_be.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
> 
> diff --git a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
> new file mode 100644
> index 0000000000..20b8d5ce76
> --- /dev/null
> +++ b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
> @@ -0,0 +1,32 @@
> +From cffb8a36a987cd0d013d73501dd20c553ff69c77 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 21 Aug 2022 10:21:43 +0200
> +Subject: [PATCH] configure.ac: fix build on aarch64_be
> +
> +Fix the following build failure on aarch64_be:
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved (and backported) from:
> +https://github.com/tesseract-ocr/tesseract/commit/cffb8a36a987cd0d013d73501dd20c553ff69c77]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 63579c954f..2b05052395 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -170,7 +170,7 @@ case "${host_cpu}" in
> + 
> +     ;;
> + 
> +-  aarch64)
> ++  aarch64*)
> + 
> +     # ARMv8 always has NEON and does not need special compiler flags.
> +     AM_CONDITIONAL([HAVE_NEON], true)
> -- 
> 2.35.1
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
