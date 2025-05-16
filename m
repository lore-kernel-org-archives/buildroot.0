Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F06BC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAAD61354;
	Fri, 16 May 2025 21:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QhEgP3zejbH; Fri, 16 May 2025 21:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2797060ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2797060ABF;
	Fri, 16 May 2025 21:18:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4EE81DE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C637840919
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY8FshrYjyUZ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E24F040912
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24F040912
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E24F040912
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5E7B1C0D8C; Fri, 16 May 2025 23:18:53 +0200 (CEST)
Message-ID: <24533fc5-3cfc-4913-9921-34cbfce732cd@rnout.be>
Date: Fri, 16 May 2025 23:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: stefan.nickl@gmail.com, buildroot@buildroot.org
References: <20250504163611.141654-1-Stefan.Nickl@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250504163611.141654-1-Stefan.Nickl@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747430333; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RxFizy8DASgT81pKjYJwsZNDTS8Plvi3TFT3FmJO5vQ=;
 b=pdWiVvdkBFYYG6YLzEgNdeDAoGevRloY+KTc1qu1UAAZWsysXU5CoBFmQB1LYRnPUkUQK/
 +h1izSRQ4Dq2KGHQsF0dmJO62g8w6lICyjNeRQcMBJ8jyTFs3+lT3ngYY8z9rlemSR5waa
 SACMU6crn2gV51jPAVp54HN0Q6D6afBzuVSE3nS+TlR+OZHmpaxupmQs7Uam1SycAVr1JG
 aZRUBtOiedCHKf5uuBvES9Nsv3tOy8f23H+mHpbvChn9GLR2UpMi3xUNg7min3BrWZmXYR
 roIJv6GO/Do+7p1XQN2ameJ7dNqWN8SsAOGcJ6hiGPZabF+rouXPkXYQbBh13A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pdWiVvdk
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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



On 04/05/2025 18:36, stefan.nickl@gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> Hey there,
> I would like to propose adding a download/site method "gh" based on the
> GitHub CLI tool https://cli.github.com/
> 
> The main advantage is that it also works for private GitHub repositories
> after logging in with "gh auth login".

  Having something github specific is not very nice... We should then also 
provide the equivalent for gitlab, bitbucket, ...


> It is intended as an alternative to pulling with the "git" method, which
> has the drawback of requiring separate ssh keys

  I guess you mean that you need to generate ssh keys for CI?

> and resulting in
> different archives depending on the buildroot version,

  How does gh help with that? The tarballs it produces are not reproducible at 
all... The ones we use happen to be the same all the time because we re-request 
them all the time so they're cached, but there's actually no guarantee for that.


> and passing an
> authentication token on the wget command line, which risks leaking the
> token to third-party servers.

  Well, that's not really a good reason, there are better ways to do that. I've 
created a documentation patch [1] to explain it and put you in Cc.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20250516211429.763211-1-arnout@rnout.be/



> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
> ---
>   Config.in                   |  4 ++++
>   package/pkg-download.mk     |  1 +
>   support/download/dl-wrapper |  2 +-
>   support/download/gh         | 43 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 49 insertions(+), 1 deletion(-)
>   create mode 100755 support/download/gh
> 
> diff --git a/Config.in b/Config.in
> index d730f2034b..cb178ee8d2 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -172,6 +172,10 @@ config BR2_HG
>   	string "Mercurial (hg) command"
>   	default "hg"
>   
> +config BR2_GH
> +	string "GitHub cli command"
> +	default "gh"
> +
>   config BR2_ZCAT
>   	string "zcat command"
>   	default "gzip -d -c"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index cf5959ea95..08b0d420c7 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -111,6 +111,7 @@ define DOWNLOAD
>   	CVS="$(call qstrip,$(BR2_CVS))" \
>   	GIT="$(call qstrip,$(BR2_GIT))" \
>   	HG="$(call qstrip,$(BR2_HG))" \
> +	GH="$(call qstrip,$(BR2_GH))" \
>   	LOCALFILES="$(call qstrip,$(BR2_LOCALFILES))" \
>   	SCP="$(call qstrip,$(BR2_SCP))" \
>   	SFTP="$(call qstrip,$(BR2_SFTP))" \
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 5445aad5a7..a209665b0f 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -95,7 +95,7 @@ main() {
>           backend_urlencode="${uri%%+*}"
>           backend="${backend_urlencode%|*}"
>           case "${backend}" in
> -            git|svn|cvs|bzr|file|scp|hg|sftp) ;;
> +            git|svn|cvs|bzr|file|scp|hg|gh|sftp) ;;
>               ftp|ftps) backend="curl" ;;
>               *) backend="wget" ;;
>           esac
> diff --git a/support/download/gh b/support/download/gh
> new file mode 100755
> index 0000000000..5c36855ccf
> --- /dev/null
> +++ b/support/download/gh
> @@ -0,0 +1,43 @@
> +#!/usr/bin/env bash
> +
> +# We want to catch any unexpected failure, and exit immediately
> +set -e
> +
> +# Download helper for GitHub CLI, to be called from the download wrapper script
> +#
> +# Options:
> +#   -o FILE     Save into file FILE.
> +#   -f FILENAME The filename of the tarball to get at URL
> +#   -u URL      Download file at URL.
> +#
> +# Environment:
> +#   GH        : the gh command to call
> +
> +quiet=
> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> +    case "${OPT}" in
> +    o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
> +    u)  url="${OPTARG}";;
> +    :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
> +    \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
> +    esac
> +done
> +
> +shift $((OPTIND-1)) # Get rid of our options
> +
> +# Caller needs to single-quote its arguments to prevent them from
> +# being expanded a second time (in case there are spaces in them)
> +_gh() {
> +    if [ -z "${quiet}" ]; then
> +        printf '%s ' ${GH} "${@}"; printf '\n'
> +    fi
> +    _plain_gh "$@"
> +}
> +# Note: please keep command below aligned with what is printed above
> +_plain_gh() {
> +    eval ${GH} "${@}"
> +}
> +
> +_gh api -H "'Accept: application/vnd.github.raw+json'" "${@}" \
> +    "'${url}/${filename}'" ">'${output}'"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
