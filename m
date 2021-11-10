Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F42C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3114E610A2
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3114E610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BBA7608E2;
	Wed, 10 Nov 2021 09:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmdSaqKwirOA; Wed, 10 Nov 2021 09:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F38608E4;
	Wed, 10 Nov 2021 09:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11B91BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE42A80EF2
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Hddes4G8qxN for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:41:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA26080EDD
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:41:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 229DC5FF9A;
 Wed, 10 Nov 2021 10:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537287;
 bh=GwF0CkJj/oBvsirUP/fN77HneBl1fQwQfOKenrVGqCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kk5C/OdjqcYBmJeNng9NFO/RPsmSr2A6QnfSiTXBZsrHRkoeFUw52Whe/Zri1SlUM
 bzhC9dwCaFa8NBemn+J1aS/eZMzuzjPjSfzMpBytCVayeI8lAYgKffXstxwO0J2tUW
 mKoWm8MOEk6vuqJbSPcZ2aIbwCEaOc0DKhll8fZ8yXKDeu9V4UOxyYQIu/ypsGhlyB
 i2gDhig5/dYSkCiPjjZDHkge1YlHZ5mGAOVulJZn+LmRL7MNgdBcar8xep4t1EcexZ
 jUTANIw8LMMmVIhI8EZGNbL9AOcDPc0qEa6HgOJVGYAlRbHGAtNhtwG3fe4QnvVRHb
 mYr1+x2A7dBeQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:41:20 +0100
Date: Wed, 10 Nov 2021 10:41:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094120.GI2084998@scaer>
References: <20211109171940.457031-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109171940.457031-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/rcw-smarc-sal28: don't override
 dependencies
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:19 +0100, Fabrice Fontaine spake thusly:
> Don't override RCW_SMARC_SAL28_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rcw-smarc-sal28/rcw-smarc-sal28.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
> index 4928f1a7f8..2bc740027f 100644
> --- a/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
> +++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.mk
> @@ -14,7 +14,7 @@ RCW_SMARC_SAL28_INSTALL_IMAGES = YES
>  RCW_SMARC_SAL28_BOOT_VARIANT = $(call qstrip,$(BR2_PACKAGE_RCW_SMARC_SAL28_BOOT_VARIANT))
>  
>  ifeq ($(BR2_PACKAGE_RCW_SMARC_SAL28_BUILD_UPDATE_SCRIPT),y)
> -RCW_SMARC_SAL28_DEPENDENCIES = host-uboot-tools
> +RCW_SMARC_SAL28_DEPENDENCIES += host-uboot-tools
>  define RCW_SMARC_SAL28_UPDATE_SCRIPT_BUILD_CMDS
>  	MKIMAGE=$(HOST_DIR)/bin/mkimage $(MAKE) -C $(@D)/contrib all
>  endef
> -- 
> 2.33.0
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
