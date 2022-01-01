Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D872C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5572D404A9;
	Sat,  1 Jan 2022 10:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ip1umMeXZ5QS; Sat,  1 Jan 2022 10:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 502254012F;
	Sat,  1 Jan 2022 10:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2A501BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFF44400B6
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGlSpfu3G0nC for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB7264009F
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:08:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3A0375FF27;
 Sat,  1 Jan 2022 11:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641031717;
 bh=vLoOR3CN0qGzlvAmUF0GMJLIMcOmeqg0TTEA3O73wlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XzQyMgVEk0EeoPfHPRsLLA3T92LaoIdCDUAjv8L62DhHfkcFh8uWJDHO0oR6g2UK9
 YwgSJ4Uz0/xS1dERWoWrEEEq7QVG+kwirtMDKx0UTsonHH1IktMdhNo1ycwmimYtqa
 hwzsJ5P929xzCgpfr6pTeX6HJMwUZVtgPnhOu77dIvqa8T7fW/eUEONN1gIohekLtk
 Li7w+RTfUv1dTnfzNel3cadis+LqJ7XIUKJM/0TAHstyN/iYuXXR/I7CJFQOH8Thdl
 H1Q6D2L/RbPYWsiZ23VHHiBZzaW+Al+iHFwgDnsgGynP0MUqSSWrKYLLUUEuqyVETX
 GyzSeTVbCp5dA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:08:30 +0100
Date: Sat, 1 Jan 2022 11:08:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101100830.GW3390456@scaer>
References: <20211231090030.3437133-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231090030.3437133-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ogre: disable csharp
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-31 10:00 +0100, Fabrice Fontaine spake thusly:
> Disable csharp to avoid the following build failure with python since
> bump to version 1.12.12 in commit
> 4e814227caa0a5d190e36cd5174239fe5c627279 and
> https://github.com/OGRECave/ogre/commit/3fd839c76a153e614c9e3131ff9959234099e749:
> 
> /bin/sh: 1: mcs: not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5f384dbed8e5241f91072bfffa54ba6b9c509751
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ogre/ogre.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
> index 72c96cb33a..72fd616c0c 100644
> --- a/package/ogre/ogre.mk
> +++ b/package/ogre/ogre.mk
> @@ -33,6 +33,7 @@ OGRE_CXXFLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
>  # Disable java and nvidia cg support.
>  # Disable imgui overlay to avoid extra download from CMake.
>  OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
> +	-DOGRE_BUILD_COMPONENT_CSHARP=OFF \
>  	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
>  	-DOGRE_BUILD_PLUGIN_CG=OFF \
>  	-DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI=OFF \
> -- 
> 2.33.0
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
