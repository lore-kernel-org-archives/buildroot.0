Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5AFC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 614576F74D;
	Thu, 11 Jan 2024 20:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614576F74D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loNrNm-opEa5; Thu, 11 Jan 2024 20:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FAE6F740;
	Thu, 11 Jan 2024 20:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FAE6F740
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 675881BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 401426F740
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401426F740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8OhWiUlJ46B for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:08:02 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E51860B6F
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E51860B6F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0502EB0053D;
 Thu, 11 Jan 2024 21:07:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 21:07:56 +0100
Date: Thu, 11 Jan 2024 21:07:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZaBKnJ43Saz7VPFs@landeda>
References: <20240111105621.2321957-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705003679;
 bh=oMyiL1KsVX5enAHhiqIoBOcxdCEpIJxKSjcID8Wvd60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtriFOwPiU3vwUQl4VKEl8FFQNl1iE2VqoOoqXgPI1wYfx0E/yu+8o29yUatJ6fny
 O+iCDtxaDVCXmEgm4rNg8EY1MRYNkbvkMG2B5mh+/vIUPpx63+axmn7CQXVJ9arzW5
 UQWcCXwF2WwQ1XoNjVDOQFdgKUfwZv5mnS77EuJ2GPlApaqsoSS3OKXQ4a4cqhkq3z
 tqE8dftp7hJQvkayE23Gvx0qvqbfLBc8XoXBGhbajBhn08cXWEjmp/twSsZsFdt2vV
 H4XbSfrfWYdaMWbQByMNlfYnIA2/SJ9m9Gzlahm4apF1JUgdlB7hUh/DEIh5io+lLP
 g74+n7zLBuUlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RtriFOwP
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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

Peter, All,

On 2024-01-11 11:56 +0100, Peter Korsgaard spake thusly:
> A number of packages try to detect if they are running in a git repo and run
> git describe at build time instead of using the hard coded version number if
> it succeed, leading to odd version numbers as they end up picking up the
> Buildroot git version if building inside a Buildroot git checkout, E.G.:
> 
> rauc --version
> rauc 2023.11-562-g9c954953b4+
> 
> This is because rauc builds with meson and uses vcs_tag:
> 
> https://github.com/rauc/rauc/blob/v1.11/meson.build#L168-L171
> 
> https://mesonbuild.com/Reference-manual_functions.html#vcs_tag
> 
> Another example is micropython, where we already work around it by passing
> GIT_DIR=.
> 
> In the context of Buildroot the packages are never built in their own git
> checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
> directory tree and finds the Buildroot git repo, which fixes the rauc (and
> similar) issues.
> 
> >>> rauc 1.11 Building
> ..
> ninja: Entering directory `/home/peko/source/buildroot/output-rauc/build/rauc-1.11//build'
> [1/29] Generating version.h with a custom command
> fatal: not a git repository: '.'
> 
> cat output-rauc/build/rauc-1.11/build/version.h
>  #define PACKAGE_STRING "rauc 1.11"
> 
>  #define PACKAGE_VERSION "1.11"
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 9fbe960759..3e276d23d6 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -263,7 +263,9 @@ export PERL=$(shell which perl)
>  # finds this perl module by exporting the proper value for PERL5LIB.
>  export PERL5LIB=$(HOST_DIR)/lib/perl
>  
> -TARGET_MAKE_ENV = PATH=$(BR_PATH)
> +TARGET_MAKE_ENV = \
> +	GIT_DIR=. \
> +	PATH=$(BR_PATH)
>  
>  TARGET_CONFIGURE_OPTS = \
>  	$(TARGET_MAKE_ENV) \
> @@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \
>  
>  
>  HOST_MAKE_ENV = \
> +	GIT_DIR=. \
>  	PATH=$(BR_PATH) \
>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  	PKG_CONFIG_SYSROOT_DIR="/" \
> -- 
> 2.39.2
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
