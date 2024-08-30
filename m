Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E30ECA101A
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 21:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC83613EC;
	Fri, 30 Aug 2024 21:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWXzeFjIlYoB; Fri, 30 Aug 2024 21:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909476145E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909476145E;
	Fri, 30 Aug 2024 21:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA6721BF295
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A823761401
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOYtZg4W8p4y for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 21:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C7B3613EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C7B3613EC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C7B3613EC
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 21:35:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5BC4213F899;
 Fri, 30 Aug 2024 23:35:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 23:35:51 +0200
Date: Fri, 30 Aug 2024 23:35:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtI7NyPyq9rU94RT@landeda>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713192207.873065-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725053756;
 bh=ql3c7b9fDKBKaUeaYUGZ8aEfCwoXP2yHgIz0WmERHSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JHSHSy6YC7N32GcEn7GnFe+CKk/p9oNjtUWvUO8TMDRRmqu6Uj678g61pnqkSGJ4F
 ryrkFzC70gvhdOegtjFC62xXykAw3Nn1DAJDZntBkY0h/jWoi9xwlmLi1JRl09I2Qt
 M83tE8p3A+WudEfuXv3uNmhPPGbN4aVKx/d9Wh/KxCwOe+kIHSTjQ3dimiZwXA6MYM
 NvdQpf4XReiNURRoxf7RJECtvBW1MEafNSoiGjicMhbCm3DOOcs99ugprSGXyGOL2H
 wzK7dIIkzPQbNkkIg2I4aL230HvbF8ov5WQiKfras1CZ3Q6X84GfbbW4mYRiftiaU2
 rV5kXWFkU+TLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JHSHSy6Y
Subject: Re: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>   removing pre-exisiting shellcheck override. Suggested by Brandon
>   Maier.
> 
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
> 
>  utils/docker-run | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..dbb9c45fdd 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,10 +90,17 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
> 
> -# shellcheck disable=SC2013 # can't use while-read because of the assignment
> -for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> +if [ -v BR2_EXTERNAL ]; then
> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
> +    for br2_ext in "${br2_ext_arr[@]}"; do
> +        mountpoints+=( "${br2_ext}" )
> +    done
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
> +while IFS=$'\n' read -r dir; do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> -done
> +done < <(printf '%s\n' "${mountpoints[@]}" | LC_ALL=C sort -u)

This commit mixes multiple changes:
  - using process substitution with a while-loop, instead of the
    command substitution and a for-loop
  - passing br2-external and mounting trees in the container
  - handling br2-external trees with spaces in them

I see you have a second patch with support for br2-external trees with
spaces in their paths. If at all, it should come before this one.

However, I don't think we should support paths with spaces. We currently
do not, and the rest of the code base (as your second patch states) may
or may not work (hint: it does not, it's broken in a lot of places, and
the buildsystems of many packages do not support spaces in path either).

Also, BR2_EXTERNAL must be a space-separated list, as it needs to be
split on space from Makefile context, so no br2-external tree with
spaces in paths can even work... (unless I missed something...)

So, I'm OK with passing br2-external to the container, but not with the
rest of the changes in this file. I.e. the change whould be just that:

    docker_opts+=( --env BR2_EXTERNAL )
    for dir in ${BR2_EXTERNAL}; do
        mountpoints+=( "${br2_ext}" )
    done

Regards,
Yann E. MORIN.

>  if tty -s; then
>      docker_opts+=( -t )
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
