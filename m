Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C5ED49779
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 16:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94ECD6160F;
	Sun,  1 Dec 2024 16:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2uGkIilbxFT; Sun,  1 Dec 2024 16:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5AB6165C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5AB6165C;
	Sun,  1 Dec 2024 16:45:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F54F976
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 708CE4EB9E
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrEOoqsh8jTi for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 16:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F2484E818
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F2484E818
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F2484E818
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:45:18 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:f81b:86c2:43b8:29cc])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 10D8178035E;
 Sun,  1 Dec 2024 17:45:14 +0100 (CET)
Date: Sun, 1 Dec 2024 17:45:13 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <n5t32hsynyezkyfc7v7wzh6fws25lcjalofuaa7ldz3tbh5uh2@gjeikseobsho>
References: <20241201150713.13429-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241201150713.13429-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733071515;
 bh=PatKq2t0Uk6YTLKggKx6FKW5Z/JmzQ4Nu8nk8buCeMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cc31X5m981Ib0O6xwsNX9KmqnnVi/D1GIIpgxu6x/EW6avCevASXqHXHDKqAhZd2T
 /AG8aAwcdnYBlxZTqU45m7lRsGjRXHE9OUNivh97lp3mdAOGXALYqxT17mVMuwlVxg
 BjQxBJbmsFvuMH6xTQwSZKFTlDFZSuq01xq4IFLgJsKuip7/JKPwzbPrjD5K6xKAd3
 bAh4/9Yo9W/dmThwNnba5ndwa1vUx7lI18O+10TqwFdnsgkwqDfhOo3vgLf3R2KG3t
 hW3F7LKcb94TyTEtdyQ7X1ogwF9FklyXo/vUHp04hN00IQHVSvq6HM5ptB4p7w34ha
 /8vLf6OJyuZgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cc31X5m9
Subject: Re: [Buildroot] [PATCH next 1/1] package/file: bump version to 5.46
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sun, Dec 01, 2024 at 04:07:13PM UTC, Julien Olivain wrote:
> See release announce [1].
> 
> The src/mygetopt.h file license was updated from BSD-4-Clause to
> BSD-2-Clause in upstream commit [2]. This change makes this file using
> the same license as most other files. So this commit removes the
> license entry for this file and update the _LICENSE accordingly.
> 
> This commit also replaces the mention "one file" on BSD-3-Clause, to
> the actual file name using it, which is "vasprintf.c".
> 
> This commit also updates the Config.in package homepage URL,
> to use https.
> 
> [1] https://mailman.astron.com/pipermail/file/2024-November/001435.html
> [2] https://github.com/file/file/commit/d605bb40478c4ce94aef88316d3a928b3da746f5
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks and it is a nice review of the licenses.

Reviewed-by: Vincent Jardin <vjardin@free.fr>

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1567957114
> https://gitlab.com/jolivain/buildroot/-/jobs/8512987847
> ---
>  package/file/Config.in | 2 +-
>  package/file/file.hash | 5 ++---
>  package/file/file.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/file/Config.in b/package/file/Config.in
> index edc4d874b2..6b5326f660 100644
> --- a/package/file/Config.in
> +++ b/package/file/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_FILE
>  	  Program to identify a file's format by scanning binary data
>  	  for known patterns.
>  
> -	  http://www.darwinsys.com/file/
> +	  https://www.darwinsys.com/file/
> diff --git a/package/file/file.hash b/package/file/file.hash
> index 7c15569c09..53c4d5c4db 100644
> --- a/package/file/file.hash
> +++ b/package/file/file.hash
> @@ -1,7 +1,6 @@
>  # Locally calculated after verifying signature
> -# https://astron.com/pub/file/file-5.45.tar.gz.asc
> +# https://astron.com/pub/file/file-5.46.tar.gz.asc
>  # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
> -sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
> +sha256  c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088  file-5.46.tar.gz
>  sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
> -sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
>  sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
> diff --git a/package/file/file.mk b/package/file/file.mk
> index 27d9181d76..a33b306c4c 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -FILE_VERSION = 5.45
> +FILE_VERSION = 5.46
>  FILE_SITE = https://astron.com/pub/file
> -FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
> -FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
> +FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
> +FILE_LICENSE_FILES = COPYING src/vasprintf.c
>  FILE_CPE_ID_VALID = YES
>  
>  FILE_AUTORECONF = YES
> -- 
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
