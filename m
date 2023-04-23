Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E4EC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 17:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8534A405A1;
	Sun, 23 Apr 2023 17:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8534A405A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbTJOuFikFnG; Sun, 23 Apr 2023 17:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 765D340517;
	Sun, 23 Apr 2023 17:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765D340517
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4670F1C2B1F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DA9D40931
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 17:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA9D40931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ8Sc06Py69p for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 17:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 015F94091C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 015F94091C
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 17:37:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:786a:5f81:2188:6ed4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2676B6013B;
 Sun, 23 Apr 2023 19:37:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 19:37:32 +0200
Date: Sun, 23 Apr 2023 19:37:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230423173732.GN2696@scaer>
References: <20230415194341.2346986-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415194341.2346986-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682271455;
 bh=a5QatOamd6wBWeoPa1Z42GZE3rZUp5jslsIwfMoUEGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PTwM86HCXqUmzQH/SDUthm3HB1zPemZd8I0Wz7AsEsmD4zfS6Quv5g3GmmKf5+fbz
 wta9TwVBSUzNTfGiEf9KcuPWvNgjaCFho9OK/haN3XlNBgy1uTHxxgL4pfhz6MpFT4
 voPgHfxXuSBbRKUg0nhMi+H52z+gYCnLesZYYaYa2semPT3GRcL0GmA7K60KJ21BaK
 P+39Wl9ziLgwFAvgQuTe+5e60A1NwkRNqePjcVHQt61pqiyI0N/YpujMsmFzpZcPrY
 Xg7mG2Ct5X23WTJ2bWRDmt6gnDBM/5QIHVXVNLK+3YKHgnclBdUOHNFZLLM5zJIY6k
 9u0higD8T8AVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PTwM86HC
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow running without a
 tty
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-04-15 21:43 +0200, Yann E. MORIN spake thusly:
> Currently, utils/docker-run spawns a container with a tty, so that he
> user can interact properly in the container.
> 
> However, that requires a tty when calling docker-run, which is not
> always guaranteed, e.g. if called from a git hook.
> 
> Since the script is a bash script already, we can use an array to store
> options passed to docker, and only add the -t option when there is
> actually a tty available.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 164e11c0e6..135a1451b6 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -6,8 +6,15 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
>  IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>          sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>  
> -exec docker run -it --rm \
> -    --user "$(id -u):$(id -g)" \
> -    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
> -    --workdir "${MAIN_DIR}" \
> -    "${IMAGE}" "${@}"
> +declare -a docker_opts=(
> +    -i
> +    --rm
> +    --user "$(id -u):$(id -g)"
> +    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
> +    --workdir "${MAIN_DIR}"
> +)
> +if tty -s; then
> +    docker_opts+=( -t )
> +fi
> +
> +exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
> -- 
> 2.25.1
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
