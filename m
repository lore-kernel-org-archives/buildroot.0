Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB98CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5B64403AE;
	Fri, 15 Sep 2023 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5B64403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmidRNcJ714A; Fri, 15 Sep 2023 21:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDD3D40545;
	Fri, 15 Sep 2023 21:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD3D40545
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 300391BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F64420F8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F64420F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EzjHM2s0leD for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:31:06 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A666241F26
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A666241F26
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 540602003F3;
 Fri, 15 Sep 2023 23:31:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:31:01 +0200
Date: Fri, 15 Sep 2023 23:31:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20230915213101.GH2571@scaer>
References: <20230915124933.2975234-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915124933.2975234-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813463;
 bh=aHrVkjpArH+Floa6SP2LunEIgIv7flXNAq9lM9mci9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sz3caQ2/R7otyHaZcZV2bwZcm3YiwHLxnJJLsqrjqYHhzwbdcXXkSCPcR2yuneYF4
 seNcIUq5YDzCUBaVcTkO+LUPL9nECO2gHacjg4Y82BbR8Pv8xbZCQRPACFv5CJOutc
 wQ2ghLNFhcjHwjQSLkkXEcIFKae9f6ux/A4AtVOYwaNxTM+E96m4BrPmUrTso3mKCp
 Idwwwl1QWKES6bkqQz0Di/8BDsXUcklIOzv881qY9H6zFBnXjkALnBeres+lmZlcjz
 c9DQqNbRQr57NdajUTZ+aRCJzVMHVBSfLDXZ+cvsQGZhzUXBM1asfkLeGG5WU3eNvg
 RSzuPxU/VSWUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sz3caQ2/
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.83.0
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

Michael, All,

On 2023-09-15 14:49 +0200, Michael Nosthoff via buildroot spake thusly:
> - add upstream patch for Unordered available on the Release Page.
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[--SNIP--]
> diff --git a/package/boost/0001-unordered-fix-copy-assign.patch b/package/boost/0001-unordered-fix-copy-assign.patch
> new file mode 100644
> index 0000000000..55f5ccf245
> --- /dev/null
> +++ b/package/boost/0001-unordered-fix-copy-assign.patch
> @@ -0,0 +1,22 @@
> +Upstream Patch for Unordered
> +
> +Prevent erroneous copying of groups data, update max load to properly propagate
> +
> +Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> +Upstream: https://github.com/boostorg/unordered/pull/210

We prefer that an Upstream references the actual commit, not the
pull-request:
    https://github.com/boostorg/unordered/commit/067884a4e213352e7c81c441f1453c54735c39f3

If the pull request contains important data that we need to know of,
then reference the pull-request in the (buildroot) commit log, maybe
with a little summary.

In this case, it dopes nt contain anythng interesting, so I just
replaced the url with the one to the commit.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +diff --git a/include/boost/unordered/detail/foa/core.hpp b/include/boost/unordered/detail/foa/core.hpp
> +index 239d05d3..7ae9f2c8 100644
> +--- a/boost/unordered/detail/foa/core.hpp
> ++++ b/boost/unordered/detail/foa/core.hpp
> +@@ -1870,9 +1870,10 @@ private:
> + 
> +   void fast_copy_elements_from(const table_core& x)
> +   {
> +-    if(arrays.elements){
> ++    if(arrays.elements&&x.arrays.elements){
> +       copy_elements_array_from(x);
> +       copy_groups_array_from(x);
> ++      size_ctrl.ml=std::size_t(x.size_ctrl.ml);
> +       size_ctrl.size=std::size_t(x.size_ctrl.size);
> +     }
> +   }
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index 36de2b9b06..14403758ac 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,5 +1,5 @@
> -# From https://www.boost.org/users/history/version_1_82_0.html
> -sha256  a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6  boost_1_82_0.tar.bz2
> +# From https://www.boost.org/users/history/version_1_83_0.html
> +sha256  6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e  boost_1_83_0.tar.bz2
>  
>  # Locally computed
>  sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index d432ab48cc..9b1baec5bf 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOOST_VERSION = 1.82.0
> +BOOST_VERSION = 1.83.0
>  BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
>  BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
>  BOOST_INSTALL_STAGING = YES
> -- 
> 2.34.1
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
