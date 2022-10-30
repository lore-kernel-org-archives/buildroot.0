Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF43FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B5C80B56;
	Sun, 30 Oct 2022 16:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B5C80B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIpRAVXqoa0c; Sun, 30 Oct 2022 16:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B0A80A66;
	Sun, 30 Oct 2022 16:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B0A80A66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA3D1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D0581098
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D0581098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb8x9m9_eloL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 176C0812AC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 176C0812AC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:48:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5934D13F8C8;
 Sun, 30 Oct 2022 17:48:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:48:25 +0100
Date: Sun, 30 Oct 2022 17:48:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20221030164825.GV1058960@scaer>
References: <20221029110943.155259-1-glex.spb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029110943.155259-1-glex.spb@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667148508;
 bh=3Xepk59IQhFoyErLJqjaL50FgE2In+rAaDj4xawZ1M4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JW9V5ESG4FBaB9VNe7Zi+XNfPubJDOEZF/PhyhmylZx83uAdVzlhf39OBZYwf1AXB
 dVAVDSlIJ4BP8qc4gtvepNLbtj9Q0d0ve7S0sxScImXYBs5zpog2fbN/Sl/xZigzTU
 zGv/Dd2EtA7I0svRcXTmM60nbQoRWH6JV1hbpiOHhRvk5MwaKFO8ty1fhr29cC1Xpq
 RzQbDQwJsnp+w1J+kevQF60p8X5cTYhZowOx2KJCFmCvZWqhl/BVW+yBi/72IqGADy
 otoUEV4quekzL+aJT/l8YMheeirEoA3x2w6F3+pr5I2VE7e71+jtwUeTPc0xYKB6jO
 HL8L+ft61d+0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JW9V5ESG
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: unset
 CMAKE_GENERATOR vars
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gleb, All,

On 2022-10-29 12:09 +0100, Gleb Mazovetskiy spake thusly:
> If the user environment defines `CMAKE_GENERATOR` (e.g.
> `CMAKE_GENERATOR=Ninja`), buildroot would previously fail to build cmake
> packages because buildroot uses `make` explicitly (as opposed to
> `cmake --build`).
> 
> Unsets all the `CMAKE_GENERATOR*` variables before configuring a cmake
> package.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 081960b5bf..96b2579cc5 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -86,6 +86,7 @@ define $(2)_CONFIGURE_CMDS
>  	(mkdir -p $$($$(PKG)_BUILDDIR) && \
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \

I've instead applied the patch from Woody:
    https://patchwork.ozlabs.org/project/buildroot/patch/94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com/

So I dropped your patch.

In the future, we should be able to replace the hard-coded "Unix
Makefiles" with a per-package setting, where package can elect building
built with nother backend (or better yet, switch netirely to another
backend globally), and the patch from Woody felt like slightly preparing
for that future.

Regards,
Yann E. MORIN.

>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> @@ -111,6 +112,7 @@ define $(2)_CONFIGURE_CMDS
>  	(mkdir -p $$($$(PKG)_BUILDDIR) && \
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
> +	unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \
>  	PATH=$$(BR_PATH) \
>  	PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
>  	PKG_CONFIG_SYSROOT_DIR="/" \
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
