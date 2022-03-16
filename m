Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6439C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BAFE401DF;
	Wed, 16 Mar 2022 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXKjUo9an2XW; Wed, 16 Mar 2022 21:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB8A40177;
	Wed, 16 Mar 2022 21:45:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC3E1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 898A64171A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZR_Ja_2nwu6 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:44:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A38B40882
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:44:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C405F13F86A;
 Wed, 16 Mar 2022 22:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647467085;
 bh=hgH5jty0N1o2YbvSbRABz2eH2gi2XdymXGbdQxxfv2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/uuzKTe7f7BFaPO5KVvnH4mDzkyDKMRJzWKG4yF047mG1XidgivQWKJ3OuRVebQR
 0983hI23XGxQryPiBHRh9RC2BiskFxQgiFcvwrHaPZycWW49qX3d9aqjEdgZnISDog
 RY9lIA/01x5mgSJLO6IyyKkMqnsJcGIPwNu5f5GF00r0Pby20yWOyk0ezLc+6L9/9a
 ypJ61Wg5c9BFzThHbyn6WpWLJx2B9Wkc5hOB8ftTb04XS+7ANP7ZEIr3idhA1kZm/y
 50CIKvxDpmXiqHoDV//B/zMOSx8HF2kMVqM5cy1UUPqNXXpegxB4jjbEKRD+eie0s8
 YhlPqAEcAiwkQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 22:44:41 +0100
Date: Wed, 16 Mar 2022 22:44:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220316214441.GB283544@scaer>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/6] package/zynaddsubfx: fix PluginEnable
 option
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-16 22:22 +0100, Fabrice Fontaine spake thusly:
> Replace False by OFF when setting PluginEnable option
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 6 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zynaddsubfx/zynaddsubfx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
> index 158b5b4ede..c8d64f5ce8 100644
> --- a/package/zynaddsubfx/zynaddsubfx.mk
> +++ b/package/zynaddsubfx/zynaddsubfx.mk
> @@ -11,7 +11,7 @@ ZYNADDSUBFX_LICENSE = GPL-2.0+
>  ZYNADDSUBFX_LICENSE_FILES = COPYING
>  
>  # There is no package in buildroot using LV2 plugins: disabling
> -ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=False
> +ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
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
