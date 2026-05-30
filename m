Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45CCD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D37C80F3E;
	Sat, 30 May 2026 17:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocxyabE0IKq3; Sat, 30 May 2026 17:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F789853CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780161812;
	bh=XDQXIqOQTFeSc/TAnINcg/ArJ1wKrsiiopvapmAWjRc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qoBySIsnmUFGvglqkNGTdzKJkwABE75qqNPlPbZEl80MO+LcJ0TpiG08lgNFNtZ4J
	 rkuDM4WgiYkSd0Diu0UYEQ4/GH5X3ERWAGPGnuv/QpcwIIlHO0CdppwrwgDBu3aR9j
	 suqLofaPA+A+og8qN9jXR00zAv8isaxXsSUUOsvVyB2ILtCz44Fu6pGXTaVgrpXLT2
	 aE4i7BXoq+ulLzOyo/VXGsdDl5LJAJjpR16oP+zRjNU9G7VylcyxG9tmhnIWT1VedC
	 dbr/nvubP/5ocZzDntGOj/vaPUx+NTYw1dQQJgZzL5H0eC9n9ynDlpJheSQEapjm96
	 R5SAheOi1x0eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F789853CB;
	Sat, 30 May 2026 17:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 967E1F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88296853CB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUiz5sPL0Whq for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8724480F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8724480F3E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8724480F3E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D67BB97C654; Sat, 30 May 2026 19:23:28 +0200 (CEST)
Message-ID: <804b4e53-ff93-43ed-a1a5-a9b610203be7@rnout.be>
Date: Sat, 30 May 2026 19:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260530104041.610019-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260530104041.610019-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780161808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=fziJwnLoJTKdzrdLo95vypW/tlSyElq+dFA2mhumUM8=;
 b=cBfUUXBKSIXtr6YJP5wKQ70rlrbFfZT8fxm23aAwa3xop2/4+eQ+Wu9Aw7pxaMVSYMqLvV
 g2bgoT4H10aLT4t9h0SYdeCthIUq8tiHCODKbd1KwZF5AY+Y6m3QrfwRsBQqPwmeo+V6QZ
 erPHFoIvK3oOpQWzDs5Kr0Ls2YY3SzgbhoXQFFZcIJLuvejSuHmG8RFhl5+gEkh6DoMnPi
 WKjNzaS2OSIYg+6D76JSVt2l0eSskMc3q/GOQTuKIoYVsbki6UURV7OOzudGiTZoJh7XQ9
 3Z8a7/M5ed8IkU8sMQKm4qjLrsQbxGZJhyi3R25yvlVrCqdWDKu+SnB4mJx+5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cBfUUXBK
Subject: Re: [Buildroot] [PATCH v3 1/1] package/cairo: Fix build
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



On 30/05/2026 12:40, Bernd Kuhls wrote:
> Buildroot commit 29888ab35e047099d239f266b7b565cd4023503e bumped cairo
> to version 1.18.2.
> 
> This version includes commit
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/87f7c60bf7c20079c34cfc54e4db05920d14db56
> "Add support for C11 atomics"
> 
> which causes build errors:
> 
> ../src/cairo-image-source.c: In function '_pixman_transparent_image':
> ../src/cairo-image-source.c:89:40: error: passing argument 1 of '_cairo_atomic_ptr_cmpxchg_impl'
>   from incompatible pointer type [-Wincompatible-pointer-types]
>     89 |         if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,
> 
> Fixes:
> 1.18.2: https://autobuild.buildroot.net/results/5d4/5d4cd38d71008f385f92577b07f21dcfc3c19b38/
> 1.18.4: https://autobuild.buildroot.net/results/0e9/0e962c66e1e96b5899e87c13ace824379adc09f9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v3: Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/fccaeb11d27ac32dadd0807f631c3d03ec637908
> 
> v2: updated patch description, git-formatted patch and pointed source
>      URL to versioned git tree
> 
>   ...ilence-some-Wincompatible-pointer-ty.patch | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
> 
> diff --git a/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
> new file mode 100644
> index 0000000000..95f7924f12
> --- /dev/null
> +++ b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
> @@ -0,0 +1,49 @@
> +From 78258169cf0c380754804b5835203a199ba8efab Mon Sep 17 00:00:00 2001
> +From: Stephan Bergmann <stephan.bergmann@collabora.com>
> +Date: Mon, 22 Sep 2025 17:08:36 +0200
> +Subject: [PATCH] external/cairo: Silence some -Wincompatible-pointer-types
> +
> +Downloaded from
> +https://github.com/LibreOffice/core/blob/36e0812a01ae5b94a1bb7549b0db20812d0f821a/external/cairo/cairo/Wincompatible-pointer-types.patch.0
> +
> +Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/921
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/cairo-image-source.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/cairo-image-source.c b/src/cairo-image-source.c
> +index eaf72e2cc..05ffa5660 100644
> +--- a/src/cairo-image-source.c
> ++++ b/src/cairo-image-source.c
> +@@ -86,7 +86,7 @@ _pixman_transparent_image (void)
> + 	if (unlikely (image == NULL))
> + 	    return NULL;
> +
> +-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,
> ++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_transparent_image,
> + 				       NULL, image))
> + 	{
> + 	    pixman_image_ref (image);
> +@@ -118,7 +118,7 @@ _pixman_black_image (void)
> + 	if (unlikely (image == NULL))
> + 	    return NULL;
> +
> +-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_black_image,
> ++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_black_image,
> + 				       NULL, image))
> + 	{
> + 	    pixman_image_ref (image);
> +@@ -150,7 +150,7 @@ _pixman_white_image (void)
> + 	if (unlikely (image == NULL))
> + 	    return NULL;
> +
> +-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_white_image,
> ++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_white_image,
> + 				       NULL, image))
> + 	{
> + 	    pixman_image_ref (image);
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
