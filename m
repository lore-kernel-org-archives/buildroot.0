Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21159C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 17:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B22543664;
	Wed,  6 Dec 2023 17:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B22543664
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaghTESWDig2; Wed,  6 Dec 2023 17:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 656D9436B3;
	Wed,  6 Dec 2023 17:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 656D9436B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E4A1BF5DB
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CCA8138B
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 17:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CCA8138B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoGLDGdhFGd2 for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 17:15:36 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1316781375
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 17:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1316781375
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 9EFBC4403F6;
 Wed,  6 Dec 2023 19:14:02 +0200 (IST)
References: <20231206164437.22191-1-louis.chauvet@bootlin.com>
User-agent: mu4e 1.10.8; emacs 29.1
To: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Dec 2023 19:05:06 +0200
In-reply-to: <20231206164437.22191-1-louis.chauvet@bootlin.com>
Message-ID: <87h6kvckwc.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1701882842;
 bh=eWJYqniq+Y94yDP+xTzVgJIuf+8znesodEpjLJuxsA0=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=bY48UIFB+senMc7LVl8B8TXZLOJBURRaXD7IJcp/DN2GhBpEFKh2CZXbIfmy/4OHN
 5cESneR7NWy0DGRXcNAM7Y8MosLfje9gTSHTkAoimrS3G2tcH0S4xtQnqDwc2YWrA/
 Q4ZnrjNvMQmHr6wKfPuPtzsvYkOp3RQsJP6K+IX5oKsHPX68LSx/JZE0BJqF6jObVd
 83RSwNx0gja5GfAaFEeu8pDCy3NLJ5Tzz6dCMI1wQk0n7Dke5JegrJO9zACBV1sMsP
 3Ntjj9mLb9Uro/vGYVcCA9+ji63xWReR0zcNQoe5uFu1ptuNrIn3sGFhV/82YaQmXy
 CqF5z5/zZgiSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=bY48UIFB
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the RPATH of
 fiptool
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: kory.maincent@bootlin.com, geomatsi@gmail.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Louis,

On Wed, Dec 06 2023, Louis Chauvet via buildroot wrote:
> The arm-trusted-firmware package builds a host tool called "fiptool",
> which is used during the build process of arm-trusted-firmware
> itself. This tool links against the OpenSSL host library, and
> therefore needs to be built with the correct RPATH pointing to
> $HOST_DIR/lib.
>
> This is why commit a957d9a90ade4194dffe3eb2fc0136bc5d077c28
> ("boot/arm-trusted-firmware: build fiptool separately with dependency
> o n host-openssl") added the ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
> variable, which builds the fiptool tool first, with the right
> variables set, before invoking the full build of TF-A. This ensured
> that fiptool was built with the correct RPATH.
>
> However, more recent versions of TF-A have modified their Makefile
> machinery, and fiptool is being rebuilt even if it was built
> before. Unfortunately, this rebuild is no longer done with the right
> flags, so we end up with a fiptool binary that no longer has the right
> RPATH, and fiptool fails to find the OpenSSL libraries from
> $HOST_DIR/lib.
>
> In order to fix this, we take a different approach: we do not build
> fiptool separately first, but we inject the necessary flags through
> the HOSTCC variable. Indeed, there's no HOST_LDFLAGS or HOST_LDLIBS
> variable or similar that would allow us to pass the -Wl,-rpath flag
> that is needed. Shoe-horning this flag into HOSTCC gets the job done,
> and actually simplifies our arm-trusted-firmware.mk.

The code this patch removes tries to keep compatibility with TF-A
versions earlier than 1.3. This patch relies on HOSTCC that was only
introduced in TF-A version 1.4 with upstream commit 72610c4102990
("build: Introduce HOSTCC flag"). I guess losing compatibility with
older TF-A is fine, since all Buildroot in-tree configs appear to use
newer versions. But I think this should at least be mentioned in the
commit log.

baruch

>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../arm-trusted-firmware/arm-trusted-firmware.mk | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 049beed36a91..bed873a1821c 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -63,7 +63,8 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>  	BUILD_STRING=$(ARM_TRUSTED_FIRMWARE_VERSION) \
>  	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
>  	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
> -	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
> +	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
> +	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> @@ -147,18 +148,6 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
> -# fiptool only exists in newer (>= 1.3) versions of ATF, so we build
> -# it conditionally. We need to explicitly build it as it requires
> -# OpenSSL, and therefore needs to be passed proper variables to find
> -# the host OpenSSL.
> -define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
> -	if test -d $(@D)/tools/fiptool; then \
> -		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/fiptool \
> -			$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
> -			CPPFLAGS="$(HOST_CPPFLAGS)" \
> -			LDLIBS="$(HOST_LDFLAGS) -lcrypto" ; \
> -	fi
> -endef
>  endif
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
> @@ -206,7 +195,6 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>  	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
>  		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
>  	)
> -	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
>  	$(ARM_TRUSTED_FIRMWARE_MAKE_ENV) $(MAKE) -C $(@D) \
>  		$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
>  		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
