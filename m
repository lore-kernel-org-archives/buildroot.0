Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55961C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2554740864;
	Thu, 17 Jul 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCthtOm_mz97; Thu, 17 Jul 2025 20:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C775407D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C775407D4;
	Thu, 17 Jul 2025 20:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16126226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08AC2607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_mQM_HCOtqF for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 159FD6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 159FD6060C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 159FD6060C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 029DCB977A8D; Thu, 17 Jul 2025 22:16:46 +0200 (CEST)
Message-ID: <5366f9a4-8197-4ed4-a063-aa8f514423fc@rnout.be>
Date: Thu, 17 Jul 2025 22:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20250711142105.2822708-1-aperez@igalia.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250711142105.2822708-1-aperez@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783407; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=B9gx6+wwONXwt/wWN2UrpBRScGTGIxbHsSWA7bsSvCY=;
 b=Hdp5TooNDPkcqp7BBf3UNspSB0oxUgvdo+OlolDbQO77ykWy6gkVCBdFi4kznixf6HunlA
 B1+7coubhvgDevYZgBtEa34la+PGc7NiMiSZSQzvXqrj4ddQDTtqhotU239a7gWZ0MQVz8
 1i/xD6cSSzcGDJLDPS/5uLNWx6W9UpbqIEML+YsNwUlyJ0nLdakHQzUBXZBDgaId1Aj6ad
 Xg+i3c8fT/Pb8ZjeDM7CJs9Fg85yLH+dySIJZVwRGWKAEwUhkoQa8XUkThqzWUwJt+Dx7Y
 JEcaLwQxG7AQdt7WzNxqzb1MWfjNX8fwi8h1NuwEMzRaujAN0QqGOhiPrzek6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Hdp5TooN
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: bump to version 0.10.1
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



On 11/07/2025 16:21, Adrian Perez de Castro wrote:
> This is a bugfix release which includes a few improvements and fixes
> leaks of Unix signal futures. Release notes:
> 
>    https://gitlab.gnome.org/GNOME/libdex/-/blob/0.10.1/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/libdex/libdex.hash | 4 ++--
>   package/libdex/libdex.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
> index fa6ff292a3..6d78b0842a 100644
> --- a/package/libdex/libdex.hash
> +++ b/package/libdex/libdex.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.0.sha256sum
> -sha256  98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1  libdex-0.10.0.tar.xz
> +# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.1.sha256sum
> +sha256  7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6  libdex-0.10.1.tar.xz
>   
>   # License files
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
> index e400757c2a..aea4c60ab7 100644
> --- a/package/libdex/libdex.mk
> +++ b/package/libdex/libdex.mk
> @@ -6,7 +6,7 @@
>   
>   # The middle number is even for stable releases, odd for development ones.
>   LIBDEX_VERSION_MAJOR = 0.10
> -LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
> +LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
>   LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
>   LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
>   LIBDEX_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
