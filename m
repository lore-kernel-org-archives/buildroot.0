Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20DDCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC68061414;
	Fri, 15 Sep 2023 22:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC68061414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EO-uM4CinpWG; Fri, 15 Sep 2023 22:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2AE613D8;
	Fri, 15 Sep 2023 22:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2AE613D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DECE1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DE640545
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DE640545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNB4Pk0qJCqn for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:21:05 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10919402A8
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10919402A8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4B3952003E8;
 Sat, 16 Sep 2023 00:21:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 00:21:01 +0200
Date: Sat, 16 Sep 2023 00:21:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915222101.GQ2571@scaer>
References: <20230915221622.207938-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915221622.207938-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694816463;
 bh=BfypL91XIY45oTGAbJkXC5vy0r7KgLYLixd/r/fAbIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qwXYU/GEQoSk5+zbuzBk37MPpRLQkDedE8Zsftov8FTQrwtM8H1rFQrqeFQH/N17S
 axy/ZDEmLISdPXdHctPatbIe0zy8bS/ZcaUPxfD0yB8v+SXGNzSNw0d8CY1TChzAe0
 tZw7bHoIiQetxGCcLn8fXQkiDnlIAqA7iQzx+zqI/zxthPNHfpSIVbCAUzcNgpIM2/
 mHqgkLDckCkdG14KO0snd+7zWINERY/av8DhFjxGlhf/n8EbVxBTFCQdae5cNpw7YM
 1vogTMMV8gjoy0Gxu3IOPCbu9CoJ41u8lvh2afw8qHvDKwfwJgGbeiX1h1D3EcfhHb
 fF5HdnE5LtkRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qwXYU/GE
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.11.0
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

Fabrice, All,

On 2023-09-16 00:16 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2023-39350 to CVE-2023-39354, CVE-2023-39356, CVE-2023-40181,
>   CVE-2023-40186, CVE-2023-40188, CVE-2023-40567, CVE-2023-40569 and
>   CVE-2023-40589
> - Drop fourth patch (already in version)
> 
> https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.0
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-rrrv-3w42-pffh
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q9x9-cqjc-rgwq
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-whwr-qcf2-2mvj
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hg53-9j9h-3c8f
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-c3r2-pxxp-f8r6
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q5v5-qhj5-mh6m
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-mxp4-rx7x-h2g8
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hcj4-3c3r-5j3v
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-9w28-wwj5-p4xq
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-2w9f-8wg4-8jfp
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hm8c-rcjg-c8qp
> https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-gc34-mw6m-g42x
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  ...e-sha3-and-shake-hashes-for-libressl.patch | 38 -------------------
>  package/freerdp/freerdp.hash                  |  4 +-
>  package/freerdp/freerdp.mk                    |  2 +-
>  4 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index dfeaaf46eb..73a00d610c 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -446,7 +446,6 @@ package/freeradius-client/0001-fix-for-nettle.patch Upstream
>  package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
>  package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
>  package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch Upstream
> -package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch Upstream
>  package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch Upstream
>  package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch Upstream
>  package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
> diff --git a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch b/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
> deleted file mode 100644
> index 14f615e2e7..0000000000
> --- a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From bd093454fe126163634c00b7484ab7fee6ffe670 Mon Sep 17 00:00:00 2001
> -From: akallabeth <akallabeth@posteo.net>
> -Date: Mon, 20 Feb 2023 16:23:39 +0100
> -Subject: [PATCH] Fix #8702: Disable sha3 and shake hashes for libressl
> -
> -[Retrieved (and backported) from:
> -https://github.com/FreeRDP/FreeRDP/pull/8708/commits/bd093454fe126163634c00b7484ab7fee6ffe670]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libfreerdp/crypto/x509_utils.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libfreerdp/crypto/crypto.c b/libfreerdp/crypto/crypto.c
> -index 6e87a88b8d8..62cf2939be7 100644
> ---- a/libfreerdp/crypto/crypto.c
> -+++ b/libfreerdp/crypto/crypto.c
> -@@ -748,7 +748,7 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
> - 			return WINPR_MD_SHA512;
> - 		case NID_ripemd160:
> - 			return WINPR_MD_RIPEMD160;
> --#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) || defined(LIBRESSL_VERSION_NUMBER)
> -+#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) && !defined(LIBRESSL_VERSION_NUMBER)
> - 		case NID_sha3_224:
> - 			return WINPR_MD_SHA3_224;
> - 		case NID_sha3_256:
> -@@ -757,11 +757,11 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
> - 			return WINPR_MD_SHA3_384;
> - 		case NID_sha3_512:
> - 			return WINPR_MD_SHA3_512;
> --#endif
> - 		case NID_shake128:
> - 			return WINPR_MD_SHAKE128;
> - 		case NID_shake256:
> - 			return WINPR_MD_SHAKE256;
> -+#endif
> - 		case NID_undef:
> - 		default:
> - 			return WINPR_MD_NONE;
> diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
> index 55314cfdd3..02268f55ea 100644
> --- a/package/freerdp/freerdp.hash
> +++ b/package/freerdp/freerdp.hash
> @@ -1,5 +1,5 @@
> -# From https://pub.freerdp.com/releases/freerdp-2.10.0.tar.gz.sha256
> -sha256  a673d3fc21911dd9f196834f2f3a23c3ebc7e5e4deab2f7686fcec879279e2c1  freerdp-2.10.0.tar.gz
> +# From https://pub.freerdp.com/releases/freerdp-2.11.0.tar.gz.sha256
> +sha256  8d08e638df21e67c3761462b4efb9e596576f58bd6886f902e6021cdd17d396e  freerdp-2.11.0.tar.gz
>  
>  # Locally calculated
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 01c511819d..6f71ef796f 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREERDP_VERSION = 2.10.0
> +FREERDP_VERSION = 2.11.0
>  FREERDP_SITE = https://pub.freerdp.com/releases
>  FREERDP_DEPENDENCIES = libglib2 openssl zlib
>  FREERDP_LICENSE = Apache-2.0
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
