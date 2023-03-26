Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97303C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E58E409C3;
	Sun, 26 Mar 2023 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E58E409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqdOgDF3TUm5; Sun, 26 Mar 2023 20:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E0C409DD;
	Sun, 26 Mar 2023 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E0C409DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 078761BF3DF
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4730405F5
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4730405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyTsb3-WSN-F for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:09:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8EE400E2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB8EE400E2
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:09:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C6EB60002;
 Sun, 26 Mar 2023 20:09:09 +0000 (UTC)
Date: Sun, 26 Mar 2023 22:09:08 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230326220908.623ba0b5@windsurf>
In-Reply-To: <20230326140949.11262-2-neal.frager@amd.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326140949.11262-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679861350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iWNXzk7mC4YjdBjd0ff5g4xLlG6C4dIV4ChVHeGx3o=;
 b=Gl0L8UjziGiF7168qTI9LbxD8JP8Ctakn2VznEJb2oa1RP/+zaPeOaXSzgWQnk5ild4G9n
 d/tiXZgPDE3jRA6W2dDghxUobLzqwGdGHm6iogG9WaqgBZDhOODD5hLfxENmXa/6HpBVD8
 ckNRUQ0Hh/oAf4gcpNrijVRJ5QTrpsS7FODJHunRNtgyO6nY9yrcToqwDDOdsSUbf0DA92
 kje8JNIG56nRd39W42Y1hhSZXqf9x/SZuf0ebWlg0Q7MIRrobeksYjzXt19vX9eRuaNp2U
 vM0sYNO9hr7WAAojRLrQiHlDDnn74rHE+T79UwaLeSFsVLaaFzC+VHtkS5HwQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gl0L8Ujz
Subject: Re: [Buildroot] [PATCH v1 2/2] boot/uboot.mk: new
 BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
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

On Sun, 26 Mar 2023 15:09:49 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> The new BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE option will enable u-boot to
> use the zynqmp-firmware package for building a pmufw.elf that gets included in
> the generated boot.bin.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/uboot/Config.in | 11 +++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f5c20f5168..116df71ea3 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -476,6 +476,17 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +config BR2_TARGET_UBOOT_NEEDS_ZYNQMP_FIRMWARE
> +	bool "U-Boot needs zynqmp-firmware"

I think this naming is confusing. If I understand correctly, U-Boot now
offers two possibilities:

(1) Using a prebuild PMU firmware (this is what is currently possible
    in Buildroot)

(2) Building the PMU firmware from source (which is what your patch is
    adding)

I believe the proposed option naming/organization doesn't make this
very clear. I don't have a super clear idea of what it should look
like. Perhaps we should have a choice...endchoice that makes it 100%
clear that the user can chose between using a pre-built vs. building
one from source?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
