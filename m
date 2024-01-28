Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE688C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 17:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8431940123;
	Sun, 28 Jan 2024 17:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8431940123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O29LapZg8f0Q; Sun, 28 Jan 2024 17:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CE944014B;
	Sun, 28 Jan 2024 17:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE944014B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBBB71BF59F
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C416E8231D
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 17:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C416E8231D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0RYuw6lwlKp for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 17:51:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A62A822CE
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A62A822CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6870F13F89A;
 Sun, 28 Jan 2024 18:51:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Jan 2024 18:51:33 +0100
Date: Sun, 28 Jan 2024 18:51:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZbaUJaL3pQhstDsK@landeda>
References: <20240128164151.283361-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128164151.283361-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706464295;
 bh=iRdEKzlWMi0bolmePWzaZhDKsQxOZnP9MNLz19H3fRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtbSffTLJd+uCWXRnxWdycaJQOX8dakt1QSPVcEBU+p8nMB/bCd2HWQuBQ2JZ8loy
 s4m/H//pG6zDXfAWEiySplwtjDJmlpUtIOrS7WDbUYP+WpchGsckey42FyvfcAPmO6
 sbbtKlpdsOxY6QdpM4VitZw0ZbJHnUkjwapOw23XMZndyoptp+g/vgtz1RaT060AbZ
 fHEySp/tpmVIUMesHB+RKIT2U+tPM1THsvQAo7kp5a0xCrs0gVt0eN31UG5JxGidHl
 sXB/MUC0XnbGx+PObcr16wTmK/IsxnId4SZ2w8WG4UepmEdhXJ5RWR5cuL047pTgK4
 j3sYCfz8gFozA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HtbSffTL
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: Fix build with libressl >=
 3.8.1
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

On 2024-01-28 17:41 +0100, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/85c/85cde3bcd12fb5adafb94c85d5fa636e1b5b9068/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...t-define-DISABLE_ENGINES-after-OPENS.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> 
> diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> new file mode 100644
> index 0000000000..f46acb28c8
> --- /dev/null
> +++ b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
> @@ -0,0 +1,61 @@
> +From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
> +From: orbea <orbea@riseup.net>
> +Date: Thu, 31 Aug 2023 14:35:52 -0700
> +Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
> + OPENSSL_NO_ENGINE
> +
> +With LibreSSL-3.8.1 these engines are no long available causing a build
> +failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
> +opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
> +of the openssl includes which would define OPENSSL_NO_ENGINE and then
> +fails to define DISABLE_ENGINES.
> +
> +As the define is used in only a single .c file it is best to move it
> +there.
> +
> +Signed-off-by: orbea <orbea@riseup.net>
> +
> +Upstream:
> +https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739

    $ make check-package
    package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Indeed, the upstream status must be on the same line as the Upstream
tag. I've fixed that and squashed the empty lines around it (no need
to waste too much space on the chain of custody).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
> + src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
> +index 6c01cb6aa8..ca12a82518 100644
> +--- a/src/lib/crypt_ops/crypto_openssl_mgt.c
> ++++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
> +@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
> + 
> + #include <string.h>
> + 
> ++#ifdef OPENSSL_NO_ENGINE
> ++/* Android's OpenSSL seems to have removed all of its Engine support. */
> ++#define DISABLE_ENGINES
> ++#endif
> ++
> + #ifndef NEW_THREAD_API
> + /** A number of preallocated mutexes for use by OpenSSL. */
> + static tor_mutex_t **openssl_mutexes_ = NULL;
> +diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
> +index 96a37721dd..eac0ec1977 100644
> +--- a/src/lib/crypt_ops/crypto_openssl_mgt.h
> ++++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
> +@@ -49,11 +49,6 @@
> + #define OPENSSL_V_SERIES(a,b,c) \
> +   OPENSSL_VER((a),(b),(c),0,0)
> + 
> +-#ifdef OPENSSL_NO_ENGINE
> +-/* Android's OpenSSL seems to have removed all of its Engine support. */
> +-#define DISABLE_ENGINES
> +-#endif
> +-
> + #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
> + /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
> +  * setting up various callbacks.
> +-- 
> +GitLab
> +
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
