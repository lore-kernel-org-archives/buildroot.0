Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA21CC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 922D740134;
	Sun,  5 Feb 2023 14:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 922D740134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWJa_lbJxTlK; Sun,  5 Feb 2023 14:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA2C40124;
	Sun,  5 Feb 2023 14:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA2C40124
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE3E01BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B73B14010D
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B73B14010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHfF3wkwXIOk for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D03A140124
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D03A140124
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:43:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D983413F8D4;
 Sun,  5 Feb 2023 15:43:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:43:40 +0100
Date: Sun, 5 Feb 2023 15:43:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230205144340.GP2960@scaer>
References: <20230205130355.797050-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205130355.797050-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675608224;
 bh=yq//qxN9ifuA10iH6HHumkeljWQmFVXvHwJpPiohvDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FvtN+1Ae0QQlbnYdQRzFi6wskQshCWZfpq4WBw2XGCnK6r2gKKUyq+/o/NEwwgvSY
 E+LAQXkQOfHvG9kY7gNFMjyYSIvqm/dX4SYKKuws/s+B2ekiSNHZWxgSgeoLmsGi3s
 t4TsFltckER/NQByWLMB40GMB980yqyeB/zDJoHQOuodJgy3dpHP0LccaT5FiV5lQ2
 N8ESuX1QHngdW9UQ8soj9UX6GK9JySfQm1CXIrCRm1SbDvs5EOpwXV157vgz3wXQou
 VqcEeErlXetKeQMn+eiSSR/UmmRnpjVobd9ZTqKbzcv26lYvSAMKLfmsq9OCPQNaGU
 EoAq3BhmH981w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FvtN+1Ae
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.1
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

Julien, All,

On 2023-02-05 14:03 +0100, Julien Olivain spake thusly:
> For change log since v4.12.0, see:
> - https://github.com/Z3Prover/z3/releases/tag/z3-4.12.1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 8bb9627 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_z3
>     ...
>     OK
> 
>     ./utils/test-pkg -p z3
>     ...
>     6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/z3/z3.hash | 2 +-
>  package/z3/z3.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/z3/z3.hash b/package/z3/z3.hash
> index 517e2f4923..8a511c3fe5 100644
> --- a/package/z3/z3.hash
> +++ b/package/z3/z3.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  5f575f0a3950760436217da1cc1a714569b6d4f664a75bb6775876328cf0a580  z3-4.12.0.tar.gz
> +sha256  a3735fabf00e1341adcc70394993c05fd3e2ae167a3e9bb46045e33084eb64a3  z3-4.12.1.tar.gz
>  sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
> diff --git a/package/z3/z3.mk b/package/z3/z3.mk
> index ecd79325dc..45c412ad12 100644
> --- a/package/z3/z3.mk
> +++ b/package/z3/z3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -Z3_VERSION = 4.12.0
> +Z3_VERSION = 4.12.1
>  Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
>  Z3_LICENSE = MIT
>  Z3_LICENSE_FILES = LICENSE.txt
> -- 
> 2.39.1
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
