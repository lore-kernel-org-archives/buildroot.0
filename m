Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65764C5B555
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1600861638;
	Wed,  4 Jun 2025 17:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCuNBfEFAZgb; Wed,  4 Jun 2025 17:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52BCE6164F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52BCE6164F;
	Wed,  4 Jun 2025 17:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B2B1A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DEFC808B0
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46l-dbjoEZvp for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3032080A70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3032080A70
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3032080A70
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:15:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52F711C105F; Wed,  4 Jun 2025 19:15:49 +0200 (CEST)
Message-ID: <215bd4a5-0274-4b4b-9a05-5e1e2e97cdd7@rnout.be>
Date: Wed, 4 Jun 2025 19:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Guillaume Chaye <guillaume.chaye@zeetim.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250425164925.314461-1-guillaume.chaye@zeetim.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250425164925.314461-1-guillaume.chaye@zeetim.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749057349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KTY1vaTPT1ADl2lKSXzFmn1OXXU+lCoGHrEExI5/D5g=;
 b=R4Q3CDqZVV1EQUtgOe1o/cnesQnw+YRHwSwmJzk9+i5GSqLcOQyFTr8F45c8QmC6W41Jr4
 qCvb0ADtP69SWf+2kezt7J5iYbboMa9FGvfeQZ7W2A/0RYCtq4i1y/U4PpjGcx4us7xWG8
 PrO976LSFuFXUNvENvPuvXOC8dJeGuIGWmHgxk0hnovA/rt/6akFIBm3p5tEkvyamkbcEd
 es+5os+ru3Anouz8dfhT5jbKOK00PKK3Xx5WXygZqDwNqGVX6x1KMG6h13FDKxyXa6B6Gq
 76Q8I77V4Ua0wgynSETcgfcCmkbalzWzkagdhYcFhadKbeRN3oZ+lW8HGh+aYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=R4Q3CDqZ
Subject: Re: [Buildroot] [PATCHv2 1/1] support/download/dl-wrapper: add
 basic support for smb file download using curl
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



On 25/04/2025 18:49, Guillaume Chaye wrote:
> It allows to download files from smb share in buildroot packages.
> Usage is specified in manual.
> 
> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/adding-packages-generic.adoc | 7 +++++++
>   package/pkg-generic.mk                   | 2 +-
>   support/download/dl-wrapper              | 2 +-
>   3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
> index 7e2e066c16..881beab6e1 100644
> --- a/docs/manual/adding-packages-generic.adoc
> +++ b/docs/manual/adding-packages-generic.adoc
> @@ -337,6 +337,13 @@ not and can not work as people would expect it should:
>        for +local+ packages, no patches are applied. If you need to
>        still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
>        xref:hooks-rsync[].
> +  ** +smb+ for retrieving source code from SMB share. Used by default
> +     when +LIBFOO_SITE+ begins with +smb://+.
> +	 It uses +curl+ as download backend.
> +	 Syntax expected: +LIBFOO_SITE=smb://<server>/<share>/<path>+.
> +	 This method might require to define -u option in +LIBFOO_DL_OPTS+
> +	 For more informations, please refer to the curl documentation in
> +	 +https://curl.se/docs/tutorial.html+
>   
>   * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
>     with the git submodules in the repository.  This is only available
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f22b6e981a..95ff9135bd 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1260,7 +1260,7 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
>   DL_TOOLS_DEPENDENCIES += hg
>   else ifeq ($$($(2)_SITE_METHOD),cvs)
>   DL_TOOLS_DEPENDENCIES += cvs
> -else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
> +else ifneq ($(filter ftp ftps smb,$$($(2)_SITE_METHOD)),)
>   DL_TOOLS_DEPENDENCIES += curl
>   endif # SITE_METHOD
>   
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 5445aad5a7..b70c8edbd9 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -96,7 +96,7 @@ main() {
>           backend="${backend_urlencode%|*}"
>           case "${backend}" in
>               git|svn|cvs|bzr|file|scp|hg|sftp) ;;
> -            ftp|ftps) backend="curl" ;;
> +            ftp|ftps|smb) backend="curl" ;;
>               *) backend="wget" ;;
>           esac
>           uri=${uri#*+}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
