Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A7C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3674119D;
	Thu, 17 Jul 2025 20:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4TddrW8uII8; Thu, 17 Jul 2025 20:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F4D641148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F4D641148;
	Thu, 17 Jul 2025 20:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4103226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ACEB60762
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kJtQtAnhBdy for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9F106066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F106066A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9F106066A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7F18B977A8D; Thu, 17 Jul 2025 22:40:40 +0200 (CEST)
Message-ID: <aad174d8-c628-45bd-a5cf-3f1ea665ca73@rnout.be>
Date: Thu, 17 Jul 2025 22:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715210509.544485-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715210509.544485-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784840; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=jbWkAjaKmRr2BQ3a9ieloxxJOpj4K5dii/B0Q1rVP98=;
 b=MnGQiTok6xDUX8tQzHkgkopx0IEWc+B6NW7TetTO0vVEAjLset1oS33f4MNG+EEnGdbwdL
 Ip1yh5wQ4l3ynZMSUDlL77w4Gm3A31p2wif19gm6Io/+qAilwLbM4mL/9vVBp3iYdEfFBu
 lz6+cQaurusoqmDAbmtNMFWRxOa4vbK9g3FTXNJy/Qjy1odyvuDI6OV5+l+Dvlp+JQwuMa
 fxBJiX5EPX92cJVUbXUFYniL3m5rWQ3/gH9eRTeQyGVs4tk4mU9dIxc4KEVtNg2lMcLIfh
 j+AUWnGeEs7/ZAD5GLsLOn7GLlsj7dwwWUT/JPMOywQSxCz65dDNZpr3mfOCtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MnGQiTok
Subject: Re: [Buildroot] [PATCH 1/1] package/libjcat: bump to version 0.2.3
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



On 15/07/2025 23:05, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libjcat/libjcat.hash | 2 +-
>   package/libjcat/libjcat.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
> index b6dc8d2f69..8f50f8798f 100644
> --- a/package/libjcat/libjcat.hash
> +++ b/package/libjcat/libjcat.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
> +sha256  f2f115aad8a8f16b8dde1ed55de7abacb91d0878539aa29b2b60854b499db639  libjcat-0.2.3.tar.xz
>   sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
> diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
> index c365c1914b..4a7f304c2a 100644
> --- a/package/libjcat/libjcat.mk
> +++ b/package/libjcat/libjcat.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBJCAT_VERSION = 0.2.1
> +LIBJCAT_VERSION = 0.2.3
>   LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
>   LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
>   LIBJCAT_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
