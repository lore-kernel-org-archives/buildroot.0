Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D2CD129A
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04886410AE;
	Thu, 11 Apr 2024 04:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gyTxKhzeJ2M; Thu, 11 Apr 2024 04:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67E141506
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67E141506;
	Thu, 11 Apr 2024 04:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B83991BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A507140278
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfCfyBPfF4uo for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 901C340253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901C340253
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 901C340253
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:36:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A46FA13F846;
 Thu, 11 Apr 2024 06:36:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 06:36:17 +0200
Date: Thu, 11 Apr 2024 06:36:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZhdowWRrDCKWDguF@landeda>
References: <20240410221806.89203-1-romain.naour@smile.fr>
 <20240410221806.89203-3-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410221806.89203-3-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712810179;
 bh=xvMSffg9jtn+gPb0Oz4nZvZKMKAqD8UWWwvO3xWSvrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fETBl8pl/sLOeAJFWIXdBmkDt21Kwte3dw7dGxDQ3OPjmXWiyQvpLBnCwfSm4qEEK
 rM+6btTzpvWWjAzWTRyp++0QDBisQ1nexyDNIZqOXKlV2WwwhIE8mIGJdRRh21JT7v
 fETaVVVdWLuuBkZ7bRKvMp6VFm/P9JGM9eeC9/M0n+h1+up5XYtP9WSa8FZC3HycA6
 3Yms3URQDH2+JMQTBIpZjhe9y2Cf2kpSbRVtnX/xalmVsOmJkU8jJfo5nnQVQzPhyH
 hgfDElLDYzHE6DUlDjXvrzjn8HMLcRza0mwqY8ViehZDXmxT6G6zS+BxS0HVIhDe5I
 NmD25sws+DJCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fETBl8pl
Subject: Re: [Buildroot] [PATCH] support/testing: remove TestATFVexpress
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

Romain, All,

On 2024-04-11 00:18 +0200, Romain Naour spake thusly:
> TestATFVexpress is using vexpress_aemv8a_juno as as u-boot defconfig
> but the Buildroot defconfig of this board was removed in 2022.11 [1]
> 
> Since both TestATFVexpress and TestATFAllwinner are now using mainline
> ATF, we don't really need several ATF test anymore. Initially [2],
> several runtime test were added to test ATF/U-Boot combinations when
> ATF was provided by a vendor: vexpress (mainline), Allwinner and
> Marvell.
> 
> Keep TestATFAllwinner as ATF mainline test.
> 
> [1] 347c1087388d7782e6865f112f195e6780d473a7
> [2] 8cf3ce04e9c4a4c4685b80edd9e8e873fe44d8e8
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_atf.py | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index 1995f83a54..352725e721 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -1,31 +1,6 @@
>  import infra.basetest
>  
>  
> -class TestATFVexpress(infra.basetest.BRTest):
> -    config = \
> -        """
> -        BR2_aarch64=y
> -        BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
> -        BR2_TARGET_UBOOT=y
> -        BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
> -        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
> -        BR2_TARGET_VEXPRESS_FIRMWARE=y
> -        """
> -
> -    def test_run(self):
> -        pass
> -
> -
>  class TestATFAllwinner(infra.basetest.BRTest):
>      config = \
>          """
> -- 
> 2.44.0
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
