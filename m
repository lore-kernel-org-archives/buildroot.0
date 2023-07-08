Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28027EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 22:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC8A60B0E;
	Sat,  8 Jul 2023 22:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC8A60B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBbN6mJxkc_e; Sat,  8 Jul 2023 22:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02279608A5;
	Sat,  8 Jul 2023 22:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02279608A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1A51BF3BE
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3FF040497
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FF040497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lfHudzm7FV5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 22:38:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3158B400CB
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3158B400CB
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 22:38:01 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 4B7C7A2CD3;
 Sun,  9 Jul 2023 00:37:59 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 2CEFFA00E2;
 Sun,  9 Jul 2023 00:37:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id BD0DEC00AB;
 Sun,  9 Jul 2023 00:37:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 09 Jul 2023 00:37:58 +0200
Message-ID: <5688922.DvuYhMxLoT@kilian-aisec>
In-Reply-To: <20230708222900.8599-2-kilian.zinnecker@mail.de>
References: <20230708222900.8599-1-kilian.zinnecker@mail.de>
 <20230708222900.8599-2-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1062
X-purgate-ID: 154282::1688855879-1CFFDC09-E296990C/2/53530208408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688855879;
 bh=euKrESGEgg7PIvqx8Vd3NiLShR8TIYqDmjQ0KEr6mHo=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=0PZj9XxxxYPUVWjOpl/8z3GxhDCji8qtGhI2exEiE3YI/sDLnTjgmHB8Z2bph3ouB
 /HRELLb4CBnfyI4kQz6o6y281DpiBHgkRr8enkE4Nrok57LKL+qFcwzIxK/38CEyTi
 T/NSmOobd933NcFBruxAZNMl+AK8ZXUs50nVz+UHgztQLQdsC1t27E83MHouCY98Yz
 0Dv5udoeDJiUgdEjVDys1avrf82E03RrlkC+6qHtIiQh3Z1uRbUwSmExkUAd98AI07
 GlN6bBlweRM19dddyT+cgOoL8hRu5fHgV+UCiRJaehkzMoqZ9meo7kUzOGw8cwMw5l
 MaD/IQUous18Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=0PZj9Xxx
Subject: Re: [Buildroot] [PATCH v4 1/3] package: add rockchip-rkbin package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Andreas Ziegler <br015@umbiko.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..f1cb304af4 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -207,6 +207,22 @@ endef
>  UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
>  endif
> 
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> +UBOOT_DEPENDENCIES += rockchip-rkbin
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> +define UBOOT_COPY_RKBIN_BL31_FW_FILE
> +	cp $(BINARIES_DIR)/bl31.elf $(@D)
> +endef
> +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> +endif
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> +define UBOOT_COPY_RKBIN_TPL_FW_FILE
> +	cp $(BINARIES_DIR)/ddr.bin $(@D)
> +endef
> +UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr.bin
> +endif
> +endif

I just see, I made a minor mistake here: UBOOT_COPY_RKBIN_BL31_FW_FILE and 
UBOOT_COPY_RKBIN_TPL_FW_FILE should not be needed anymore, as the 
UBOOT_MAKE_OPTS gets file paths to BINARIES_DIR. I will remove that in the next 
version of the patch.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
