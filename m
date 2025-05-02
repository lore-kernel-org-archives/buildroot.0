Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4935C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6B341600;
	Fri,  2 May 2025 10:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1F7L5aWlK9z; Fri,  2 May 2025 10:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE0E411E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE0E411E6;
	Fri,  2 May 2025 10:56:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAEA1229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC08C41584
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51dCrOeRohZg for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94FF440E0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94FF440E0B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94FF440E0B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B02A1C0D8C; Fri,  2 May 2025 12:56:26 +0200 (CEST)
Message-ID: <0194d7a7-2947-4859-ab9d-0e082d2d9936@rnout.be>
Date: Fri, 2 May 2025 12:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241201150713.13429-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241201150713.13429-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183386; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oxeISkFHdTMvbFpLx6kJ+/gTrD0U8jfe4MxGaZnl4SM=;
 b=INpaFSXubinlE/7Q5VxOzbpeJSJpJ9+ErklPjd5O8l5aCybDSd3QcMSBNYKfCCFROu8K9q
 KJr+ymqWdf8cRxCIdYiuQe/QjxGeGn/XEP+9pQm/92Rf+Juy7dOdYRU+lOOqocXoDy1UpQ
 oTmOFTIAfkSXjL1Z580r8YbZ7DzplNaAs9xqOsPbSzZTEBLpYa6d56gIxQgT7SRHXBRKOh
 MY7NIfJN5Zu4jnOiO4eofaNUrVTAvWaw/3Gf6ZcWXTLSe7obBAPhylFCR+b9VBn2i1QhJK
 5So+d6xOKxq9h2umsSSHzNjsIr+Q57YR3vjCCm8Xhe0aCAJ+oH5TkaphMxSizA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=INpaFSXu
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/12/2024 16:07, Julien Olivain wrote:
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

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1567957114
> https://gitlab.com/jolivain/buildroot/-/jobs/8512987847
> ---
>   package/file/Config.in | 2 +-
>   package/file/file.hash | 5 ++---
>   package/file/file.mk   | 6 +++---
>   3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/file/Config.in b/package/file/Config.in
> index edc4d874b2..6b5326f660 100644
> --- a/package/file/Config.in
> +++ b/package/file/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_FILE
>   	  Program to identify a file's format by scanning binary data
>   	  for known patterns.
>   
> -	  http://www.darwinsys.com/file/
> +	  https://www.darwinsys.com/file/
> diff --git a/package/file/file.hash b/package/file/file.hash
> index 7c15569c09..53c4d5c4db 100644
> --- a/package/file/file.hash
> +++ b/package/file/file.hash
> @@ -1,7 +1,6 @@
>   # Locally calculated after verifying signature
> -# https://astron.com/pub/file/file-5.45.tar.gz.asc
> +# https://astron.com/pub/file/file-5.46.tar.gz.asc
>   # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
> -sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
> +sha256  c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088  file-5.46.tar.gz
>   sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
> -sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
>   sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
> diff --git a/package/file/file.mk b/package/file/file.mk
> index 27d9181d76..a33b306c4c 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -FILE_VERSION = 5.45
> +FILE_VERSION = 5.46
>   FILE_SITE = https://astron.com/pub/file
> -FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
> -FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
> +FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
> +FILE_LICENSE_FILES = COPYING src/vasprintf.c
>   FILE_CPE_ID_VALID = YES
>   
>   FILE_AUTORECONF = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
