Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B628EC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B9641289;
	Fri,  2 May 2025 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwKmyXvALqoW; Fri,  2 May 2025 10:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F40141548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F40141548;
	Fri,  2 May 2025 10:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867F3EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3CF81E11
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhUQYco0xFDd for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8480083D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8480083D72
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8480083D72
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A96A81C1112; Fri,  2 May 2025 12:32:42 +0200 (CEST)
Message-ID: <6330daf5-a769-4c0b-83f7-56674ff68832@rnout.be>
Date: Fri, 2 May 2025 12:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250327182853.944114-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250327182853.944114-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181962; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3IPLUv9xXRNMsR6Kmvp7MgaVInW7IUeBXAkEKFCAXTI=;
 b=GI3GcEG83vcNLyJbU83QbLPYaD2POq1FI5fyw1zqiBShPaAqRF3KWZ1QRnA6HPzhBXZpLW
 L4aigTWUNIVZep7AJEWtUV8mbTbZK/hllUfG1kmz3jHmccCdi48SE8SuMZ8sSSwGRVTOoy
 JF9ivEXuaOkwYvbGeFrYNz7Vtpep5dzp8MakOgo8fkIq6QTOswoKBsGDvIS0uWcJMhimV4
 gXg+v3pcw0QWkw0n7QlWQj6FLBAtRSwDlnzzjoGCwSoQp9azKeFgqjBB0PFo3L6Fc+aBDk
 OkMR/yQD3et4QwomEgJR2LMYI8aeS/aOvWjUTbW1drm+HSUwsL+d/vClVYc/Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GI3GcEG8
Subject: Re: [Buildroot] [PATCH] package/samba4: bump version to 4.21.4
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



On 27/03/2025 19:28, Bernd Kuhls wrote:
> Release notes: https://www.samba.org/samba/history/samba-4.21.4.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/samba4/samba4.hash | 4 ++--
>   package/samba4/samba4.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 144894fd60..86b11b4d1f 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.21.3.tar.asc
> -sha256  ae2179a613e7a5d4088735ab100d4ca1cae0f92374d6307e22eaec13ad90125c  samba-4.21.3.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.21.4.tar.asc
> +sha256  50acf030db0ce6be1ee8a6c3a7636e54576c60a7f814e64becfa840f7b30eced  samba-4.21.4.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index 70200279a4..ac3141f3d9 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SAMBA4_VERSION = 4.21.3
> +SAMBA4_VERSION = 4.21.4
>   SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>   SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>   SAMBA4_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
