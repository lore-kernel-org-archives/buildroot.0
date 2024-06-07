Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B38C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535A160730;
	Fri,  7 Jun 2024 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UElGOE0qPHm3; Fri,  7 Jun 2024 19:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DCC60777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DCC60777;
	Fri,  7 Jun 2024 19:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC3B41BF475
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D695960752
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPcS-svyWKz4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 19:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF8CD60730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF8CD60730
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF8CD60730
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 19:49:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A41C713F846
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 21:49:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 21:49:21 +0200
Date: Fri, 7 Jun 2024 21:49:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZmNkQVtOXqcVuksY@landeda>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <077431bc77b4c376129ceeb628367591bcd5e8ec.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <077431bc77b4c376129ceeb628367591bcd5e8ec.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717789762;
 bh=QutUcTSbjLIY29oH/WqP+sHQrUwy2quzOitOSAftdIg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lP5aoZ2kt025mIQXNyaRjbEULDMdTHWWhUQFfWFRUBuQV1rKeiWwIeJLC4QrhQydr
 dfgW1LV5hGp9mEIpFfuRAgGXljGNBduTzb59OZaRbyUdKVSOiSEIF5IlviQYQ8BH7o
 1VTUl9v+1hwF/Wbs3jVso3ABW2aSZYEiTPZxgt0/gzWItOx31CyMRsSqlB6qWvgjgC
 dKkaiqVK+2O8MLsXK6mnTofckL5+9lW+iPG6GsCi0o1DB1+MrTB1wHdDl/NE5kF5+x
 SVBkVrTYtTRBa6PURexUI3idP0IrGglC1iMUPssUINvnW5q9h1aCeYJyEycfwZj317
 xNAz2CTOOrESA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lP5aoZ2k
Subject: Re: [Buildroot] [PATCH 19/20 v2] package/pkg-cargo: allow unlocked
 packages to provide local Cargo.lock
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

All,

On 2024-06-07 19:06 +0200, Yann E. MORIN spake thusly:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[--SNIP--]
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index 90155a2fad..3431d04a72 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
[--SNIP--]
> @@ -49,6 +51,23 @@ while [ "${lock_dir}" != "." ]; do
>      lock_dir="$(dirname "${lock_dir}")"
>  done
>  
> +if [ "${cargo_lock}" ]; then
> +    if [ -e "${lock_dir}/Cargo.lock" ]; then
> +        printf 'Cannot override %s/Cargo.lock with custom %s\n' "${lock_dir}" "${cargo_lock}"
> +        exit 1
> +    fi >&2
> +    # When the package had no Cargo.lock, we need to
> +    # copy ours next to the top-most manifest.
> +    dir="${manifest}"
> +    while [ "${dir}" != "." ]; do
> +        dir="$(dirname "${dir}")"
> +        if [ -e "${dir}/Cargo.lock" ]; then

Damn, the test should have been against Cargo.toml here, not Cargo.lock.
I did not notice so far, because the only unlock package I know of had
its Cargo.toml at the root, and the loop ends at the root.

I've fixed that locally, until the next respin.

Regards,
Yann E. MORIN.

> +            lock_dir="${dir}"
> +        fi
> +    done
> +    cp "${cargo_lock}" "${lock_dir}/Cargo.lock"
> +fi
> +
>  if [ -e "${lock_dir}/Cargo.lock" ] && ! ${locked}; then
>      printf 'Unlocked vendoring was requested, but source tree has %s/Cargo.lock\n' "${lock_dir}"
>      exit 1
> -- 
> 2.45.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
