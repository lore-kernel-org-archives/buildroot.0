Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F75C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 772C940AE3;
	Sat, 31 May 2025 16:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-x1RukadGZq; Sat, 31 May 2025 16:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FA440AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FA440AED;
	Sat, 31 May 2025 16:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B547B235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BFA182BC4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi7P1_oBGq8S for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:41:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7FCE82B1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7FCE82B1E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7FCE82B1E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C532F1C00B7; Sat, 31 May 2025 18:41:36 +0200 (CEST)
Message-ID: <c3de9bae-98f9-432f-b4db-9deebee2ac33@rnout.be>
Date: Sat, 31 May 2025 18:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250511161400.3195076-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250511161400.3195076-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709696; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hH7gBFeV0TtiMdtEPgdnilNzvE5ezbjj2f7kWRL0X4o=;
 b=I+4w/CoNg7/euFCuJ944s5VmBUzQhNJlj5Q3g/z71B3gZzS9b0h2KyrIPLMX4c8Z166ny+
 4937WXTJeGGDmWuMygEgjtStjhsfpRZXD6kIFMle+ANRZL7VZbLlfaeKrPhH2oTwwo83FC
 2Sowwp039xPQyURRbcH59D4rq0jt0zfF9PJQ9qGwBuy0NnSheDtoyEnLLEo1qYW+XXzETf
 uGJqozxD8QWl2aSWVQnJudUN198j9xF/v7WHQDFgqg6tPqQLmo+uevIY6XSxVt/LtUUw1S
 0xtbIVVrxBxKkdK5B11UclcFDlYHY1GbECOjQlUxgLdAE1Qxjpl3wepRmJrdFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=I+4w/CoN
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.21
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



On 11/05/2025 18:14, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#8.3.21
> 
> Release notes:
> https://news-web.php.net/php.announce/457
> https://news-web.php.net/php.announce/458
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/php/php.hash | 2 +-
>   package/php/php.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index ba9c5bb468..8e3be2dbe1 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>   # From https://www.php.net/downloads.php
> -sha256  976e4077dd25bec96b5dfe8938052d243bbd838f95368a204896eff12756545f  php-8.3.19.tar.xz
> +sha256  4dfb329f209a552c3716394fc123bb62e80a468b55ce27fc8cb0fd5f30b9dcd6  php-8.3.21.tar.xz
>   
>   # License file
>   sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 374fdb2c69..ad42e57d72 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PHP_VERSION = 8.3.19
> +PHP_VERSION = 8.3.21
>   PHP_SITE = https://www.php.net/distributions
>   PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>   PHP_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
