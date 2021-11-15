Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46FCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:19:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C68B61AAA
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C68B61AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5127140106;
	Mon, 15 Nov 2021 15:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gp2HyZK7wJXV; Mon, 15 Nov 2021 15:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54E9B40181;
	Mon, 15 Nov 2021 15:19:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD2A31BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8A5540178
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcANINxbOmeO for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:18:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B836540106
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636989532;
 bh=fW/puD2Wew/FgqXEpkpOeqAvMwy27tRszzWt3WGHjhI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IReb/YdMekB4VjYmP2bmuyYUPNcpRx5jefHlLWMdL/1pYXYmng/CsuXsnqW5b8EjR
 Lg9Hd/4/sBGV31UJrZgktGjRKTa+gMLntt9RYOSC9SNIqHX+/MZahdHZjIfaaTsYA4
 FSkOb/eHPeBE3FjQpSCp+J/o7Ri25Gijdr2ZXw+Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.243]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1mxJwN0mtP-00Bwk4; Mon, 15
 Nov 2021 16:18:52 +0100
Date: Mon, 15 Nov 2021 16:18:51 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211115161851.0897fb8b@gmx.net>
In-Reply-To: <20211115134205.4176891-1-troglobit@gmail.com>
References: <20211115134205.4176891-1-troglobit@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:BTEliET56a5PJcPoDZgGX/lDUYQ/VDkw0Q8nnzBIC88FYJx1r1p
 4lIUAxdpkGcOk78pIAbhJ8wydvi92zxvp8nPSN50Y4SQtvvS9vjAAhZtj2e1xDBUj/LhuL4
 bb0mTIXcIm3G6rd00OmsJqKsD0hBLc98DconmdHNfBUbbEzQ4mWmdYMYXE0N9R1uHTYJBdQ
 b3WdB7kRPUo/5+5RZ97KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4WsHcEP75WE=:UNJhWJCOFJQ6gc5LgIr3dP
 T0jzzhfhY/al30C3/C8htPZB9VL1myFZBU3JFNF60wZIHZuMJ4H3uSqIRQlLGP58P4yEm309V
 OS6vWpIAkLcyUYUrw7DxFLwQMnzpt4Gy7LIbulZN6r17ZX6yIOUIJ66tVatBk9MMCtKzqcsFJ
 Q/lp4pNJMf5pJQFLPw3Uy+3Xs5RGkUiCNsTqruYV4eW7Fapohjhr+4aANBb7NrTUTQDLzGhCm
 nnBru5wf1hwIalkmF5irZnCb4VUOGVrFEBJLyo6kvL2em2Ckhu5XqdExSAFBAOwWzrqoL+upq
 nt6p72JrMIG1M8+xRrfOT5i+3nN2NXgVcpu/Kzk7nzbzbMhVke4+VmJueo84J7PLzVLzrwgxs
 vtgaPc60o85gxTDjMwKnINvSAnICzLpdDDz1cJA7eK6stReAEdxHYPHGKgpZU7hes52KWXhNq
 oIe1tlXRZRvsKUyHQuvHhcKv8+P+qZTSo0DVmo0IECZXxLOOcnRwBz0hp7d2atzorDzY0OCKn
 EONNeUXvD6ooQyJUfUVXYHm0EoBpoXLOrBCDZ4qdgTh+sWCWyyBplOSvIPhA0bk4JFEKYCEMj
 dmq+rt1KQdgKOI9yRKJ8CcKa/EcLNc4OZBb7XPFkpAOe603gjXhpY3h1RXBoUEDcGSLry7ZBh
 g+APFJ+i3LbKWjdSw0EevB4M8xi4KL0LKDxxJlCEdglB3ZsX+zbkaHWdjkLsdoftNvknVx0jc
 MYM2Q4AE7KqzFJ528JrAw4gL9rN83nt0Rqb5meVNyxyHrzEe1r0wE9fzShHztsGEQSZGHpJdr
 54urBis1C/x4wKo9Sm1Wq9jMjOwpblKcARidALSZwsuMyCg8fXxcGG/1bzarScBgv2unxM2qI
 iTGDXBNk0JzLB14LP2OUeI6/FtLukqqCoKafES6XmQU0wJXj/2UA+fKMcVhV2M7kcJPA3jcM5
 1v5B4ZTSJFj/BJNjo36n8od1HPzKrB5xNr9AnKyRYH0ObOs/wMOgeqh+sK8/dyJJtvnMJR069
 X4FNaPtFHkM5LOtBk6a2gWlT+RwFLfNqXLsocp6H7xDMbvAsmds8BUvGflHaPoZsq1FXooQoS
 E0KO1VAWmUm/E4=
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to
 v5.15.0
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


On Mon, 15 Nov 2021 14:42:05 +0100, Joachim Wiberg <troglobit@gmail.com> wrote:

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/iproute2/iproute2.hash | 2 +-
>  package/iproute2/iproute2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index 2837edb09d..d8d619cbda 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4  iproute2-5.14.0.tar.xz
> +sha256  38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff  iproute2-5.15.0.tar.xz
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index fdf442a429..4162e38eb7 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -IPROUTE2_VERSION = 5.14.0
> +IPROUTE2_VERSION = 5.15.0
>  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \


Sorry, its a duplicate...., iproute2 version bump already suggested and
applied to the next branch, see:

	https://git.buildroot.net/buildroot/commit/?h=next&id=bd06a3b9b507b14f3cf69f45ed165d132790ad75

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
