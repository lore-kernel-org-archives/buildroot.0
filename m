Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA459C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7410260F2A;
	Mon, 31 Jan 2022 22:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8txlpmxgPMB; Mon, 31 Jan 2022 22:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE7E60F26;
	Mon, 31 Jan 2022 22:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 657481BF2A3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 543C260F1C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcmKltSoMsai for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:10:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11CF960AC6
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643667044;
 bh=904uVjeg2OJ+5WVnJeM7V3gAijPWN01BjQSMhJiTN08=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XBdiFzti8Waxj4g3Ix226vcRwK8pukCvr4xYdAXzn1zPR628g8fT7+FQLyzpXkS75
 uTxJU9qSQVdDubNyMlOI8uq7IU4InmVXf1DUze2JGeR1TcCtyjt0hen+tVuc0paNPB
 hyOL8WSfz/Uq3GYXqQzroB1HetNIhBG29+gAEX6c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.249]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1n8a5837TG-007D2y; Mon, 31
 Jan 2022 23:10:44 +0100
Date: Mon, 31 Jan 2022 23:10:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220131231043.615b992b@gmx.net>
In-Reply-To: <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
References: <cover.1643665029.git.yann.morin.1998@free.fr>
 <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZbLCFeNvCj350LpxnWSS5W0LI8fO9Y1cqT9cp6EqZ2icvYoGSEy
 XppGbouBFzBwqQWuthCRfFI9+OXotSP2e8gpvQNjhD9lXQfEu3LqDSr2fbORJY9Hc0qiYfR
 ztFolA9u/cHlK3rL8wGf7/+g91XQZyjcRfZJ5k9U8Jml4M65iK1pVvhVl0GJOtpWzZ+bvVQ
 iTsZzjU1+ijjBGSDSAGYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U8lxBFJtZIU=:zt58kMIj15lzLbWVwVjnTL
 MyGodsywReRZVOuH/dpUNa6H4DmNTDpldFeRpYOE5mbr/kuDMP2BHy/6mGf1fX84SHCmmHQ/t
 gyonVOyuradU+banv5Lh8+Uavr0OBZlfg/hQlFb5AmrAfrRh2DHDL4NnZQaeJXw6dq6Wo45Mv
 N2Oe2Id3JsfgqiWU0Hgdw1Bijh+GYuenTPJDD8QTI8qCfj5+SGcuCR5iYB9xjp1ItcpOhDoJB
 iMLgScY0yAhwwpAhR3W3Kua+HsiquFGmEOel66Ep3dwWLOYKQ8KvEVXjkreEzrr9PR+f7gr53
 T8Qq2rjj41d4f9E9I56hKt46VN/1FkdCBXiCO+z/7IyfTmK4+QzcEyI0TS6eIA0XfU07pr19v
 R2C50fp947zS0io5qepvpA4sz0MLfEzvjzrwD/iPyBpkn9cx4t+Q50WajEzkHR8iXCqqyynln
 RqkxdwlFwU8U/878OV8vYnkHJ3Au5tP7wBOVKe8LKhrO7rigQKbPDb6qdQyebOrviAz538J1Z
 WXDOCuQ4zeulpyu9xIaqkLCPT1w8REY7abyQFvVxZQr3y+X89qCP1W+Z4YOuVlexQi2+ZDmW6
 /D/1ab0nCv6WtO9IqQRitxUxFJdFfxOShIQeVv0eFi5+EDBiqeiNN1vuKTjPyaC1YSR+dVtsV
 EgVF/93tFyu8gblSh3GLpz00qJEmBagOP21UHAFa8m+hXw1W+WUM2KIZ9wcn61UMFDAkAuCGH
 UJmUY/dVz88vAvGFjR79cYhyP7BqEwx7bWApqS3umlXuns8cE99j99ki0p69tXgGtruYDwjQU
 1YQNIWDf0K/snnTj2PInwGvVpGDLWrxoTb4n3E0O4IzmwWpDxZ7vIaSFT8JBBOIK43F4U1njO
 +LmbU6Z/nQpLaBVmwvBEJY+D3vaXKtsA+ERkvH1fNm3+sLYNWtazYkGd5iYGqYempWfTvuLSe
 20CsqeR6FQkCXXUFZKEJrebnlfzzTXz2FcNxlo6NNBnUZuY7N/E4mfxmV0HuyEB6N8qpmkR8x
 535DGNA0HvpvgK88e9wb9RrOcDjx+/F4f8Z2UISKLCiqzE79hJlYrwCVHBh61F4ZOzNZyZScr
 gRSJYvl344LOzs=
Subject: Re: [Buildroot] [PATCH 2/2 v2] linux: fix build with host-gcc 10+
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

Hello Yann,

one nitpick...

On Mon, 31 Jan 2022 22:38:09 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Some older versions of linux, or custom versions (like forks for some
> boards), fail to build with host-gcc 10+, because of redefined symbols:
>
>       HOSTLD  scripts/dtc/dtc
>     /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
>     of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
>     collect2: error: ld returned 1 exit status
>
> Since this has been fixed in recent-ish versions, we can't use an
> unconditionaly patch, so we must have a conditional patch. However, a
> patch may not always apply to arbitrary U-Boot versions or forks.

s/U-Boot/Linux kernel/

Regards,
Peter

>
> Upstream just dropped that line altogether:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639
>
> So, we use a little sed-grep combo to do the exact same change.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ---
> Changes v1 -> v2:
>   - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
> ---
>  linux/linux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index dd2eebd446..410b714360 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -268,6 +268,13 @@ endef
>
>  LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
>
> +# Older versions break on gcc 10+ because of redefined symbols
> +define LINUX_DROP_YYLLOC
> +	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
> +	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
> +
>  # Older linux kernels use deprecated perl constructs in timeconst.pl
>  # that were removed for perl 5.22+ so it breaks on newer distributions
>  # Try a dry-run patch to see if this applies, if it does go ahead

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
