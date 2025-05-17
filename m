Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27814C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F1081444;
	Sat, 17 May 2025 10:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLTkHEYdHqkK; Sat, 17 May 2025 10:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4114981373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4114981373;
	Sat, 17 May 2025 10:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7834B223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68FF981354
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dfh39qdYiu7 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6501812B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6501812B6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6501812B6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:08:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 964E81C0D57; Sat, 17 May 2025 12:08:21 +0200 (CEST)
Message-ID: <b3382f7f-3ef9-4591-bc8a-2ed207969dfd@rnout.be>
Date: Sat, 17 May 2025 12:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <3d1d0a72db7a9bdd6d9cda07a6b518c08ef01aab.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <3d1d0a72db7a9bdd6d9cda07a6b518c08ef01aab.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747476501; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E8flXQ/0e6kRm1zbYdAu5QNbRIOhnAge/2SODQ0Fcr0=;
 b=dGX7Yh+kt1jnHnS6s3C+jPaLUl2YcmqxCszR5H70QrCDKHUcamzGdc1o95DKuB7JhOgXvW
 FvT3ZrQmTCkJP8+c8dZYRZ17OrMXO5VqBFIFjhzCq/xKzoehOX5fdmlT1hyE0UjUVXYbAS
 IMQqFY+wOXHprv9Mwtd/Xa7pz+RvsYL44+Q4GgM8VEIPihRTWN7lSlUyMHhE1aEpj4Qoa8
 D8Yre2qbbOGFsSLOrWLpiylP5lqiWnWcbhUiAF4QrRkCDcqBtw4AYIxVEL6sQjeDeh+7Gn
 I6aUZMLtXTdsf93wf8R/whbJYivXzZsY8Y/aBWbVviv1KL9XKOVCqdPvt/n9Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dGX7Yh+k
Subject: Re: [Buildroot] [PATCH 04/13] support/scripts: comonalise checking
 merged status
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



On 14/05/2025 18:58, Yann E. MORIN wrote:
> Rather than repeat the same canned sequence over and over again, move it
> to a function that we can reuse as many times as needed. This will come
> handy when we later need to check merged sbin.
> 
> Switch to using bash as it allows for nicer functions (local variables),
> but we anyway require it globally already so that's not an additional
> dependency.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle <arnout@mind.be>

> ---
>   support/scripts/check-merged-usr.sh | 46 ++++++++++++++++-------------
>   1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
> index 433857cd8c..ed0c58e9b7 100755
> --- a/support/scripts/check-merged-usr.sh
> +++ b/support/scripts/check-merged-usr.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/usr/bin/env bash
>   #
>   # Check if a given custom skeleton or overlay complies to the merged /usr
>   # requirements:
> @@ -10,30 +10,36 @@
>   # /usr/lib/
>   # /usr/sbin/
>   #
> -# Output: the list of non-compliant paths (empty if compliant).
> +# Input:
> +#   $1:     the root directory (skeleton, overlay) to check
> +# Output:
> +#   stdout: the list of non-compliant paths (empty if compliant).
>   #
>   
> +# The directory to check for merged-usr
> +root="${1}"
> +
>   # Extract the inode numbers for all of those directories. In case any is
>   # a symlink, we want to get the inode of the pointed-to directory, so we
>   # append '/.' to be sure we get the target directory. Since the symlinks
>   # can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
> -# all of them.
> +# each of them.
>   #
> -lib_inode=$(stat -c '%i' "${1}/lib/." 2>/dev/null)
> -bin_inode=$(stat -c '%i' "${1}/bin/." 2>/dev/null)
> -sbin_inode=$(stat -c '%i' "${1}/sbin/." 2>/dev/null)
> -usr_lib_inode=$(stat -c '%i' "${1}/usr/lib/." 2>/dev/null)
> -usr_bin_inode=$(stat -c '%i' "${1}/usr/bin/." 2>/dev/null)
> -usr_sbin_inode=$(stat -c '%i' "${1}/usr/sbin/." 2>/dev/null)
>   
> -not_merged_dirs=""
> -test -z "$lib_inode" || \
> -	test "$lib_inode" = "$usr_lib_inode" || \
> -		not_merged_dirs="/lib"
> -test -z "$bin_inode" || \
> -	test "$bin_inode" = "$usr_bin_inode" || \
> -		not_merged_dirs="$not_merged_dirs /bin"
> -test -z "$sbin_inode" || \
> -	test "$sbin_inode" = "$usr_sbin_inode" || \
> -		not_merged_dirs="$not_merged_dirs /sbin"
> -echo "${not_merged_dirs# }"
> +test_merged() {
> +	local root="${1}"
> +	local dir1="${2}"
> +	local dir2="${3}"
> +	local inode1 inode2
> +
> +	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
> +	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
> +
> +	test -z "${inode1}" || \
> +		test "${inode1}" = "${inode2}" || \
> +			printf '%s\n' "${dir1}"
> +}
> +
> +test_merged "${root}" "/lib" "/usr/lib"
> +test_merged "${root}" "/bin" "/usr/bin"
> +test_merged "${root}" "/sbin" "/usr/sbin"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
