Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00661C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD325410B4;
	Sat, 12 Mar 2022 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3PLpWGhtLB5; Sat, 12 Mar 2022 20:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FC0410B0;
	Sat, 12 Mar 2022 20:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 112C71BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F186060E67
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmKWghpU0KJt for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:44:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0017560B38
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:44:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 726D97802D7;
 Sat, 12 Mar 2022 21:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647117859;
 bh=E1H9sp0BJVGCYb0cr6dPYmCY2xFQZ4lfx+rg9XQXFs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtCwnpyhqyImPoKOMtd/P+cjRWkf09mn+InPnrwbG3xC2z1tZ3p7ZT2qa6dhrtege
 nUeNpbLDZz1A1lmJm01MmB780dxjVxJyQTiQk6znvgvzUG5zxciJlU44+1+KAnbCTO
 X5MLXA4wA7CFuc8rITeihg2zBcZnl9UlaASnc7nGH6BR1mg3elPtOgZ+dd5Llfy03e
 5+X96bkgIX9wnH7jKa5Z4ygCTc1+og4QPXXTNE4s2+q8Ok1PgXgL83DRhpW3NAEcLu
 j//mpvKmCW6K2u54OZ5C6KYyfjkSrZTjGZ0H7rF7R8WeKqc52vl8z3j416JZFRzEi6
 Dm/mrQynbiBMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 21:44:17 +0100
Date: Sat, 12 Mar 2022 21:44:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220312204417.GN283544@scaer>
References: <20220311073333.29596-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311073333.29596-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/linux-firmware: bump version to
 20220310
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

Peter, All,

On 2022-03-11 08:33 +0100, Peter Seiderer spake thusly:
> - update hash of WHENCE file
> 
> - update hash of LICENSE.amdgpu (copyright year update, see [1])
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=34f9f8994a61192abfb597fc55810e3c27269ebf
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.hash | 6 +++---
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index 83275ec6d7..382e9cb2ba 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -1,9 +1,9 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
> -sha256  eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d  linux-firmware-20211216.tar.xz
> +sha256  5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182  linux-firmware-20220310.tar.xz
>  
>  # Hash for license files
>  sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
> -sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
> +sha256  a6c0ec4338bc89480da52812bea7f9e4b52bc7118e3e352141f99d779c397c53  LICENSE.amdgpu
>  sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
>  sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
>  sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
> @@ -33,6 +33,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
>  sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
>  sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
>  sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
> -sha256  dfb98c5474d6264a6554322b3936e305e9d73cc7b683932e3f17550dc7d2d29b  WHENCE
> +sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
>  sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
>  sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 2d103df05c..5ccb7f10dd 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUX_FIRMWARE_VERSION = 20211216
> +LINUX_FIRMWARE_VERSION = 20220310
>  LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES
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
