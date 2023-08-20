Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57335EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB6782022;
	Sun, 20 Aug 2023 14:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB6782022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL1DpS__VAf2; Sun, 20 Aug 2023 14:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558598200B;
	Sun, 20 Aug 2023 14:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558598200B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90B531BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A50260C23
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A50260C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9yNbioShNpd for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:24:16 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32B5C60E83
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B5C60E83
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8D28219F5B0;
 Sun, 20 Aug 2023 16:24:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 16:24:10 +0200
Date: Sun, 20 Aug 2023 16:24:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230820142410.GM1778688@scaer>
References: <20230820133333.912207-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820133333.912207-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692541454;
 bh=F4+IMKVVNr7zwoD0KHYts0ePb7nssqha+mV0/qxihXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBey0lmUNEGWdBQKyWiz7XxH8hemSyuTWvv1MA6e9cVETRW6Q7FcFYw0WigqooFFT
 riNG+w7dAK8gj2TE3unWQfzzJSI8DPVy63Bi62N4eKUS9a4Gb9/AVW3uySpj1sP/Uv
 kellhynhhm5MweWTBshanhYHCm6RJKbMmNXykjdDEOEWc7EwP8SFVdAIJa8AcHLem6
 /IG22GyEGJerKtJvJEWcnNTo68oibZfctUkCD00dA/vuYHEhWoaoOjM4iCW8STJuCN
 ZiHuymGDvmxFegmZMSishn8oZaYB/VEBTCgbCkGveC8vZclZWdMtCtD3k1To0BDY/K
 OIN5eFk2mGweQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aBey0lmU
Subject: Re: [Buildroot] [PATCH] utils/docker-run: allow IMAGE to be passed
 in the environment
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
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-20 15:33 +0200, Thomas Petazzoni via buildroot spake thusly:
> It is sometimes useful to use docker-run, but with a different image
> than the default one. This commit allows to override the image being
> used by only defining IMAGE if not already passed in the environment.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: this patch applies on top of the series of patches on
> utils/docker-run by Yann E. Morin at
> https://patchwork.ozlabs.org/project/buildroot/list/?series=368134.
> ---
>  utils/docker-run | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 02cf68c946..e4581d1c4f 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -9,9 +9,11 @@ else
>      # Support git-worktree
>      GIT_DIR="$(cd "${MAIN_DIR}" && git rev-parse --no-flags --git-common-dir)"
>  fi
> -# shellcheck disable=SC2016
> -IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
> -        sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
> +if test -z "${IMAGE}" ; then
> +    # shellcheck disable=SC2016
> +    IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
> +		sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')

    s/\t+/            /g

Applied to next, thanks.

Regards,
Yann E. MORIN.

> +fi
>  
>  declare -a docker_opts=(
>      -i
> -- 
> 2.41.0
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
