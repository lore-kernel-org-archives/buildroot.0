Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18400E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C183C40B2F;
	Sat, 30 Sep 2023 15:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C183C40B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFknFnb8gBVn; Sat, 30 Sep 2023 15:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D469841585;
	Sat, 30 Sep 2023 15:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D469841585
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0CDD1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B73E74195F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73E74195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGlkT5M_Uw1i for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:20:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 602A6402C1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 602A6402C1
Received: by mail.gandi.net (Postfix) with ESMTPSA id A68D8FF806;
 Sat, 30 Sep 2023 15:20:24 +0000 (UTC)
Date: Sat, 30 Sep 2023 17:20:24 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20230930172024.5aaf0df6@windsurf>
In-Reply-To: <20230921215633.34828-1-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696087225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9o4ETwNtiKafarKIksVy5QkP/Na1/LgTMU0+jGjM34=;
 b=D/Hq8P6JUNZLvy+0TK4l8aflCX75725hIEfN6fc6Gy1vofHWtKbc+9d85IZlCn3lt+VNui
 YLuM7pKDfONCBOiut78fS58WiQ100Di740HthOzjXlfEUWKFWIrFobsd7HpbC+bCsSNEfp
 6AMUwFhG3NjYee+7Qlk1gi7PvrK1HXn7WcUVx9WV2YTnbuHIeo8xc+bsh2pdoyI2vhbYmc
 b4L6ayTzlNyOVk4Ec38gtUgs6y1JTQi2WLSUPeVuhXHjBVQrWQnYhjW6YgYvoqa/aq8vqw
 h2EwbbeR1ANuPLduo2lMOeOjSihS2n5EuVumpjgBQ5m9Ta8Mt6tWq3qIh9OMQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D/Hq8P6J
Subject: Re: [Buildroot] [PATCH 1/4] board/freescale: fix
 arm-trusted-firmware for binutils 2.39+
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Gilles Talis <gilles.talis@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 21:56:30 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The NXP arm-trusted-firmware forks use an older version of ATF that will
> error with "LOAD segment with RWX permissions". Similar patches are
> present in boot/arm-trusted-firmware/ for older ATF versions.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  ...dd-support-for-new-binutils-versions.patch | 61 +++++++++++++++++++
>  configs/freescale_imx8mmevk_defconfig         |  1 +
>  configs/freescale_imx8mnevk_defconfig         |  1 +
>  configs/freescale_imx8mpevk_defconfig         |  1 +
>  configs/freescale_imx8mqevk_defconfig         |  1 +
>  configs/freescale_imx8qmmek_defconfig         |  1 +
>  configs/freescale_imx8qxpmek_defconfig        |  1 +
>  configs/ls1028ardb_defconfig                  |  3 +
>  8 files changed, 70 insertions(+)
>  create mode 100644 board/freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch

Applied to master after references to the Gitlab CI failures that are
fixed by this change. If you have the boards at hand, it would be even
nicer to upgrade to newer BSP component versions. Perhaps this is
something that Maeva, Stephane or Gilles can help with?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
