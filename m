Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5FDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3393F60F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3393F60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF386400B5;
	Sat,  9 Oct 2021 10:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5Cx9-6TJDcO; Sat,  9 Oct 2021 10:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BEF040425;
	Sat,  9 Oct 2021 10:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0881BF391
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA2560B53
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8jcU4RJwTvA for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:30:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08A55606E6
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633775450;
 bh=jPSJUc9D+xlQN8i1wBph/1bl3pRgoh/fHyfF7dnnjJQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lqvspCEODESgJCYOXxPuBgdkwuzK5/m4Bp2nbptB1MpIBt4c4RhNjxG8ZOfxoBM9V
 uFHBKcb039CUcLzT2R3a8ZuQ2gX8cjpCuaJPRjfr96y6ZF95RkyxMWNBhbuoqesIs2
 cHLSekDOMwUIlyUh+WAFE3Sob3msCKinpy23DnKc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1n6GSQ0kvo-00omKT; Sat, 09
 Oct 2021 12:30:50 +0200
Date: Sat, 9 Oct 2021 12:30:49 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211009123049.0359d4c3@gmx.net>
In-Reply-To: <20211009094144.130161-1-troglobit@gmail.com>
References: <20211009094144.130161-1-troglobit@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:1skz8vXfr2vcEblPkk9+pHZEVe99dX7czO45K3NOodyOCDKVluy
 5BUNn/Kl3ovuoFm9A1LpCV+V+yOWUylvu2PRc7rP5S6FR90Ojpz75AfQuYKsr14F7BrjKE3
 UsxytP4RF043Z2bXaC7441a/G3npKrywadMXtckhb9IVqsoLhH+pFNT9uA5JbiQUfBJywtF
 j0ROS/XJNolU4gxXTdtsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Ng7dVs5BfM=:KE/j1c6TvV6Y6nfTCFoey0
 V3/i2uyva/02j7akfeL1ZLnZucD7SSrGEdXLZsXxuwR7eFVBETJ2nJ+FNL+tfEGfyhGsoB9qT
 ysHEgEnOLHtwS/pJYM7hIjbc8VYAeNL3Pg5nB2dE63QyC0/SfstffcagSpqZdtNQp6WVS7Dr4
 9A0K+nNNy8Rl2kqco2ZCUC/4OgWx4+mjMYoDDMtPBf4WNuUwmwKT/SfzxCoL1keZqX6RnOhos
 /pHBC+KnRvnTzkDYO+TXeH6T09l1BbB5UoJgsi2SnH/MJngQNvkUn3SIRkz2QwmgkTtvNdNmm
 5wfSWW7h+nZkVlMACC3WEm2xymsgZrVqcaG3Y3UCLA3tcrbvYheEzlP3DVQJGS5lAEsqgvB81
 v79KIB4hpIPW2nLBWHiuS9jjcXs8KpCYEjOJgXYlnl7yPdaTS7h1sOtYXcrBD3919dWHzlSfb
 Hx/myp89oMpRgUMPruKTxpqcHskjCA9/Ft/QIytm2gfLtX3TtajS5LyVZHdqOpxcTjzVK6ezT
 U/YKtJIT29TiqNB+6GkOcKGjFdtly3/nVJm7Zh+jWCk/+FO4vEfNPWx+WXO706oKkCa3l+GEe
 oXWNhTjhcAC23lRSP5MKodvgpoe9JPZ8V5E91ZGzOxBEWfSKE3UBIvQmJZ1RMNjdclzwyl8KW
 1VhR0Kv5vwW90/QrRIeT6P15NJIKAhGQQaWP0nb4I8FqNVz+2FjjL/sPc+QezRbEEtpMFQQIB
 1RKK8Vr0Nj+VEcFoJhPh748X8zL/l3a0PJ296tgsdLDvdPt7GHbCRx3CJVKWhF/OtWfCS14qn
 5ODHs/3e59tVumi8mDoaNN8+uEolM39v+v2L2oSJlPtCFUazRWN3AQC3W1IxQwrsryACV8tg7
 Fvj4sZm5SIzC9wMXdfk8zAu5JVfVruCMbfO95GN0CmHebSlSbpszFewzvsEURLp0iiBsSaSMG
 Xmvj1n0IonsZhDsMnarAEAXxjo/zRyhm4JGaTOnh7d3agIt9y76fj4wYF0Bmf6R2SOK/gXkCy
 BiAktUrn1z7sgcstNq9f27OvIBIcgS0G5pBrS2DX+F3++tAip8vPsS6EuYAs1moGyOdCAuDeJ
 pXXtvSbIO6ZSy4=
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: bump version to v2.4.0
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

Hello Joachim,

On Sat,  9 Oct 2021 11:41:44 +0200, Joachim Wiberg <troglobit@gmail.com> wrote:

> This update is critical for linking against GLIBC v2.34, due to the
> changes related to 64-bit time_t on 32-bit systems.  See ChangeLog
> for details:
>
>   https://github.com/troglobit/libuev/releases/tag/v2.4.0
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Thanks for the patch, version bump already suggested, see [1], but
preferring your version because of the additional glibc-2.34 info ;-)

Feel free to (additional) adopt the package ;-)

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20211005203156.23462-1-ps.report@gmx.net/

> ---
>  package/libuev/libuev.hash | 4 ++--
>  package/libuev/libuev.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
> index d52d210d10..e5c9660a02 100644
> --- a/package/libuev/libuev.hash
> +++ b/package/libuev/libuev.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/troglobit/libuev/releases/download/v2.3.2/libuev-2.3.2.tar.xz.sha256
> -sha256  af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9  libuev-2.3.2.tar.xz
> +# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
> +sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
>  # License files
>  sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
> diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
> index 8a6759a2d7..a32381dcc5 100644
> --- a/package/libuev/libuev.mk
> +++ b/package/libuev/libuev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -LIBUEV_VERSION = 2.3.2
> +LIBUEV_VERSION = 2.4.0
>  LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
>  LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
>  LIBUEV_LICENSE = MIT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
