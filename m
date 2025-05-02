Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C48C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093E783D53;
	Fri,  2 May 2025 10:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCHtcZmnX3qG; Fri,  2 May 2025 10:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B031820B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B031820B7;
	Fri,  2 May 2025 10:42:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C71EEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A8D417F4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awAv5ziwvdkd for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4A6E415A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A6E415A5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4A6E415A5
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D563A1C1113; Fri,  2 May 2025 12:42:32 +0200 (CEST)
Message-ID: <9de40e6e-9c51-4a61-976a-707d3b45e63a@rnout.be>
Date: Fri, 2 May 2025 12:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <574e9d889ce1afba12af992365310070f3e2cffe.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <574e9d889ce1afba12af992365310070f3e2cffe.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182553; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PrwPZKXKA8MfM4MzHUultFkJdbLnvEUkbKcXyGRLgn0=;
 b=U1lXCf48wTWHj5/bg8eJjepHp7wxD0qXRBUV1iysklK+4BNPcsHb36WojxgwQklZoA3ngo
 p8vm4xoWMWntutNVKEros8FyCEuOZ5wy+SWCg5C58jpu8duyXmr57wAxueFGyURh2OeZAe
 IYtPbKG60SCdwhnfF+E6r61+mD0AzS9ZH518z/fDrrycAy7MPB2v+J6RD+CVy+6SpzIq16
 VlrOE8MWGycf8wPStqFBaKB5J8EDhGtxX/DNIz6qLVBpqBFUV7sQDH3io0RLvjHilu/WGG
 EJWG3vAnXoqrMQF1sW72iA4FzxoYltwVnxj00qGgW8B7ckobcDrG9BM093TzHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=U1lXCf48
Subject: Re: [Buildroot] [PATCH 28/29 v2] support/download/git: use
 FOO_DL_OPTS
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



On 09/04/2025 22:03, Yann E. MORIN wrote:
> The manual states that FOO_DL_OPTS are valid for all the different
> download backends, but that is not the case: at least the git backend
> does not use them (it does not fail, it just ignores them).
> 
> Accept FOO_DL_OPTS in the git backend, and pass them to 'git fetch'.
> There is no way that we can pass such options to submodules or lfs,
> though.
> 
> Update the manual accordingly.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/adding-packages-generic.adoc | 4 +++-
>   support/download/git                     | 6 +++---
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
> index f0b0508f53..7e2e066c16 100644
> --- a/docs/manual/adding-packages-generic.adoc
> +++ b/docs/manual/adding-packages-generic.adoc
> @@ -270,7 +270,9 @@ not and can not work as people would expect it should:
>     server-side checking for user logins and passwords, or to use a proxy.
>     All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
>     valid options depend on the download method (consult the man page
> -  for the respective download utilities).
> +  for the respective download utilities). For git, +FOO_DL_OPTS+ will
> +  only be passed to `git fetch` and no other git command (esp. not to
> +  `git lfs fetch` or `git submodule update`).
>   
>   * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
>     files that Buildroot should download. If an entry contains +://+
> diff --git a/support/download/git b/support/download/git
> index 8123bc3153..fdc00607cc 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -133,8 +133,8 @@ fi
>   _git remote set-url origin "'${uri}'"
>   
>   printf "Fetching all references\n"
> -_git fetch origin
> -_git fetch origin -t -f
> +_git fetch "${@}" origin
> +_git fetch "${@}" origin -t -f
>   
>   # Try to get the special refs exposed by some forges (pull-requests for
>   # github, changes for gerrit...). There is no easy way to know whether
> @@ -143,7 +143,7 @@ _git fetch origin -t -f
>   # below, if there is an issue anyway. Since most of the cset we're gonna
>   # have to clone are not such special refs, consign the output to oblivion
>   # so as not to alarm unsuspecting users, but still trace it as a warning.
> -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
> +if ! _git fetch "${@}" origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>       printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
>   fi
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
