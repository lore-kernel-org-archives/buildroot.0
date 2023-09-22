Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19178E6FE22
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 12:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E13F83EB4;
	Fri, 22 Sep 2023 12:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E13F83EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQ3kkz23Krmm; Fri, 22 Sep 2023 12:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A5E83C5A;
	Fri, 22 Sep 2023 12:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A5E83C5A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7C11BF2FC
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 12:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2CB83C5A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 12:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2CB83C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPbGkq0OKTpS for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 12:58:55 +0000 (UTC)
X-Greylist: delayed 327 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Sep 2023 12:58:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEFC283C58
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEFC283C58
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:58:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5465C2000C;
 Fri, 22 Sep 2023 12:58:10 +0000 (UTC)
Date: Fri, 22 Sep 2023 14:58:09 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922145809.1b1f0e71@booty>
In-Reply-To: <20230904100443.1613306-6-neal.frager@amd.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230904100443.1613306-6-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695387533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vIsgxjVUDQGI86YCodYZ0efvn2/MsAcAXSjkw1Av7k=;
 b=dNBri+cRaGgHTDFUiiXnRiAE6yq0buBeZKayXy6T/oEq/ByWHymy7SHYAJ+XL6P/IRkcCz
 RZ0ZNT8rwdPQpd4l13FhC3km6QxuintnYWZ+m8eqauXCgsefD4Ovh4pbnO+PrS2qBkqgsk
 6gArtFZQa09rlKrqWLQK1bycrsmQ//gODTjX4YtA/1qmT1Jfs75aNoBpyZEqLO9+B+vskW
 khFuI/BEiji1YCMnY5Y+rpWwKGjCLv69mUwVBRU9TY7h/aeJFqNYOocTFO1yIQTIBf+X/i
 LnZf2zebdemRYi/APcN9JxcuR6DoQnSUq3PFrdtROgk4SROq/OPhYw8Zcw1LVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dNBri+cR
Subject: Re: [Buildroot] [PATCH v3 6/6] boot/uboot.mk: new zynqmp pmufw
 build option
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

On Mon, 4 Sep 2023 11:04:43 +0100
Neal Frager <neal.frager@amd.com> wrote:

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
> use the zynqmp-firmware package for building a pmufw.elf that gets included in
> the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - patch is now backwards compatible for users already using the
>    BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw
> V2->V3:
>  - no changes
> ---
>  boot/uboot/Config.in | 18 ++++++++++++++++--
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8b726eaa57..6d830e81c6 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -495,11 +495,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
> +	bool "Build zynqmp PMU firmware from source"
> +	select BR2_TARGET_ZYNQMP_FIRMWARE
> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	help
> +	  This option instructs u-boot to build the zynqmp pmufw using
> +	  the zynqmp-firmware package.  u-boot will then include this
> +	  pmufw.elf in the generated boot.bin.
> +	  
> +	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> +	  prebuilt option will be ignored.
> +
> +	  This feature requires U-Boot >= 2018.07.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
> -	string "PMU firmware location"
> +	string "Pre-built zynqmp PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG

Maybe here we should add

  depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE

to hide the prebuilt option when building from source has been chosen.
It would be confusing otherwise.

Looks good otherwise.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
