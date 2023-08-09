Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66638C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F09641822;
	Wed,  9 Aug 2023 21:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F09641822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rj4tBcuIMako; Wed,  9 Aug 2023 21:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC16C418CB;
	Wed,  9 Aug 2023 21:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC16C418CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1851BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E73DA60B74
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E73DA60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibk-EsCU9jFc for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:32:51 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78BD460B50
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78BD460B50
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 58F3A780346;
 Wed,  9 Aug 2023 23:32:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Aug 2023 23:32:45 +0200
Date: Wed, 9 Aug 2023 23:32:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230809213245.GF421096@scaer>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691616769;
 bh=dZWthiV+4IiRzHrtP4Ouij0p4mr2pBruRXiDEolsxJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbJ0VTF67AHotqPY7kXf8hsEZNxMjV+ZZ/h3+5jhAYztyINpAPAaH2yVXx0UpWUNZ
 VEVU6O0mhK3YBg8tHrFWoW9pZrkfznCwT6Q2NaXtt7yjLaXXane1ue/rkSHCLmiE9L
 yt/M8YHHeheKEN15YS/ieVJNLjWzs+PenfAP3bZSBg5Y93tUcT+MtWGzQdUr3HEHu9
 Kbb8sh7C3CAnNCTYTdC9VefSMmD2QrirQ+fkPJvfLcADmaENiElAHlP+tBVpF6Wg/h
 KS4V/83TqSmYeNsSYfJAlL03ofRdRZQ/OCqHFYnYfF51YzuVyydBC3+M1J37NEmm2Y
 Xylux48sWvdlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hbJ0VTF6
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
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
Cc: Christian Stewart <christian@paral.in>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-07-26 23:20 +0200, Thomas Petazzoni via buildroot spake thusly:
> After switching to a fresh Fedora 38 installation with SELinux
> disabled, we noticed that utils/docker-run doesn't work as the
> applications running inside the container are not allowed to accept
> the data mounted through the bind mount.
> 
> Turns out that Docker has a "Z" option to do the appropriate magic for
> SELinux. However, this "Z" option is only available for --volume, not
> for --mount, as explained in
> https://docs.docker.com/storage/bind-mounts/.
> 
> So, this commit partially reverts 7f2020f9040f ("utils/docker-run:
> improve user experience") that switched from --volume to
> --mount. However, the justification in 7f2020f9040f to switch from
> --volume to --mount was "Docker will create the destination if it does
> not exist", but the current Docker documentation seems to say exactly
> the opposite:
> 
>     If you use -v or --volume to bind-mount a file or directory that
>     does not yet exist on the Docker host, -v creates the endpoint for
>     you. It is always created as a directory.
> 
>     If you use --mount to bind-mount a file or directory that does not
>     yet exist on the Docker host, Docker does not automatically create
>     it for you, but generates an error.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I've included this change in my respin:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=368134

In doing so, I switched to the proposal by Antoine, to use
--security-opt label=disable

I did not see an adverse effect on a non-SELinux host, and you reported
that it also worked for you, so let's ship it.

I've also included patch 2 in the respin.

Regards,
Yann E. MORIN.

> ---
> NOTE: I am not a Docker expert, and I certainly don't know if this is
> the right solution, and I would appreciate feedback from folks with
> more Docker experience.
> ---
>  utils/docker-run | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 17c587a484..eee1aad7a4 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -12,8 +12,8 @@ declare -a docker_opts=(
>      -i
>      --rm
>      --user "$(id -u):$(id -g)"
> -    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
> -    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
> +    --volume "${MAIN_DIR}:${MAIN_DIR}:Z"
> +    --volume "${GIT_DIR}:${GIT_DIR}:Z"
>      --workdir "${MAIN_DIR}"
>  )
>  if tty -s; then
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
