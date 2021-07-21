Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A8BC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9887F61001
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9887F61001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hazent.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCD083123;
	Wed, 21 Jul 2021 06:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJRMiyJrx_xO; Wed, 21 Jul 2021 06:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE8B283104;
	Wed, 21 Jul 2021 06:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72D891BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62033404C4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6m4GVBZAoCST for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:46:59 +0000 (UTC)
X-Greylist: delayed 00:09:17 by SQLgrey-1.8.0
Received: from collins.gmr.ssr.upm.es (unknown [82.213.202.155])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8957E402CB
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:46:58 +0000 (UTC)
Received: by collins.gmr.ssr.upm.es (Postfix, from userid 1000)
 id C3B4AE80C6C; Wed, 21 Jul 2021 08:37:39 +0200 (CEST)
Date: Wed, 21 Jul 2021 08:37:39 +0200
From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To: buildroot <buildroot@buildroot.org>, Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <YPfAs6EuysCKtZgQ@collins.gmr.ssr.upm.es>
References: <20210715062814.8076-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715062814.8076-1-alvaro.gamez@hazent.com>
Subject: Re: [Buildroot] [PATCH] configs/digilent_genesys_zu_defconfig: add
 Digilent Genesys ZU board (ZynqMP SoC)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, Jul 15, 2021 at 08:28:14AM +0200, Alvaro Gamez Machado wrote:
> This adds support the Digilent Genesys ZU development board.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  ...ve-redundant-YYLOC-global-declaratio.patch |    52 +
>  .../0001-uboot-add-genesys-zu.patch           |    10 +
>  board/digilent/genesys-zu/GenesysZU.dts       |  1655 +
>  board/digilent/genesys-zu/README.txt          |    92 +
>  board/digilent/genesys-zu/genimage.cfg        |    28 +
>  board/digilent/genesys-zu/image.its           |    59 +
>  board/digilent/genesys-zu/kernel_defconfig    |   414 +
>  board/digilent/genesys-zu/pm_cfg_obj.c        |   630 +
>  board/digilent/genesys-zu/post-image.sh       |    10 +
>  board/digilent/genesys-zu/psu_init_gpl.c      | 21818 +++++++++
>  board/digilent/genesys-zu/psu_init_gpl.h      | 37545 ++++++++++++++++
>  board/digilent/genesys-zu/uboot-env.txt       |    83 +
>  board/digilent/genesys-zu/uboot_defconfig     |   106 +
>  configs/digilent_genesys_zu_defconfig         |    49 +
>  14 files changed, 62551 insertions(+)
>  create mode 100644 board/digilent/genesys-zu/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>  create mode 100644 board/digilent/genesys-zu/0001-uboot-add-genesys-zu.patch
>  create mode 100644 board/digilent/genesys-zu/GenesysZU.dts
>  create mode 100644 board/digilent/genesys-zu/README.txt
>  create mode 100644 board/digilent/genesys-zu/genimage.cfg
>  create mode 100644 board/digilent/genesys-zu/image.its
>  create mode 100644 board/digilent/genesys-zu/kernel_defconfig
>  create mode 100644 board/digilent/genesys-zu/pm_cfg_obj.c
>  create mode 100755 board/digilent/genesys-zu/post-image.sh
>  create mode 100644 board/digilent/genesys-zu/psu_init_gpl.c
>  create mode 100644 board/digilent/genesys-zu/psu_init_gpl.h
>  create mode 100644 board/digilent/genesys-zu/uboot-env.txt
>  create mode 100644 board/digilent/genesys-zu/uboot_defconfig
>  create mode 100644 configs/digilent_genesys_zu_defconfig
> 

Hi

I sent this patch to the list, but it being too large got it stuck
somewhere and didn't reach the list. The cause are files
psu_init_gpl.{c,h} that are autogenerated by Xilinx utils, but that
are needed to run the system.

Can this message be moderated back into the list or shall I do
something different?

Thanks

-- 
Alvaro G. M.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
