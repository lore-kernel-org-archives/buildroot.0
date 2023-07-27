Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA25C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 16:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3030B41D67;
	Thu, 27 Jul 2023 16:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3030B41D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_JFtCzLzUjW; Thu, 27 Jul 2023 16:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED0141D70;
	Thu, 27 Jul 2023 16:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED0141D70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2961BF475
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D2F8402B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D2F8402B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lg7XfZ07Pcwl for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 16:21:16 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E7B08402A
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 16:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7B08402A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89e8:4a89:fcd4:1b18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 491C35FFA7;
 Thu, 27 Jul 2023 18:21:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jul 2023 18:21:08 +0200
Date: Thu, 27 Jul 2023 18:21:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230727162108.GG3544423@scaer>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690474873;
 bh=98iI9Q8hu2fx0a4tTWfsKYe/PGgW51LaVKeF1QUb12g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSMPMk2KheuLCh6Jq8qhtMh2vjMqgVcVy5nL48Mc7fQ05aJlDiY0jhSw2/xGcflIY
 3So16a4E8Au2jrVNZS+WP0Ma7Agwo2iyTozChJ+CZCtBesBy56ZRii7mMCGaWTCN9I
 HSEXK+gjvYweBgZWY1DUUVDSum4pGpZqYy7Jyt5q04YiOKZR45XR7HDc+Ltf3DLf7l
 GvEPsltgav2i76onQ8c8spnBMkD+7Iq8Sd4vJqOvh31ycYE6VNqLliQTHixrEijhLi
 q4RbIna3GB2gLRiOV0jMA3FPqqBwAsErm/vnQVIGm+FokzrNSXGLflzlEFkI9EqbXc
 cHbcxkebMR0rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bSMPMk2K
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

On 2023-07-26 23:20 +0200, Thomas Petazzoni spake thusly:
> After switching to a fresh Fedora 38 installation with SELinux
> disabled, we noticed that utils/docker-run doesn't work as the
> applications running inside the container are not allowed to accept
> the data mounted through the bind mount.
> 
> Turns out that Docker has a "Z" option to do the appropriate magic for
> SELinux. However, this "Z" option is only available for --volume, not
> for --mount, as explained in
> https://docs.docker.com/storage/bind-mounts/.

hat about those systems that do not have SELinux: how is z/Z going to
work for those?

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

Note that this is about "on the docker host", so the source, while the
commit mentions "the destination in the container".

I can't where I initially read that, since the pointer in 7f2020f9040f
is no longer valid (the anchor no longer exists).

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
