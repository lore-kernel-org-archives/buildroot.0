Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DC9ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7001840B9D;
	Tue,  6 Sep 2022 08:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7001840B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgTqX_Y8UyDr; Tue,  6 Sep 2022 08:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DC6A404BF;
	Tue,  6 Sep 2022 08:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC6A404BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 896421BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6310240917
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6310240917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3iKJxp_uU-C for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A13402D1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33A13402D1
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:53:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 21BABB00576;
 Tue,  6 Sep 2022 10:53:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 10:53:32 +0200
Date: Tue, 6 Sep 2022 10:53:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Message-ID: <20220906085332.GS1490660@scaer>
References: <20220904135712.103226-1-thierry.guibert@croix-rouge.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904135712.103226-1-thierry.guibert@croix-rouge.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662454415;
 bh=3SLtInoNyrGgMqxoT9IgdTBROk+Bm1xmuYI3PppYR4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqJKHO5MhLkfJQEeOXB45F/KuEeU0KHOW+KQiG2hAcFoH2zvIlEjKbXcUk0yZlT/a
 A9LaOH76y+I0Z+lfEzPZVzu3qbWjk9byzueRL9hx4cU1v+Rn7fRxnxG5plcSTcvM8u
 +HvRd6Vtn5CmUKC4ph770r0KMsqVRdAbOGhV7026gnv1D9V1mdU4Gk/ApiqzTydMxO
 qKyzfAZ1JoMyboQn9GF9Z3tHIBAcr+tfoN0fTx1nsIGNniDCxJJtzrLmSuQaE0UkH2
 n0HLgqU7ugu7ULuZbn3wYPc491epkGgDR0kYM1P6ThS1PW3sTDRgqd6GZjfGM7ogNe
 oVKDpzCchoctw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sqJKHO5M
Subject: Re: [Buildroot] [PATCH] Tagging targets names without hyphens does
 not run gitlab CI
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

Thierry, All,

On 2022-09-04 15:57 +0200, Thierry GUIBERT via buildroot spake thusly:
> Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
> ---
>  support/scripts/generate-gitlab-ci-yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index aa43aac019..4ae4d13be2 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -71,7 +71,7 @@ gen_tests() {
>              defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
>              do_defconfigs=base
>              ;;
> -          (*-*_defconfig)
> +          (*_defconfig)

This is in fact on purpose. The goal is to push a branch (not a tag, by
the way), such as:

    $ git push my-gitlab HEAD:test-my_board_defconfig

This is also how we trigger the other tests:

    $ git push my-gitlab HEAD:test-basics
    $ git push my-gitlab HEAD:test-all-defconfigs
    $ git push my-gitlab HEAD:test-all-runtime-tests

I.e. we are using a dash to allow pushing references into a "testing
namespace" that you clearly mark as tests, that wil not clash with a
naming scheme for the longer-term branches.

Regards,
Yann E. MORIN.

>              defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
>              do_defconfigs=base
>              ;;
> -- 
> 2.37.2
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
