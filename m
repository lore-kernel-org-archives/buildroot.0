Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A36C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17C441834;
	Sat, 13 May 2023 10:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17C441834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idrOPwWcqUVU; Sat, 13 May 2023 10:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 144A441903;
	Sat, 13 May 2023 10:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 144A441903
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25B8D1BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F289B40164
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F289B40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9NNH_OC5cJn for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:10:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08AD7400AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08AD7400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:10:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C289C19F74C;
 Sat, 13 May 2023 12:10:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:10:21 +0200
Date: Sat, 13 May 2023 12:10:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230513101021.GL2582048@scaer>
References: <20230506214618.373562-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506214618.373562-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683972624;
 bh=L8vrEaVpos1wTC5HnlUNI/eJA97ymrrV0xHwlk0jyi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OWJRTMnhiiFjuHrBxi8A/vfnxVxvq78JD7zussz5zSDy4HTwuMtIhklih9I0m3tb9
 YH93wtOV9YDRCTTaTBdLxTfzb48aTpsGKg369cSZxSdVSS8AOyBf1C1nRF1/Jaj9Oe
 PJGbM/Zz5I4Sb2uozMBz2nc8OaT1KtPHE/3s3chlr3w158M/ethCq66OMBxX3uPIyR
 ZG6/lIAOmpQVQ5BrCsY5eY2xW1eZ5PHHI3AIvDcGVAVuCu9AcJ62S6qJjCiiGa3KID
 LR1ah3ranqcjUR/X8WTVrrLsGFWM5NcJGSIxXv9UY/0jLBHbQ+xygYaXM4W+D96c+0
 QXoTvJBdJQb9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OWJRTMnh
Subject: Re: [Buildroot] [PATCH] utils/docker-run: make it work in
 workdirs/woktrees
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-05-06 23:46 +0200, Yann E. MORIN spake thusly:
> It is quite customary to use a single repository with multiple workdirs,
> one for each active branch, with either the aging 'git new-workdir' or
> the more recent 'git worktree'.
> 
> However, in a workdir/worktree, most entries in .git/ are only symlinks
> to the actual files in the main repository.
> 
> Currently, utils/docker-run only bind-mounts the current working copy.
> If that is a workdir/worktree, then it is going to be missing the actual
> git data, resulting in errors like:
> 
>     $ ./utils/docker-run make check-package
>     fatal: not a git repository (or any parent up to mount point [....]/buildroot)
>     Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
>     No files to check style
>     make: *** [Makefile:1257: check-package] Error 1
> 
> So, we also bind-mount the actual git directory. If that is a subdir
> of the current working copy, then it is already mounted and thus the
> bind-mount is superfluous but harmless; for simplicity, we mount it
> unconditionally.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 135a1451b6..17c587a484 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -2,6 +2,8 @@
>  set -o errexit -o pipefail
>  DIR=$(dirname "${0}")
>  MAIN_DIR=$(readlink -f "${DIR}/..")
> +# GIT_DIR to support workdirs/worktrees
> +GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
>  # shellcheck disable=SC2016
>  IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>          sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
> @@ -11,6 +13,7 @@ declare -a docker_opts=(
>      --rm
>      --user "$(id -u):$(id -g)"
>      --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
> +    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
>      --workdir "${MAIN_DIR}"
>  )
>  if tty -s; then
> -- 
> 2.25.1
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
