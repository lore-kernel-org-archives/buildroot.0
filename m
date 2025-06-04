Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E33EC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D9940B3F;
	Wed,  4 Jun 2025 18:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFg5Jyv6jQVF; Wed,  4 Jun 2025 18:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8044240AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8044240AF3;
	Wed,  4 Jun 2025 18:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D45D1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 136348346C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoZEvOD6yIcS for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E10083300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E10083300
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E10083300
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 423D91C0198; Wed,  4 Jun 2025 20:24:17 +0200 (CEST)
Message-ID: <d5ff3a38-b224-453d-906a-b7bc1c9e275c@rnout.be>
Date: Wed, 4 Jun 2025 20:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250518164542.7511F87172@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518164542.7511F87172@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061457; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IowraujM9Osf0eWhbZp78Q/kG9kKP/suJhdDzsO9vkE=;
 b=aoRTaXkFNjVyRVFO4LdL71o/wOPGiq+GMHqAPV1ZJJtfR2CTuQquTsAi72hrgqNKmA0EzU
 5nrqsLNzWrkgAKgPKDG7lMjeoyyH69TZcEez34+2N/4M+fyl8XRINMsR7H+MGouucvvkre
 LPhRpsh1NldV/j/d7AZkQuQvmdwz0gbPFCmkB2/7T30NLirT3I2HKGra41ByV7kxd1MNEY
 lzzxdelIV7omAkGxwEMOXY3u1GVbacqwoq8QEP65h7o63r9h3SnCO3+y8B7HMuDe9JoS/M
 carVj4/LIJ0p1GRrR8cRZlmUO9ZFGffvxeqAnduXYagLyE0O0ZkbaEMxlC19hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aoRTaXkF
Subject: Re: [Buildroot] [git commit] package/samba4: needs libxcrypt
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



On 18/05/2025 18:45, Thomas Petazzoni via buildroot wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=6c3f01fde12730defcc238fe9b065b30086e066b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Since the bump of Samba to version 4.21.4 in commit
> 716461af945e89af56eea4a3936c4a2adc7fdb4d, <crypt.h> is needed, due to
> upstream comit 0dccda38f27b3bbda5d2a4de588a333ff554651a. Since
> <crypt.h> is no longer provided by glibc, a dependency on libxcrypt is
> needed, to avoid the following build failure:
> 
> ../../lib/util/util_crypt.c:5:10: fatal error: crypt.h: No such file or directory
>      5 | #include <crypt.h>
>        |          ^~~~~~~~~
> compilation terminated.
> 
> This has not been detected by the autobuilders, presumably because a
> lot of glibc configurations end up having libxcrypt selected by other
> packages, but the issue is reproducible by building:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_SAMBA4=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  BTW does this close https://gitlab.com/buildroot.org/buildroot/-/issues/86 ?

  Regards,
  Arnout

> ---
>   package/samba4/Config.in | 1 +
>   package/samba4/samba4.mk | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index 36ec656168..6aff82bb3d 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_SAMBA4
>   	select BR2_PACKAGE_GNUTLS
>   	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>   	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>   	select BR2_PACKAGE_POPT
>   	select BR2_PACKAGE_ZLIB
>   	help
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index ac3141f3d9..828de56fc8 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -22,6 +22,7 @@ SAMBA4_DEPENDENCIES = \
>   	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
>   	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
>   	$(if $(BR2_PACKAGE_READLINE),readline) \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>   	$(TARGET_NLS_DEPENDENCIES)
>   SAMBA4_CFLAGS = $(TARGET_CFLAGS)
>   SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
