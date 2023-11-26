Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D0BC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 15:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B22D812B2;
	Sun, 26 Nov 2023 15:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B22D812B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeLig1y_tQ81; Sun, 26 Nov 2023 15:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9E7E812AE;
	Sun, 26 Nov 2023 15:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E7E812AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 695FA1BF40E
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 15:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6C16073F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 15:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C6C16073F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKHgyhE1oH8B for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 15:42:02 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4206A60675
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 15:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4206A60675
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8BB9678034D;
 Sun, 26 Nov 2023 16:41:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 16:41:58 +0100
Date: Sun, 26 Nov 2023 16:41:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Byron Gallagher <trippgallagher98@gmail.com>
Message-ID: <20231126154158.GU3177259@scaer>
References: <20231121182525.4549-1-trippgallagher98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121182525.4549-1-trippgallagher98@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701013320;
 bh=Tyouf296WXvTPpVyw4x9duFMuQdbVOzwWyaOBN2VUJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ns5ocAh+J3lYvD2zn8Y8381pRx0dcXYD/qlOz85spb0q/gjK+z3le0MhHUovKYDMh
 VuURzhxBiDt+mOjveing9KMFoMLjASeJEMUbUzEto16JfeDpBOZSgcinmpGl4As118
 7Ob/ePBlUnOBw+CEzhehrY74D9X42/Tmt4aGvDYD/C2EZXIXiynZBQVSurJZlEvOyZ
 VVppXH0gDm+noxUG57Gs2I6kV7PCYPTgDXLcFW/Y6lwHdg8bXUvIphkjOYfItOr43E
 lhKdzpQ08gJHCo4aXg3+RAP/NB/iO5CUD5XHL5CskTEnIr0ShIvU5UCXxnUIlkj73F
 Jt8AUSBPjOZEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ns5ocAh+
Subject: Re: [Buildroot] [PATCH] package/socat: fix static openssl
 compatibility
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

Byron, All,

On 2023-11-21 13:25 -0500, Byron Gallagher spake thusly:
> 4028ee71743a25af172809e098e4c8eb61bf55f4 disables static openssl
> compatibility due to issues linking against zlib.
> 
> This patch re-enables the functionality by patching socat's
> autoconf to include zlib when locating openssl. Bug also reported
> upstream via socat@dest-unreach.org.

Since you sent this new iteration, Thomas replied to your initial patch,
usggesting using pkg-config to find the necessary SSL libs.

So, I've marked both your patches as changes requested in patchwork.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
> ---
>  ...-build-link-against-zlib-for-openssl.patch | 36 +++++++++++++++++++
>  package/socat/socat.mk                        |  2 +-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 package/socat/0003-build-link-against-zlib-for-openssl.patch
> 
> diff --git a/package/socat/0003-build-link-against-zlib-for-openssl.patch b/package/socat/0003-build-link-against-zlib-for-openssl.patch
> new file mode 100644
> index 0000000000..257f5225b1
> --- /dev/null
> +++ b/package/socat/0003-build-link-against-zlib-for-openssl.patch
> @@ -0,0 +1,36 @@
> +From 0434a4674a012a35f6390d9afc4812de59a394ab Mon Sep 17 00:00:00 2001
> +From: Byron Gallagher <trippgallagher98@gmail.com>
> +Date: Tue, 21 Nov 2023 12:25:18 -0500
> +Subject: [PATCH] build: link against zlib for openssl
> +
> +If openssl is static, socat will not find it due to autoconf
> +failures on AC_TRY_LINK without -lz.
> +
> +Upstream: sent to socat at dest-unreach.org
> +Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9d60473..ae0e6bd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -580,12 +580,12 @@ if test -n "$WITH_OPENSSL" -a "$sc_cv_have_openssl_ssl_h" = 'yes'; then
> +       if test -n "$OPENSSL_BASE"; then
> + 	L="$OPENSSL_BASE/lib"; LIBS="$LIBS -L$L -lssl -lcrypto"
> +       else
> +-	LIBS="$LIBS -lssl -lcrypto"
> ++	LIBS="$LIBS -lssl -lcrypto -lz"
> +       fi
> +       AC_TRY_LINK([#include <openssl/ssl.h>],
> +        [SSL_library_init();ERR_error_string()],
> +        [sc_cv_have_libssl='yes'],
> +-       [ LIBS="$LIBS -lcrypto"
> ++       [ LIBS="$LIBS -lcrypto -lz"
> +        AC_TRY_LINK([#include <openssl/ssl.h>],
> +        [SSL_library_init()],
> + 	  [sc_cv_have_libssl='yes'],
> +-- 
> +2.34.1
> +
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index f958f26522..0741605687 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
>  # incompatibile license (GPL-3.0+)
>  SOCAT_CONF_OPTS = --disable-readline
>  
> -ifeq ($(BR2_PACKAGE_LIBOPENSSL):$(BR2_STATIC_LIBS),y:)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  SOCAT_DEPENDENCIES += openssl
>  else
>  SOCAT_CONF_OPTS += --disable-openssl
> -- 
> 2.34.1
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
