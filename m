Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAC9C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 15:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 602A48329E;
	Sat, 29 Jul 2023 15:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 602A48329E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSGk3Oxm0Gut; Sat, 29 Jul 2023 15:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7328783295;
	Sat, 29 Jul 2023 15:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7328783295
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8559A1BF3EA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B51960C07
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B51960C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEcVwn9-7lsl for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 15:33:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A58DE60AC2
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 15:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A58DE60AC2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3ce4:463b:40b1:7148])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B4C3113F8C1;
 Sat, 29 Jul 2023 17:33:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 29 Jul 2023 17:33:10 +0200
Date: Sat, 29 Jul 2023 17:33:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20230729153310.GA229077@scaer>
References: <20230728213218.3893857-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230728213218.3893857-1-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690644794;
 bh=TeYW6f/7W0anSJAxLMtXw3J2Oz3JJZ9+jSF8ykFQOdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pYwrgxDvRl6AtaGdLFkoaDpUfuRy0wY/OjG33TapA/Ja/7kDzlkI0PHAS/bi2m28w
 D+UrvB3QmHLxHJ9mBLrJ9tarSZqCNa6uYBj/kKv0EOLT1qFQXDHeJ9FuLlv4Mhz4qs
 PSStsMrvLRWVYlRjZQidwE4hQvzGncFfW2jPT1I5VkBbYd9yPHlvOzLQo3uQWM3p2p
 dizH4jAxjs3kE8Br8KAZbtgUEWFGGqcZcGui24AOi74H0rY8R4NjUXxm6YK9AXNRjW
 AOBkMV/fa25t75C0NV8lxpg2Lyv6S1WFax9vKh4+BMA1L+AO6eKPeJH5ukTzmQfMXm
 5nGJe84iDupEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pYwrgxDv
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: fix support for
 git-worktrees
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2023-07-28 21:32 +0000, Brandon Maier via buildroot spake thusly:
> The docker-run script attempts to support git-new-workdirs and
> git-worktrees by resolving the symlink at '$GIT_DIR/config' to get the
> true $GIT_DIR. However this does not work for git-worktrees as they do
> not use symlinks, instead they change the $GIT_DIR into a regular file
> that contains the path to the real $GIT_DIR. To complicate things
> further, we actually want the $GIT_COMMON_DIR which is the superset of a
> worktree's $GIT_DIR.
> 
> git-rev-parse supports the '--git-common-dir' which will resolve the
> $GIT_COMMON_DIR for us. However it does not work for git-new-workdirs,
> so we still need to detect and handle them.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thanks, I've pushed it to master with a few changes:

  - support git versions before --git-common-dir was introduced
  - don't mount GIT_DIR if unknown (i.e. not needed)
  - fix expanding MAIN_DIR

See below..

> ---
>  utils/docker-run | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 17c587a484..db279dca68 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -2,8 +2,13 @@
>  set -o errexit -o pipefail
>  DIR=$(dirname "${0}")
>  MAIN_DIR=$(readlink -f "${DIR}/..")
> -# GIT_DIR to support workdirs/worktrees
> -GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
> +if [ -L "${MAIN_DIR}/.git/config" ]; then
> +    # Support git-new-workdir
> +    GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
> +else
> +    # Support git-worktree
> +    GIT_DIR="$(cd "$MAIN_DIR" && readlink -f "$(git rev-parse --git-common-dir)")"
                      ^^^^^^^^^
Expansion should use curly braces, like everywhere else.

--git-common-dir was only introduced in git 2.10.0, which is most
probably not available in enterprise-grade distros like RHEL (RHEL 7 is
still maintained, and it is based on Fedora 19; there's only a docker
image for Fedora 20, and that has git 1.9).

So I've added --no-flags, that has been present since at least 1.0.0,
which means that, on git versions that did not support worktrees, we'll
get an empty GIT_DIR, so that's OK: it means we're in the main working
copy, and thus we don't need the mount.

Applied to master with those changes, thanks.

Regards,
Yann E. MORIN.

> +fi
>  # shellcheck disable=SC2016
>  IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>          sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
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
