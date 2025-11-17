Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCDACEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403E960EB2;
	Mon, 17 Nov 2025 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWJoVXabhCjN; Mon, 17 Nov 2025 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 697EE60F13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 697EE60F13;
	Mon, 17 Nov 2025 19:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5768A1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49B7D60ECB
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3tyLh6uD1xg for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 385B160EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385B160EB2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 385B160EB2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59E53B9798F4; Mon, 17 Nov 2025 20:54:40 +0100 (CET)
Message-ID: <be8a50ad-5097-46c4-977e-e04b2cdc4bff@rnout.be>
Date: Mon, 17 Nov 2025 20:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20251027212015.47362-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027212015.47362-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409280; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YPflxD6ozPdOOoF2jIfzFVkjxWxgKE+Cx8HLGXKnZhc=;
 b=Fxim7vQdxPMOVKlY/TsgB6ppAF+LF4KaWG1IRpLnqt2QgwRqSC6XyS2KoyOUOJT3+LQLph
 oMSeplO0UJCKiqhlwcXsE8qFOBbG8QkpQ6uc8psfk0Rr4+eMwbEP0sUO16o+DaOn1TjX3N
 aVsS4+JDeBNdZ5aD3F5A31k8QVTiAFBLmz9ciCb64bWWYr0rP92nkw2QioQmVR3rS29zfY
 Vg/VxWc3lcO/u36tLHkLkmpoL8QOzq5uTgFZHwS38cqfU5fdAk3TNVgQcRUhZ7yjbhEbXo
 hL3DGNwHd+4c+XgajvxIREqKjT7epybX+aSgi0IYhKVBUKj9k7trrbFYLwvUiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Fxim7vQd
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-8
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



On 27/10/2025 22:20, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>    - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-3...7.1.2-8
> 
> Fixes the following vulnerability:
> 
> - CVE-2025-62171
> 
>      ImageMagick is an open source software suite for displaying,
>      converting, and editing raster image files. In ImageMagick versions
>      prior to 7.1.2-7 and 6.9.13-32, an integer overflow vulnerability
>      exists in the BMP decoder on 32-bit systems. The vulnerability
>      occurs in coders/bmp.c when calculating the extent value by
>      multiplying image columns by bits per pixel. On 32-bit systems with
>      size_t of 4 bytes, a malicious BMP file with specific dimensions can
>      cause this multiplication to overflow and wrap to zero. The overflow
>      check added to address CVE-2025-57803 is placed after the overflow
>      occurs, making it ineffective. A specially crafted 58-byte BMP file
>      with width set to 536,870,912 and 32 bits per pixel can trigger this
>      overflow, causing the bytes_per_line calculation to become zero.
>      This vulnerability only affects 32-bit builds of ImageMagick where
>      default resource limits for width, height, and area have been
>      manually increased beyond their defaults. 64-bit systems with size_t
>      of 8 bytes are not vulnerable, and systems using default ImageMagick
>      resource limits are not vulnerable. The vulnerability is fixed in
>      versions 7.1.2-7 and 6.9.13-32.
> 
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-62171
>    - https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm
>    - https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/imagemagick/imagemagick.hash | 2 +-
>   package/imagemagick/imagemagick.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index f260a0e0fb..3dbea6d8bc 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
> +sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
>   sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 30cacc7f1a..4e6a810631 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IMAGEMAGICK_VERSION = 7.1.2-3
> +IMAGEMAGICK_VERSION = 7.1.2-8
>   IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>   IMAGEMAGICK_LICENSE = Apache-2.0
>   IMAGEMAGICK_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
