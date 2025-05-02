Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE1C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA0383C88;
	Fri,  2 May 2025 10:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL75j4Nxx0Vg; Fri,  2 May 2025 10:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B936083CAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B936083CAF;
	Fri,  2 May 2025 10:20:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F13EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B3541503
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz10XTw_ETI1 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC7A040E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7A040E23
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC7A040E23
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37F131C0FAD; Fri,  2 May 2025 12:20:07 +0200 (CEST)
Message-ID: <5ca63860-42b6-4627-bf6c-aa73e5aeff62@rnout.be>
Date: Fri, 2 May 2025 12:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20250414053258.465718-1-troglobit@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414053258.465718-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181211; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fmLpq6wWNPGx8qL3AF+o4J1WRV8LvdDVZne8UxHXAls=;
 b=f2NBSoVf6tcgLJ9Ar9f8uNNV3W9rpLIiyyp/2XcIYGpxNWjY6ra06nLS6MtGkVXfkQxz+F
 tDyNCKCEvXl+Znku6UXaQYLkHClJj5eGsTi1CnRFwyjqStF7UT3xP9d6yyWryjKAKu7wVV
 nZ0b9cscAPTws0jmXUpzDZOeKAzvmfc04s6hKmCoCtHc58ogG8Q7mh3YGELhHl6eM1/Iz7
 GSQUlnjOf3GbnfNrOzv5THjdryRASFCahe6lz/Uy3F570JjWDMeKitRsuERo9Rzs3+OgR1
 Pv9yv1jZ0BpxuA7BCJ7UJWmZ6LvtzZD7EztmtzjIX20bu4VFImymxt81CF7kAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=f2NBSoVf
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.2
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



On 14/04/2025 07:32, Joachim Wiberg wrote:
>  From https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
> 
>   - logger: improved error handling for invalid arguments to -p and -o
>   - Fix regression in v2.7.1,  allow '.' in tag names, eg. in.tftpd
>   - Fix various typos in the documentation
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/sysklogd/sysklogd.hash | 4 ++--
>   package/sysklogd/sysklogd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index 645bc6a0ae..c74d7f9ba6 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,4 +1,4 @@
> -# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
> -sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
> +# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
> +sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
>   # Locally calculated
>   sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index a3e27fd17b..baafc38083 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSKLOGD_VERSION = 2.7.1
> +SYSKLOGD_VERSION = 2.7.2
>   SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>   SYSKLOGD_LICENSE = BSD-3-Clause
>   SYSKLOGD_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
