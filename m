Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B7EC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BAF83EC5;
	Thu, 17 Jul 2025 20:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYLrrD9GawO9; Thu, 17 Jul 2025 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E894E83ED4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E894E83ED4;
	Thu, 17 Jul 2025 20:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B25226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BBD60813
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwoVxhfdy_XS for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76E34607F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E34607F5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76E34607F5
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0AF41B977AA4; Thu, 17 Jul 2025 22:02:35 +0200 (CEST)
Message-ID: <c4e29b31-e1e1-4f22-b4e3-73eb43557bf5@rnout.be>
Date: Thu, 17 Jul 2025 22:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20250707163600.1332626-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707163600.1332626-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=K+r/IUnTLmQs9I2I/9C/2Xjozw8ghIuu9WHrrqjfbwo=;
 b=SCBUq8j/W1EyduUo7H7AKRLF+imLsSZeXvOeVQdoZ1JhhfmuCCOGf8WUv6ekqGRdqmNMB0
 iswBZLxVBdx2ZRLRO5WFOTkwakcRWoIKbUXC4NvgUVqK4KzWgLtSqGExeGsCvyEy7pdlIY
 P3N4lXLvEOZAa10Xhum7EtJ5hqSM5/6YhZucHNnJrB0h9jPZfVaARjHXF7sxB06MfFL6Kb
 DRU1MEX5GFM2GG3yj22n5RPwBuUyvugC4JFez+2R1Qj5qBguJ/I+B7+HrmR/HMRznkreYG
 qerGqauPdlaE4sxEvfBucGMbsAd1KLYldL3g6gUu8ctVkg8rJ72ZngC13aNvjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=SCBUq8j/
Subject: Re: [Buildroot] [PATCH] package/libiec61850: fix build w/ mbedtls
 v3.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/07/2025 18:36, Thomas Perale via buildroot wrote:
> Since the mbedtls bump to v3.6 [1] the libiec61850 package is failling
> on the autobuilder with the following error:
> 
> ```
> [  2%] Building C object hal/CMakeFiles/hal.dir/tls/mbedtls/tls_mbedtls.c.o
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c: In function 'compareCertificates':
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:17: error: 'mbedtls_x509_crt' has no member named 'sig'
>    122 |         if (crt1->sig.len == crt2->sig.len)
>        |                 ^~
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:34: error: 'mbedtls_x509_crt' has no member named 'sig'
>    122 |         if (crt1->sig.len == crt2->sig.len)
>        |                                  ^~
> ...
> ```
> 
> The logic to support mbedtls v3 is already present on the version
> present in buildroot.
> This patch ensures that the CMake build uses the mbedtls headers and
> libraries provided by buildroot rather than the bundled copy.
> 
> By setting the following variable the mbedtls v3.6 is correctly found
> during the configuration of the package.
> 
> ```
> Found mbedtls 3.6 -> can compile HAL with TLS 1.3 support
> ```
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> 
> Fixes: https://autobuild.buildroot.org/results/5fc/5fca384510d2fb9dd1d01736dee34b53339d62ff/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/libiec61850/libiec61850.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
> index 92b27dc5c2..2bf98f1f3d 100644
> --- a/package/libiec61850/libiec61850.mk
> +++ b/package/libiec61850/libiec61850.mk
> @@ -15,6 +15,9 @@ LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
>   ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>   LIBIEC61850_DEPENDENCIES += mbedtls
>   LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=ON
> +LIBIEC61850_CONF_OPTS += \
> +	-DCONFIG_EXTERNAL_MBEDTLS_DYNLIB_PATH=$(STAGING_DIR)/usr/lib \
> +	-DCONFIG_EXTERNAL_MBEDTLS_INCLUDE_PATH=$(STAGING_DIR)/usr/include
>   else
>   LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=OFF
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
