Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B73C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7735060C0E;
	Sun, 26 Nov 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7735060C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNrHbCQ13PKS; Sun, 26 Nov 2023 21:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C51760C07;
	Sun, 26 Nov 2023 21:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C51760C07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7268E1BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BAD4811FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BAD4811FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suBCQ--3ci_G for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:28:59 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E001811F8
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E001811F8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4869778035B;
 Sun, 26 Nov 2023 22:28:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:28:55 +0100
Date: Sun, 26 Nov 2023 22:28:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231126212855.GG3177259@scaer>
References: <20231126174558.24896-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126174558.24896-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701034137;
 bh=o8ZBQbxwqboYzfdqEbxlRpD99g+lRyik1+5GdN+jiPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SVA2vSQ25oCOuB+xPVIxwgZNuUaAJDfVgUFcCEl9JqguEPMYCfPfreuSXl3G65CKC
 soTDI4tB7NpMucFvWrRFmamT5KdyGflDXDdzfiqc5NDXglyaJHYNGl5Qww5kV1S+Lj
 1X6A2oljzcmAGI+kwmKIFzto3/zZ64G9jbxEakWOT2cxhJg42ldQUFEP2iPEWVHq/z
 OpeAhdGAUiJXHRNaX8FOwM8UUmGgxrjoVZ8BNONZucFL6V8p4W3sCM5jq+CUyIjoWl
 4uVTj0gJeHo8dtizq6z0bgfMH9RKI95udV9hWINdjfyYWQ+HArFAYDdKxOyOhpt5+F
 SiqTaCplqFzzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SVA2vSQ2
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: fix libressl build
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

On 2023-11-26 18:45 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with libressl >= 3.8 raised since bump
> of libressl to version 3.8.2 in commit
> 21eca49ed5110872407b76ab9337d2877c4cda24:
> 
> In file included from card-westcos.c:37:
> /home/autobuild/autobuild/instance-11/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/openssl/evp.h:627:32: error: macro "EVP_sha3_224" passed 1 arguments, but takes just 0
>   627 | const EVP_MD *EVP_sha3_224(void);
>       |                                ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cecee659371f370bf4bd2b27a4752bf20ceff326
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...L-does-provide-EVP_sha3_-after-3-7-3.patch | 32 +++++++++++++++++++
>  ...ixed-detection-of-SHA3-compatibility.patch | 27 ++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
>  create mode 100644 package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> 
> diff --git a/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
> new file mode 100644
> index 0000000000..80c19a3f5f
> --- /dev/null
> +++ b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
> @@ -0,0 +1,32 @@
> +From e015242590ad9131e124232cc5a2fd02d525ef2c Mon Sep 17 00:00:00 2001
> +From: Klemens Nanni <kn@openbsd.org>
> +Date: Thu, 29 Jun 2023 02:41:43 +0300
> +Subject: [PATCH] LibreSSL does provide EVP_sha3_*() after 3.7.3
> +
> +Support was added in 16.04.2023.
> +
> +Compile- and run-tested on OpenBSD/amd64 7.3-current.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/OpenSC/OpenSC/commit/e015242590ad9131e124232cc5a2fd02d525ef2c
> +---
> + src/libopensc/sc-ossl-compat.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> +index df0cebbce2..8012cd4c0f 100644
> +--- a/src/libopensc/sc-ossl-compat.h
> ++++ b/src/libopensc/sc-ossl-compat.h
> +@@ -50,10 +50,12 @@ extern "C" {
> + #if LIBRESSL_VERSION_NUMBER < 0x30500000L
> + #define FIPS_mode()                             (0)
> + #endif
> ++#ifndef EVP_sha3_224
> + #define EVP_sha3_224()                          (NULL)
> + #define EVP_sha3_256()                          (NULL)
> + #define EVP_sha3_384()                          (NULL)
> + #define EVP_sha3_512()                          (NULL)
> ++#endif
> + #if LIBRESSL_VERSION_NUMBER < 0x3070000fL
> + #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
> + #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
> diff --git a/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> new file mode 100644
> index 0000000000..3d8aa7e4ef
> --- /dev/null
> +++ b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
> @@ -0,0 +1,27 @@
> +From 33351d91aa22fa8077847ba3f19abb5a00b04600 Mon Sep 17 00:00:00 2001
> +From: Frank Morgner <frankmorgner@gmail.com>
> +Date: Tue, 15 Aug 2023 17:58:21 +0200
> +Subject: [PATCH] fixed detection of SHA3 compatibility
> +
> +fixes https://github.com/OpenSC/OpenSC/issues/2836
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/OpenSC/OpenSC/commit/33351d91aa22fa8077847ba3f19abb5a00b04600
> +---
> + src/libopensc/sc-ossl-compat.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
> +index 8012cd4c0f..96ec4bd736 100644
> +--- a/src/libopensc/sc-ossl-compat.h
> ++++ b/src/libopensc/sc-ossl-compat.h
> +@@ -50,7 +50,8 @@ extern "C" {
> + #if LIBRESSL_VERSION_NUMBER < 0x30500000L
> + #define FIPS_mode()                             (0)
> + #endif
> +-#ifndef EVP_sha3_224
> ++/* OpenSSL 1.1.1 has EVP_sha3_* */
> ++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30800000L
> + #define EVP_sha3_224()                          (NULL)
> + #define EVP_sha3_256()                          (NULL)
> + #define EVP_sha3_384()                          (NULL)
> -- 
> 2.42.0
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
