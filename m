Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58602C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CFB60B69;
	Sat, 23 Dec 2023 10:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CFB60B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPgFyhyaam8Y; Sat, 23 Dec 2023 10:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429FD60B16;
	Sat, 23 Dec 2023 10:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 429FD60B16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D59C1BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 633B1831DA
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 633B1831DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4hIvDgrflrf for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:29:26 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5476A83760
 for <buildroot@busybox.net>; Sat, 23 Dec 2023 10:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5476A83760
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35685B00593;
 Sat, 23 Dec 2023 11:29:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 11:29:21 +0100
Date: Sat, 23 Dec 2023 11:29:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZYa2gV61657GmvC_@landeda>
References: <bbe9d77a3248044af15eb27f127466e0e672723d.1703223960.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbe9d77a3248044af15eb27f127466e0e672723d.1703223960.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703327364;
 bh=Adsji9Ikjkd1lyGow0F3ZepSK06EQ/syH2ckPTQmf0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBFHiFpuzlxUnPNRIWLZPpAzmBR9WDwYeV8mp1jWHIVlGCyhzB9Ka68h7yhO7NkpR
 ZzLmpvcvKLiHFTasOHL2mr6S9P/dBN/IakUkV65NPEAiWehHJ7J8e0/xj13W3/QEXf
 b4jLF5iyVCB1ns3vaPqOoHSQmcxZH+ICx9KpntIIPZjjjCMiBhgOXFYP42eZw7pnz1
 rL9Bp6Zao0WXrNmzyNbrDHBsYWJKTtVcTc/DrMuvK7HktRHLRgYBTBEZ8Y0dNH5FgX
 cnadk1dB7F7M4wKO8oPRnPtPMbXat1ggdwSGYtrK/h1Qe5Pcc0/SzzgrtjVfoDeFmZ
 SQMVLLt4lUdcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RBFHiFpu
Subject: Re: [Buildroot] [PATCH v2] package/libcurl: fix build with GnuTLS
 and no verbose
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bruch, All,

On 2023-12-22 07:46 +0200, Baruch Siach via buildroot spake thusly:
> A change of data logging introduced in version 8.5.0 broke the build.
> Add a patch to fix that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c5b996696333c4ff1392dbb8e6b0edc9c5322ee4/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: Take upstream patch
> ---
>  ...nutls-fix-build-with-disable-verbose.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
> 
> diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
> new file mode 100644
> index 000000000000..25e389c9724e
> --- /dev/null
> +++ b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
> @@ -0,0 +1,60 @@
> +From 0d9f9c5ea8c15c70eb420242b60179d9083c70b7 Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Mon, 11 Dec 2023 20:45:01 +0200
> +Subject: [PATCH] gnutls: fix build with --disable-verbose
> +
> +infof() parameters must be defined event with --disable-verbose since
> +commit dac293cfb702 ("lib: apache style infof and trace
> +macros/functions").
> +
> +Move also 'ptr' definition under !CURL_DISABLE_VERBOSE_STRINGS.
> +
> +Fixes the following build failure:
> +
> +In file included from ../lib/sendf.h:29,
> +                 from vtls/gtls.c:44:
> +vtls/gtls.c: In function 'Curl_gtls_verifyserver':
> +vtls/gtls.c:841:34: error: 'version' undeclared (first use in this function); did you mean 'session'?
> +  841 |         gnutls_protocol_get_name(version), ptr);
> +      |                                  ^~~~~~~
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +Upstream: https://github.com/curl/curl/commit/af520ac9fec7d88e942f05fdcd90704adb9fa566
> +---
> + lib/vtls/gtls.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
> +index f42b6d6691de..b95c5be3c5e5 100644
> +--- a/lib/vtls/gtls.c
> ++++ b/lib/vtls/gtls.c
> +@@ -818,16 +818,17 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
> +   char certname[65] = ""; /* limited to 64 chars by ASN.1 */
> +   size_t size;
> +   time_t certclock;
> +-  const char *ptr;
> +   int rc;
> +   CURLcode result = CURLE_OK;
> + #ifndef CURL_DISABLE_VERBOSE_STRINGS
> ++  const char *ptr;
> +   unsigned int algo;
> +   unsigned int bits;
> +   gnutls_protocol_t version = gnutls_protocol_get_version(session);
> + #endif
> +   long * const certverifyresult = &ssl_config->certverifyresult;
> + 
> ++#ifndef CURL_DISABLE_VERBOSE_STRINGS
> +   /* the name of the cipher suite used, e.g. ECDHE_RSA_AES_256_GCM_SHA384. */
> +   ptr = gnutls_cipher_suite_get_name(gnutls_kx_get(session),
> +                                      gnutls_cipher_get(session),
> +@@ -835,6 +836,7 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
> + 
> +   infof(data, "SSL connection using %s / %s",
> +         gnutls_protocol_get_name(version), ptr);
> ++#endif
> + 
> +   /* This function will return the peer's raw certificate (chain) as sent by
> +      the peer. These certificates are in raw format (DER encoded for
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
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
