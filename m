Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1898C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5134460BEE;
	Tue, 23 Aug 2022 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5134460BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsWbNfesc1NT; Tue, 23 Aug 2022 21:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AAFC60B4C;
	Tue, 23 Aug 2022 21:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AAFC60B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 803651BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BADA81289
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BADA81289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k09fW3NtNo-1 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:22:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6E381281
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A6E381281
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 21:22:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9647860005;
 Tue, 23 Aug 2022 21:22:32 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:22:31 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220823232231.6fc5fd7f@windsurf>
In-Reply-To: <20220816175503.1280276-3-francois.perrad@gadz.org>
References: <20220816175503.1280276-1-francois.perrad@gadz.org>
 <20220816175503.1280276-3-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661289753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/3xnbRMbL8VSa32RBKi+nAQeNZnbPDQ9OWG025Ql50=;
 b=FUnsZdkHT1zsAnX+X+be0S5xkD72+eflc8SOGtgV5pb4VD7YWp0CcJH/JUN37rp7j/aFi+
 B/Z2QjT4Y1LsW2Uss68GS5O0kJbqrFM7Q7RH5A9bySkJlJfOjc08ajlRiKkU5XDltQLYSS
 iW1xM0MwtVnzpE+UVlQmKSVJfedfdS28ZeRI3J4eI8TvNttLtz3A39FZxU4yrIwj//i5gJ
 iHormlrRPtZxsk/9/pwaW7sW6g2OhACUF8xjhb8iq/zvORlZW9uQ6G50gqgnyPeRX41kHZ
 g+9nnavvhApjIA0Y3bmsThdJchLuXZNbzes3fP1t2NgwAwnIhAf7nfnjhNIgCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FUnsZdkH
Subject: Re: [Buildroot] [PATCH v4 2/2] board/freescale/ls1028ardb: new board
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
Cc: buildroot@busybox.net,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Aug 2022 19:55:03 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
> new file mode 100644
> index 000000000..605e41d70
> --- /dev/null
> +++ b/configs/ls1028ardb_defconfig
> @@ -0,0 +1,57 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +# Toolchain
> +# Linux headers same as kernel, a 5.10 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# wchar required by eudev
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

I dropped this since we're now using glibc by default.

> +# Host utilities
> +BR2_PACKAGE_HOST_GENIMAGE=y

I added:

BR2_PACKAGE_HOST_QORIQ_RCW=y

because the arm-trusted-firmware now depends on qoriq-rcw instead of
selecting it.

Applied to next with those two changes!

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
