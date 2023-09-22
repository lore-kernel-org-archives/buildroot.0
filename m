Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D35E6FE27
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 13:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B8883C80;
	Fri, 22 Sep 2023 13:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B8883C80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3QyZzHCSEOs; Fri, 22 Sep 2023 13:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7407782F4A;
	Fri, 22 Sep 2023 13:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7407782F4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E45E81BF301
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFB740A56
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 13:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAFB740A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRoZVouORqGR for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 13:15:18 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB42D41973
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 13:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB42D41973
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 35B3CD1AE5
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:58:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66B9DE0014;
 Fri, 22 Sep 2023 12:57:22 +0000 (UTC)
Date: Fri, 22 Sep 2023 14:57:21 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922145648.56d4320a@booty>
In-Reply-To: <20230904100443.1613306-5-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230904100443.1613306-5-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695387485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmlrreNJkxh3DHkcFx2cCuW+mCziZepoAlv5pnRRYCM=;
 b=YekaJ81SGbpEQB6BjnWJ/SOb+uE8rvktS3o7Y2/92ChEEjd0Mn2OF47Z9CJgtwElA2XYvF
 qWsVI4ZNdL5wQ3K3bfRewvTm0L+A3fz56YDRsbPBXHBW3zSC9sZZjs1P1fIdDaLtcb/GHf
 RGZtpu5AaPGiF3iYvmpLF7JLXcuART7RM7D9L8QnoE5av0/UjeFT0KR2JPbMz4QraQJWmc
 W3CUu25dQ0tpnLmxRdjfuXseqZeKisW9ponpTY5LdGvk0WHMX/T1OxdCTxPzNgsZdR5iEL
 iRybmKQIP4qeucHMQlZZDdVREHc/MbLg7dManploqb9b60d6o9eOcJlPc+JEmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YekaJ81S
Subject: Re: [Buildroot] [PATCH v3 5/6] boot/zynqmp-firmware: new boot
 firmware
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Mon, 4 Sep 2023 11:04:42 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> A patch is required to enable parallel building of the pmufw.  This patch has
> been submitted upstream internally at AMD / Xilinx and will be included with
> the 2023.2 release of the embeddedsw repository.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[On Kria KV260]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

In order to test I did, after applying the whole series:
- make zynqmp_kria_kv260_defconfig
- set BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
- set (for Kria):
  BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 \
    -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP \
    -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"

And flashed the resulting boot.bin and u-boot.itb. The board boots
normally. Thanks to Neal for providing me these details.

I suggest adding a new patch in the v4 patchset to update the KV260
defconfig, so the entire patch set can be tested.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
