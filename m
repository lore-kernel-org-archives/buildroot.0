Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A66C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 00:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA7742413;
	Thu, 23 Jun 2022 00:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA7742413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbVNW1sDrG2S; Thu, 23 Jun 2022 00:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB384240F;
	Thu, 23 Jun 2022 00:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB384240F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDE461BF59D
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 00:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F548413A
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 00:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F548413A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_g_CXI-UKaJ for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 00:08:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9A584116
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9A584116
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 00:08:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D08560006;
 Thu, 23 Jun 2022 00:08:01 +0000 (UTC)
Date: Thu, 23 Jun 2022 02:07:57 +0200
To: kory.maincent@bootlin.com
Message-ID: <20220623020757.7852c97c@windsurf>
In-Reply-To: <20220622083433.1201789-1-kory.maincent@bootlin.com>
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655942882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NkFFrDZ/OexOdlq7LPs+LOm8ShL9lp0rg4oNQeR9X0c=;
 b=i2GMcRuLpD4PORX0wrBYEYdkv7p8ld/mtt2aP5BYX9mObnt/InhhFsu11kviNkQEy0rBHO
 sq7UacURhy7tcTw0lwuQMLk6a1LieKDDwFW5YLU6q1Y1wGiKVZAAbppmjc8hv5V9y1VU2z
 2pHOTdGK4vmL+decbd6/m39N5M9gFAGk0iWm/UZ6feyRENylx9XhG/1fM/0eyEblwBVO6c
 V8HiqLjZmBGfT2ZFiKlvJSswWOxzP02pb26UtvxEnP5LT9fCsDXsKoYfHJVNfcq9iRUixL
 hjwaP10VreaCMvS6wS8bqxKXm+cGxdGECZVnll6LJEB7jxHIf4CauJyFB93BQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i2GMcRuL
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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
Cc: etienne.carriere@linaro.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 22 Jun 2022 10:34:33 +0200
kory.maincent@bootlin.com wrote:

> -ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
> +ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
> +# Handle custom U-Boot tarballs as specified by the configuration

I followed the discussion on the v1 whether we should test the version
to be "custom" or whether we should test
BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL==y. I initially though there was a
reason for testing version==custom, but I was not able to find why, and
some packages (linux for example) do not test version==custom.

So I agree that testing BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL==y is a
better solution, which is what you have done here.

However, I would ideally like this to be consistent throughout the
tree, which means we should change the following ones:

boot/arm-trusted-firmware/arm-trusted-firmware.mk:ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
boot/arm-trusted-firmware/arm-trusted-firmware.mk:ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
boot/barebox/barebox.mk:ifeq ($$($(1)_VERSION),custom)
boot/opensbi/opensbi.mk:ifeq ($(OPENSBI_VERSION),custom)
boot/uboot/uboot.mk:ifeq ($(UBOOT_VERSION),custom)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
