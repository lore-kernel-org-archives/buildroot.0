Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0DFEE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 18:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90A1540018;
	Sat, 19 Aug 2023 18:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A1540018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CIYLcyWuP9L; Sat, 19 Aug 2023 18:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21DE44056C;
	Sat, 19 Aug 2023 18:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21DE44056C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B25E01BF2F8
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 18:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B48C40292
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 18:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B48C40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkquqWThYE6C for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 18:44:10 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C19D400A9
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 18:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C19D400A9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3608A2003DA;
 Sat, 19 Aug 2023 20:44:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 20:44:03 +0200
Date: Sat, 19 Aug 2023 20:44:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230819184403.GD1778688@scaer>
References: <20230819145925.324644-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230819145925.324644-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692470647;
 bh=N/AWEIX0iE7yzGC2kmYvT9f0BRJkXLzxNAT6cABK+hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XttqODpj2bLJ9ki1ofUp11J6sOM5YdkeEMMKYV3R1B7jyM7r1vEyI3/Tfj2BcCZpA
 +jQU/9NML8t9IErAsLTilh7F0Q9CKmTOr3bc/W4VGRxwNxgOZtDO5+p0GvdZcwUP7e
 pX/xcJSJq8yzZmcWCuG7cLPn2J4cK3dhi9p+jeM9flMLZJsSs9x9HaSX1YUCOygffp
 oZBcW1eBpM3Ny/dD6KsUgKyOJcq9ENJdQfJIsGT20+an0QfwEWbUtnIJEygvohGnE8
 QzKqZZQe7hJCU5w/V/b+qHfKtegV6uhRvpUCE+sjW0bYsCvKVpg/bV1+GfPdvcpl03
 ZRaEcLzVMT8QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XttqODpj
Subject: Re: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump to version
 0.22
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-08-19 16:59 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00009.html
> https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
> 
> Removed patch 0001, the patched file is not present in this release.
> Removed patch 0002 which was applied upstream.
> 
> Added comment to gettext-tiny.mk about version bumps.
> 
> Since upstream commit
> https://github.com/autotools-mirror/gettext/commit/785a89e5df994c2b242f082d60de89e2d520aa4a
> gettext-runtime is a build-dependency for gettext-tools so we are
> building the complete package for the host from now on.

So, the reason for the partial build was to gain a bit of time. So I did
a few very simplest tests:

    $ make distclean; make defconfig
    $ time make host-gettext-gnu-depends          Before    After
                                                  59s       24s
    $ time make host-gettext-gnu                  2min 22s  3min 3s
                                           Total: 3min 21s  3min 27s

We loose about 6s.

That is a bit skewed, in fact, because the dependencies of
host-gettext-gnu which was autoreconfed, are dependencies of other
packages, so we don't really gain 35s there... Still, the delta in
build time is not worth the efforts in maintenance.

> Doing so we can drop package host-libtextstyle and a _POST_INSTALL_HOOK.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   2 -
>  .../0001-error_print_progname.patch           |  20 ---
>  ...-buld-gettext-tools-seperately-part1.patch | 142 ------------------
>  package/gettext-gnu/gettext-gnu.hash          |   7 +-
>  package/gettext-gnu/gettext-gnu.mk            |  24 +--
>  package/gettext-tiny/gettext-tiny.hash        |   6 +-
>  package/gettext-tiny/gettext-tiny.mk          |   3 +-
>  package/libtextstyle/libtextstyle.hash        |   6 -
>  package/libtextstyle/libtextstyle.mk          |  24 ---
>  9 files changed, 16 insertions(+), 218 deletions(-)
>  delete mode 100644 package/gettext-gnu/0001-error_print_progname.patch
>  delete mode 100644 package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
>  delete mode 100644 package/libtextstyle/libtextstyle.hash
>  delete mode 100644 package/libtextstyle/libtextstyle.mk

I moved the removal of libtextstyle to aseparate commit.

[--SNIP--]
> diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
> index 9a1eabd0df..215e6a7427 100644
> --- a/package/gettext-gnu/gettext-gnu.mk
> +++ b/package/gettext-gnu/gettext-gnu.mk
[--SNIP--]
> @@ -55,7 +53,7 @@ endif
>  # For the target version, we only need the runtime, and for the host
>  # version, we only need the tools.
>  GETTEXT_GNU_SUBDIR = gettext-runtime
> -HOST_GETTEXT_GNU_SUBDIR = gettext-tools
> +HOST_GETTEXT_GNU_SUBDIR = .

You forgot to update the comment right above, so I did it.

Applied to next, thanks.

Regards,
Yann E. MORIN.

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
