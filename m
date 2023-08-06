Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61C1C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68559404F8;
	Sun,  6 Aug 2023 15:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68559404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utw-8QOugCvq; Sun,  6 Aug 2023 15:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AACE9403CA;
	Sun,  6 Aug 2023 15:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AACE9403CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4268A1BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2F280DA8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2F280DA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiToUy40Lf8s for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:39:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1426A80DAD
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1426A80DAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C18960005;
 Sun,  6 Aug 2023 15:39:31 +0000 (UTC)
Date: Sun, 6 Aug 2023 17:39:30 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230806173930.34edaf7e@windsurf>
In-Reply-To: <20230802055546.360651-1-neal.frager@amd.com>
References: <20230802055546.360651-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691336371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/xv1O7d6KcZkp1HbfB5Q7zXMh56HisqWaYKm9pKHFs=;
 b=kdJU5xvesRL6h21M3UtlQ2H0mBt775uTA0fusckiuruAHufne7zFWBj4iB69nJd60sJQAj
 r/JIyqPmT2z6TAo8kziaKTfAFJVXgTf3qD/8yJO71DqqR4hqSHhWKVxB2o6+y28yNX5NES
 g2qDCZDSgle3LBkavB0WdH33hodVfQbF7DUVKUkr4WtLIjA1+PyWwZ5sCvZydgy+3XmdFA
 33ImY+jsF1GPX4wML2mct6h209NGuPDT1h+ltyszFjwbikp5gnaxz7IkxhLPTFJasIYP6r
 deZZNXkEuho0PTCCqNhuaGv3H4vktJeBu9rfMCbGMN7Uty4VKHbW917to+SZkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kdJU5xve
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp: bump to
 xilinx-v2023.1
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2 Aug 2023 06:55:46 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch bumps the zynqmp defconfigs to xilinx-v2023.1 which includes
> the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - ATF v2.8 (including mainline buildroot patches)
> - PMUFW xilinx_v2023.1
> - Updated pm_cfg_obj.c from Vitis v2023.1
> - Removed kria u-boot patch which is included with xilinx-v2023.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>   - adds tf-a v2.8 patches
>   - squashes zynqmp bump together since all 3 boards share the tf-a patches
> ---
>  .checkpackageignore                           |  1 -
>  board/zynqmp/kria/kv260/pm_cfg_obj.c          | 69 ++-----------------
>  ...-0001-makefile-add-multi_dtb_fit-dep.patch | 32 ---------
>  ...dd-support-for-new-binutils-versions.patch |  2 +-
>  ...2-build-tools-avoid-unnecessary-link.patch |  1 +
>  board/zynqmp/zcu102/pm_cfg_obj.c              | 51 ++------------
>  board/zynqmp/zcu106/pm_cfg_obj.c              | 51 ++------------
>  configs/zynqmp_kria_kv260_defconfig           | 15 ++--
>  configs/zynqmp_zcu102_defconfig               | 13 ++--
>  configs/zynqmp_zcu106_defconfig               | 13 ++--
>  10 files changed, 39 insertions(+), 209 deletions(-)
>  delete mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
>  create mode 120000 board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
