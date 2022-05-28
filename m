Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0033D4272C;
	Sat, 28 May 2022 18:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UKMBaeAz4dg; Sat, 28 May 2022 18:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A32D41964;
	Sat, 28 May 2022 18:43:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 981531BF385
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9431241964
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiMB59F2hN3V for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 18:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0406B4181D
 for <buildroot@buildroot.org>; Sat, 28 May 2022 18:43:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D413719F5A5;
 Sat, 28 May 2022 20:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653763391;
 bh=QdlCSRPxKg4tomncg4zVMZCbv2q14AGwDrbVjhdvtAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udy1jdZyYsAFsNaSeHPkOx/RluXSdiOVd3XGJJs147A8lqHbLIW0fmjeVpEKCrKKG
 Rt4M7gAvalXtCnX6BlwO7wpFhTArtfMMJW9kt31fPUYLN4RmnI0XqMTEnr+r0RK4XS
 NS2exvm1dPlsW7dP9TyY20i7GQOHp/19WbNzOk+U5y2WdPbJVnkj2gyPBp1IUOKpWM
 pz/iPbVptol3MoQrYC1wTr70uEBlyophLJ7VqvG7ADSsf61gEKqfLyoMd5K8B9RarY
 d9TDJwb7sGj9eAJPCnmFjMLO0IcPeKr3sQqOJEXMhD26E68frXoU4rTTG4KrxAAE1c
 MFSJcwi3U8vwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 20:43:07 +0200
Date: Sat, 28 May 2022 20:43:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528184307.GA849217@scaer>
References: <20220527202707.1747842-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527202707.1747842-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-boost: fix host
 dependencies
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-27 22:27 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> e2f1f28efd4236431b333fabe6c75aceba9678bc:
> 
> make: *** No rule to make target 'hoost-boost', needed by '/home/autobuild/autobuild/instance-8/output-1/build/host-libodb-boost-2.4.0/.stamp_configured'.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b7acb03dfc7c7ce27db5536d337f4d61a8cc7a4d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libodb-boost/libodb-boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> index 6deb67f943..996759a03a 100644
> --- a/package/libodb-boost/libodb-boost.mk
> +++ b/package/libodb-boost/libodb-boost.mk
> @@ -12,7 +12,7 @@ LIBODB_BOOST_INSTALL_STAGING = YES
>  LIBODB_BOOST_LICENSE = GPL-2.0
>  LIBODB_BOOST_LICENSE_FILES = LICENSE
>  LIBODB_BOOST_DEPENDENCIES = boost libodb
> -HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
> +HOST_LIBODB_BOOST_DEPENDENCIES = host-boost host-libodb
>  LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  HOST_LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
>  
> -- 
> 2.35.1
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
