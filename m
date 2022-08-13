Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E33DC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FB13401CA;
	Sat, 13 Aug 2022 22:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB13401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN-jPpAw6lYJ; Sat, 13 Aug 2022 22:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C10C6401A1;
	Sat, 13 Aug 2022 22:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10C6401A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFF941BF5A4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA824607FE
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA824607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPS6pcCujYRE for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 22:11:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC44B607C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC44B607C9
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 22:11:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac43:2f79:1c81:6f7d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BCC4760131;
 Sun, 14 Aug 2022 00:11:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 00:11:43 +0200
Date: Sun, 14 Aug 2022 00:11:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: John Keeping <john@metanate.com>
Message-ID: <20220813221143.GA2854108@scaer>
References: <20220811134533.508348-1-john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811134533.508348-1-john@metanate.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660428705;
 bh=iT8qT5ExNcwTWU6czDZUzcLp2mVl174Kgn76zSRVSgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XIZQ461Keh7hpuN9KAlfalI0dRpGGJ7RResDmM2Xx2oPNk44by/4oIww9AXfo/86f
 Bvwz8yp96RpuTFBQtIfPV7pfPoNOpZrx+OqoQGu681zTgvQjimrKmeUGLWAdImLX9f
 5For2ytbGK5N8e/hDnkw7ff9j3xrKMxUfMvT/dPUk2DkgvL33MDQQrjxaj6pekds7/
 eXSAz7gEuUJeFZiON1yRMDkgFJhjHLqmbRBtkVWPIHXoyxBVZ1oeCXjTCvEOxKod3a
 OQABNYhTiXBiXcaHKGbrmWWFyA6Sj+WMyZpwak0lT5FK1rkX+oC3YnOeQ+suzIEUCf
 Se1hpTANo7eWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XIZQ461K
Subject: Re: [Buildroot] [PATCH] support/download/git: disable global &
 system config
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

John, All,

On 2022-08-11 14:45 +0100, John Keeping spake thusly:
> The build environment should be isolated from the host system as much as
> possible to keep the build reproducible.  Git's global config (usually
> ~/.gitconfig) and system config (/etc/gitconfig) can affect the
> behaviour of all Git operations, so should be disabled.
> 
> An example of this is that `git lfs install` will add the LFS smudge
> filter to the global config and thus always checkout LFS files ignoring
> the value of $(PKG)_GIT_LFS.  This may mask a bug in the package when
> the initial developer's machine has LFS installed globally.

While I appreciate the reasoning and example, there are valid cases
where we do want to use (at least) the user's settings, like when they
have proxy commands (i.e. core.gitProxy or core.sshCommand) set to reach
the outter world (e.g. because they are behind a restrictive firewall
and need to tunnel ssh-over-https for example).

So we need something better than just ignoring the local configuration,
and this is going to be... tricky.

Regards,
Yann E. MORIN.

> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  support/download/git | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 1a1c315f73..b0a677c3a3 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -82,13 +82,17 @@ trap _on_error ERR
>  # being expanded a second time (in case there are spaces in them)
>  _git() {
>      if [ -z "${quiet}" ]; then
> -        printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
> +        printf '%s ' GIT_CONFIG_GLOBAL=/dev/null \
> +            GIT_CONFIG_SYSTEM=/dev/null \
> +            GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
> +        printf '\n'
>      fi
>      _plain_git "$@"
>  }
>  # Note: please keep command below aligned with what is printed above
>  _plain_git() {
> -    eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
> +    eval GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null \
> +        GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
>  }
>  
>  # Create a warning file, that the user should not use the git cache.
> -- 
> 2.37.1
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
