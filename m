Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47605C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0FB83EE5;
	Fri,  2 May 2025 11:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id majJ_htTdrVz; Fri,  2 May 2025 11:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EED683EEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EED683EEA;
	Fri,  2 May 2025 11:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B704CEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7D5542113
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY52LdO5pyiW for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF15D40AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF15D40AAB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF15D40AAB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 549631C0FC1; Fri,  2 May 2025 13:10:59 +0200 (CEST)
Message-ID: <89adcb2c-b84c-4cdf-b80e-c5b85476d763@rnout.be>
Date: Fri, 2 May 2025 13:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
References: <20250425170107.1110426-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250425170107.1110426-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tEZQF2l040Ev1KYndyLeKlIZnxGctKYoVPevHMe+aXM=;
 b=hjiKxUV4jPyFgOSqfNcc1u3umXHv2YyaxG7e4bMJVHQ4UjCnU+dkp3a0Kcek3Kadoz339u
 nX+o+xH3i0qZu58aQAG+G/3K1j1xukLjwG3qGQu2sPwGKTSNylyFJxQ4803F7MiPxNg29e
 4VR0w1NBsz3CieJZvAC8Sr8DIpXhTAAwglx/gFcUb5AUt7q487S2HkJnGbKytUuN6P9dAJ
 1JxvI3WKtoaXW7dMogdGj7fusaYQF12sy4ab/OBKaRzf8R5+vume2K6ZzLz6zMUeAS121v
 LuYpVV6ZkNZkIYZgU8qB8SpjeZ0ZfBc6gD2FC7Pug32+M+uOKkGtMftTvf/VTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hjiKxUV4
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix build w/ wolfssl
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



On 25/04/2025 19:01, Thomas Perale via buildroot wrote:
> The package strongswan relies on the `wc_RsaKeyToDer` & `wc_MakeRsaKey`
> functions of WolfSSL. Building this package with the WolfSSL backend
> by selecting the variable `BR2_PACKAGE_STRONGSWAN_WOLFSSL` would give
> the following error:
> 
> ```
> libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ed_public_key.c -o wolfssl_ed_public_key.o >/dev/null 2>&1
> wolfssl_rsa_private_key.c: In function 'get_encoding':
> wolfssl_rsa_private_key.c:366:31: error: implicit declaration of function 'wc_RsaKeyToDer'; did you mean 'wc_EccKeyToDer'? [-Wimplicit-function-declaration]
>    366 |                         len = wc_RsaKeyToDer(&this->rsa, encoding->ptr, len);
>        |                               ^~~~~~~~~~~~~~
>        |                               wc_EccKeyToDer
> libtool: compile:  /home/buildroot/instance-0/output-1/host/bin/sparc-linux-gcc -DHAVE_CONFIG_H -I. -I../../../.. -I../../../../src/libstrongswan -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DWC_NO_RNG -rdynamic -Wno-format -Wno-format-security -Wno-implicit-fallthrough -Wno-missing-field-initializers -Wno-pointer-sign -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Og -g0 -include /home/buildroot/instance-0/output-1/build/strongswan-5.9.14/config.h -c wolfssl_ec_private_key.c -o wolfssl_ec_private_key.o >/dev/null 2>&1
> wolfssl_rsa_private_key.c: In function 'wolfssl_rsa_private_key_gen':
> wolfssl_rsa_private_key.c:490:13: error: implicit declaration of function 'wc_MakeRsaKey'; did you mean 'wc_FreeRsaKey'? [-Wimplicit-function-declaration]
>    490 |         if (wc_MakeRsaKey(&this->rsa, key_size, WC_RSA_EXPONENT, &this->rng) < 0)
>        |             ^~~~~~~~~~~~~
>        |             wc_FreeRsaKey
> ```
> 
> Those functions are only present when building the WolfSSL library with
> the keygen supports (`--enable-keygen`).
> 
> This patch change the selected package to enable all the option of
> WolfSSL, which include the keygen as well.
> 
> Fixes:
>    - https://autobuild.buildroot.org/results/d0e/d0e94f501ad1afd25ae4112443f9af101dfa5dea
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index a62688f9c3..22caa2a573 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -59,6 +59,7 @@ config BR2_PACKAGE_STRONGSWAN_GMP
>   config BR2_PACKAGE_STRONGSWAN_WOLFSSL
>   	bool "wolfssl"
>   	select BR2_PACKAGE_WOLFSSL
> +	select BR2_PACKAGE_WOLFSSL_ALL
>   
>   endchoice
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
