Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB06C61D90
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 18:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE4E81469;
	Tue, 21 Nov 2023 18:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE4E81469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3__9m25j0zSi; Tue, 21 Nov 2023 18:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1C68146B;
	Tue, 21 Nov 2023 18:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1C68146B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC9C21BF32B
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A029C4090E
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A029C4090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4S0RyehFG4EW for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 18:12:55 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCF37408FF
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 18:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF37408FF
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 0F39744090A;
 Tue, 21 Nov 2023 20:11:40 +0200 (IST)
References: <20231121174722.4164-1-trippgallagher98@gmail.com>
User-agent: mu4e 1.10.7; emacs 29.1
To: Byron Gallagher <trippgallagher98@gmail.com>
Date: Tue, 21 Nov 2023 20:09:30 +0200
In-reply-to: <20231121174722.4164-1-trippgallagher98@gmail.com>
Message-ID: <87fs0zx9el.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1700590300;
 bh=XngluAZDTNY9LpmY1PhzTbd75sN9XiJp/YsIFS9FHEo=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=HaIRoPASI7dnN0Jd8Nk15R0p1/ziTDfFE1d9tHdX3zbptJNHc+m0vMpmzQBGjOgp7
 dg9uZgAGOzRMqfGz+t9fNSaYTUCxJFDRmml5fFCHw2E3RSkyHO+JE1xMMzx/OtKe5W
 TCb2jLUiDVXDOHGYC/9fOEDzycna3WYzaz7qRHo0EqRGS1ESAjaRUNyIOWc8WNaIuc
 fqALqZADTRdW9dY0B03zf+li3jUcnfeF/7XEgTi3C8TKtkLuMlNVeOZvUNnqrdIdT9
 q4ktdDUkXKcpmqv/D+IecAcrddvNHsTG7KDo8lV/efMz9Upk7KP24gjY/EgGkxrtSq
 xmZL7z49uKSkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=HaIRoPAS
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Byron,

On Tue, Nov 21 2023, Byron Gallagher wrote:

> 4028ee71743a25af172809e098e4c8eb61bf55f4 disables static openssl
> compatibility due to issues linking against zlib.
>
> This patch re-enables the functionality by patching socat's
> autoconf to include zlib when locating openssl. Bug also reported
> upstream via socat@dest-unreach.org.
>
> Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
> ---
>  ...-build-link-against-zlib-for-openssl.patch | 35 +++++++++++++++++++
>  package/socat/socat.mk                        |  2 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 package/socat/0003-build-link-against-zlib-for-openssl.patch
>
> diff --git a/package/socat/0003-build-link-against-zlib-for-openssl.patch
> b/package/socat/0003-build-link-against-zlib-for-openssl.patch
> new file mode 100644
> index 0000000000..3851d5bcab
> --- /dev/null
> +++ b/package/socat/0003-build-link-against-zlib-for-openssl.patch
> @@ -0,0 +1,35 @@
> +From 0434a4674a012a35f6390d9afc4812de59a394ab Mon Sep 17 00:00:00 2001
> +From: Byron Gallagher <trippgallagher98@gmail.com>
> +Date: Tue, 21 Nov 2023 12:25:18 -0500
> +Subject: [PATCH] build: link against zlib for openssl
> +
> +If openssl is static, socat will not find it due to autoconf
> +failures on AC_TRY_LINK without -lz.
> +

Patches should have Upstream: tag. See

  https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

In this case adding something like

Upstream: sent to socat@dest-unreach.org

should be enough.

baruch

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


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
