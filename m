Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C1C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF6F413B9;
	Thu, 17 Jul 2025 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vebdyHuLtEsV; Thu, 17 Jul 2025 20:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 931394119E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931394119E;
	Thu, 17 Jul 2025 20:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCABDA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82E3F607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a16y-kZaM8sr for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73904607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73904607B2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73904607B2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:07:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A4273B977A8D; Thu, 17 Jul 2025 22:07:37 +0200 (CEST)
Message-ID: <cf3f4a50-f06c-4d64-b1de-a0b5bc7986cc@rnout.be>
Date: Thu, 17 Jul 2025 22:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20250711134338.2817791-1-aperez@igalia.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250711134338.2817791-1-aperez@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782857; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=o7Ua8ykH2CP5Gc2cnNChuP/BUbTX92237zlgX0UtFd4=;
 b=Ba2F2fOPIKvQQ1WMJsQGOj03tirHPjQrfRKiytYKw+FzKLmCLs+GQId8F3nmkpQ9ZuAkaJ
 juBF0k2w1KbBXV/KTykugQmebrShK34lR8KbKH8Ihmy+DmdOG5CfnjaoJ8YKgD/mYsWX5C
 o2fcVDxfewf+22i/j+pUYa/Vj+zOITA+Qt6Gfp6e3DVR709div44maRlLtv7CqxVFiY2If
 p0ygfb9WoHy9qb3npqd5Dmgtn6CWQAD8+a7b9DjnqwyRinXmgJjRSeXIDxW2ilpYRDwpEd
 FnGilNhLPKN4Eg6zTaUkfdp6NEt9/jZe0S8I9iWcH50k+02sVLVsxiTqLjkw5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ba2F2fOP
Subject: Re: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.16.0
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



On 11/07/2025 15:43, Adrian Perez de Castro wrote:
> This maintenance release solves build issues and memory leaks.
> Release notes:
> 
>    https://wpewebkit.org/release/wpebackend-fdo-1.16.0.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to 2025.05.x, thanks. Not to 2025.02.x because it's too much of a 
version jump.

  Regards,
  Arnout

> ---
>   package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
>   package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
> index 5055998ab7..f0578808c4 100644
> --- a/package/wpebackend-fdo/wpebackend-fdo.hash
> +++ b/package/wpebackend-fdo/wpebackend-fdo.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.3.tar.xz.sums
> -md5  ab73398b1e35495977e50bee103969d2  wpebackend-fdo-1.14.3.tar.xz
> -sha1  2d2945df15cc1efa957657fa727f3bc4c6f580bb  wpebackend-fdo-1.14.3.tar.xz
> -sha256  10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c  wpebackend-fdo-1.14.3.tar.xz
> +# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
> +md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
> +sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
> +sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
>   
>   # Hashes for license files:
>   sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
> diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
> index dbabacf498..e5972754f6 100644
> --- a/package/wpebackend-fdo/wpebackend-fdo.mk
> +++ b/package/wpebackend-fdo/wpebackend-fdo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WPEBACKEND_FDO_VERSION = 1.14.3
> +WPEBACKEND_FDO_VERSION = 1.16.0
>   WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
>   WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
>   WPEBACKEND_FDO_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
