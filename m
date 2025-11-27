Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F004D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37287616F8;
	Thu, 27 Nov 2025 19:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjd0oJqkZCPs; Thu, 27 Nov 2025 19:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E4C608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E4C608C2;
	Thu, 27 Nov 2025 19:59:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C04322A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B22FF41409
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSoum6unyY48 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0D9F41407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D9F41407
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0D9F41407
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:59:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8C71B979CA9; Thu, 27 Nov 2025 20:59:06 +0100 (CET)
Message-ID: <12301b89-ac61-4f78-94be-d7fd352973d6@rnout.be>
Date: Thu, 27 Nov 2025 20:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251115225332.1826848-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251115225332.1826848-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273546; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=AtCQesFrXmUfBWlD9U68cDONLLUgOyLE7gU8GKqZL/Q=;
 b=cFtC/r/nQirAYTE99bGljfFWGVwlzhjbYfU9yzOkU8NlHy4/p14volyehw3gWDRCUkCby1
 8FSa0KjXGpfiJF+4rgJNY+tgnMQv54VPxdc7BKzPxz41W4j2PU9cN+YpBg9oygd194iCDE
 UzfrFfWXwYKwIN24WYI5MC9kP1OFtiVdaAw4BX+WQwIT/SjkwMQ+8qSpB0GslN6Z7D73LA
 hCAXEg69YK585BcqRF+gcXZfIcQ1HNo8j2qJkDC/qk1vDZQnZqG3nNCpx5/pcEsugdGt4j
 gihIFQ0b8nCGB8q3aXy9/I7YkHe4/TLkaRyba03Wx94SDl64RKVrpZfm72n1jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cFtC/r/n
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: requires DES
 support in openssl
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



On 15/11/2025 23:53, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/953/953210ed672559e63a96da729182af00ca02c011/
> 
> The build error occured already in 2024:
> https://autobuild.buildroot.net/results/f93/f930c7b3219a57421c1b0a0ef3a4445c19b43e97/
> so backporting this fix seems needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/perl-net-ssleay/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
> index d699e6671d..41c4669370 100644
> --- a/package/perl-net-ssleay/Config.in
> +++ b/package/perl-net-ssleay/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_NET_SSLEAY
>   	bool "perl-net-ssleay"
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>   	help
>   	  Perl extension for using OpenSSL.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
