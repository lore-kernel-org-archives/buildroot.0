Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 13:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB2940004;
	Sat, 15 Jan 2022 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDQadRbQqpeF; Sat, 15 Jan 2022 13:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 614014036E;
	Sat, 15 Jan 2022 13:08:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09F971BF5D7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC7C840327
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 13:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nh6N4IESG97z for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 13:08:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23DE4402E8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 13:08:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7453E13F84C;
 Sat, 15 Jan 2022 14:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642252114;
 bh=pmLYZyTRN1e0nWrSDX7wifpQhzXnHEDa9fAQBFH24YI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uh9jw98qiCW74V4ShLvGKcoIB7qcHMw9SYsId42Ep3zFq+AFfRs/xlSWxQKzPAL6o
 3epBNBr6Olpin06m3topRCaf68LwuY3dXw7x4zwFK/DfS89Glid9yJKC0pmzVdwmpr
 7TkgORNa4r1gGN1ZZB5XUzsTz4UjRyz0aTH2iTcLHnBFiBr2VzGYcSZF7OZlkTKloE
 1/h3ID82cLwY9f9Z9okkUYonVxj1N0Hczq41/vQJbYDPqQpjBwFZeHWOH6JyKL1j2c
 dfqu4XWTupuzTvtAFENk120UR/Ye5IvgqoyrseBnM7R16t/tS0gOBVERg/I0Nlnnh7
 3FmfHS2uFrKbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 14:08:28 +0100
Date: Sat, 15 Jan 2022 14:08:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115130828.GM1945846@scaer>
References: <20220115103754.1759593-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115103754.1759593-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: enable all features
 except python on host
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

+Peter K., +Thomas P., +Arnout.

On 2022-01-15 11:37 +0100, Fabrice Fontaine spake thusly:
> Enable all features except python on host variant as suggested by
> Yann E. Morin in
> https://patchwork.ozlabs.org/project/buildroot/patch/20220114171847.634174-1-fontaine.fabrice@gmail.com
> 
> Indeed, host packages have no way to express their dependencies on host
> boost

So, I was not expecting an actual patch so fast, and I was doing more
testing here...

So, with a recent-enough gcc (e.g. gcc-10 as is available in our Docker
image used in our CI), the full Boost (save for python) is indeed built.

So I gave it a shot on a much older system, like my autobuilder, that is
still running gcc-4.8. And there, only the headers component is built;
everything else is just skipped.

This means that host packages that depend on specific features of
host-boost will fail randomly depending on the host system, and there is
no way to prevent that, except by adding appropriate Config.in.host
options for host-boost.

Note: in our case, host-riscv-isa-sim already depends on gcc >= 4.9, so
it would not be selectable on my autobuilder. But still...

So I wonder what we should do... Any idea?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 2d2a8fb311..ad071ed206 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -12,13 +12,7 @@ BOOST_LICENSE = BSL-1.0
>  BOOST_LICENSE_FILES = LICENSE_1_0.txt
>  BOOST_CPE_ID_VENDOR = boost
>  
> -# keep host variant as minimal as possible
> -HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
> -	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -	contract container coroutine date_time exception fiber filesystem graph \
> -	graph_parallel iostreams json locale log math mpi nowide program_options \
> -	python random serialization stacktrace test thread timer \
> -	type_erasure wave)
> +HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc --without-libraries=python
>  
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
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
