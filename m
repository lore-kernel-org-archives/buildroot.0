Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E77C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 19:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB7081291;
	Wed, 16 Mar 2022 19:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9k6t09eamsdY; Wed, 16 Mar 2022 19:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BCF081268;
	Wed, 16 Mar 2022 19:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8CEB1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81DEF80D5E
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U35i_YEOtOlM for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 19:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 006EC80DB9
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 19:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647459814;
 bh=kx9LNNP4lb7k8cg1gWtjXMfJzn/Z/o0Utwrrr+A50v0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dbYYTF8LnjyRL+QwOIUtR3ctY18/Tv3X34WunQKPOlU9/iU90WLImNkb/U4ihU5tb
 qRxGWp0WpgOsZgt6yDkazWHABdArgA+7PJ3I3xPGytaQFhOTUOpsGp5l2vrsGTjCgs
 DVagPfPxnnT/NK/kOg//ASpxT9vAOeec7AZHpBGE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.226]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1oJLhN3mPY-00xbve; Wed, 16
 Mar 2022 20:43:34 +0100
Date: Wed, 16 Mar 2022 20:43:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220316204332.4cabeba1@gmx.net>
In-Reply-To: <20220316190545.3618918-1-james.hilliard1@gmail.com>
References: <20220316190545.3618918-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:pZyh4Og0NYL7Omnqvd1YurIJFvcckmmjCgr2hO1F52L1NPmg24X
 TIbafnTzDjUKlAxk99EGB3xUUBZz2mQlMvjW3cAiHm67kj9Ht2J9SKNC7BEes7z6UW6Mw8b
 RLxer2OLRpr+LZk9Ca3dmRypDFEoht2asWL0GGQ+kl16cRJqsXTv8qTSnAmumvrA5pdMh0L
 5mEKeyo5/lNWnEmO6HmMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Lz4J4rRwDQ=:V+qUf99d6SlZzG5Z2fhiuY
 aScEc9WCv/0zKuKtRFEiXpuKl4n3t9guX2mon2QiOp9yPb5Fy5bZXiZR9hfOMCngveS9pYNey
 W/np3zzzHD3Vni2eqLAvRPE1kCLHmuOauik2sUasmptbYhSOr+eHMWCImjO7ImPv7YenIWI82
 6RaA+u/U+CFzf85oHtaDS1tv6E6o1Wjdsr1G2y6VWnfT7MTw8i6r/NvS7lW5wlWvynNWxqpOD
 7LFJUKRiBBvY+oGKi05raTPvJm4jA8/bH6o5nGZWmXvBMR/K5kAwxh88ufGKCA2Z4D5D2yrhc
 Q5NtPLxxPfRgGSAQlN1DWaUfT0QfQbHxU1VrZjxDuSL+fSjElGgueZQWZQpXVyxfWR1CBRaea
 MBmwgr34dsHlCg8sppvi48KQQ7QTBh+IBqM4L165Ji+wYExkKXLF64Pe+pDVlxRpVgc3WHVgi
 zTe4SuGq7jdQCx0/c6egzGy8bAJ5BYEW7HP8vW3BXNihO36EncleRHsyw6OGWnYaiFVt4FWY9
 e6Q6VwLlyxjiTaNZXU15JJQ8TSnzTqDg5kpzmh1gPTJNcV3FSIjVIMFIbZfcCzHj0w5h01JTn
 g5pdVzVO3F8pb6euhG11qugJwJmFgqIBASW4JUVFKDTyqgMaFZYHv/FDPkBWUGQIzf/oteRAk
 DM5zJ8tr/Q5rYQEeGQORX5Uv9xV7Vc0MYpTmEQkVwAtzjnuIESOFmnQKbcm2+JvtcMD3WLonN
 dKtR8Nr0LqM+UmmjU2N83ReG+s67MQqBL7/huP+8pw0stqIBQsMuRbnTezvGevwUVSMRypP3o
 pqVpakM0y+fPC7Xhmz0ejpYrkfx6hXeDgk90lJR6sYqJmEgP0ipFtLn/AsTDLtcMBlQA8wC3G
 rl1ydEadbpi5W27+3MKRyXy44lRufXVHkDHqnSOgktHGX6tTCNz+7hJFikfRnzonuHJgG+kZ8
 yaeGFo94TsspdeOmxuZrqC+XICxqEI1XlVNsb9VH5MvgBRZSMsPGSuEqJH1+Pewhsg1vS2tM3
 8QtTLUcU/8f7+VNhRGfpyC+ke9VJkk7OyXb9W705dBeSjIxsQxvHwZ0sDZTKu4CLIKAL+nOsq
 N1mb7vxrW44JKA=
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.49
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

Hello James,

On Wed, 16 Mar 2022 13:05:44 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for the patch/update, one nitpick...

An (upstream) change log entry would be nice, see [1] for an example...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/package/ell?id=c01a8397d9923c38b14a0d083ba1cf3ee3a3049a

> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index 4bde1ab677..9affa390b8 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
> +sha256  a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f  ell-0.49.tar.xz
>
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 267b44e5f0..9735865eae 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -ELL_VERSION = 0.48
> +ELL_VERSION = 0.49
>  ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>  ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>  ELL_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
