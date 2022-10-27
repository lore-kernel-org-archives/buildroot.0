Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BF5ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 15:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4C781426;
	Thu, 27 Oct 2022 15:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A4C781426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yj2P49F6o3h0; Thu, 27 Oct 2022 15:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59AC3813E8;
	Thu, 27 Oct 2022 15:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59AC3813E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A801BF318
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 15:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E34E24017C
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 15:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E34E24017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXTBTk4O73tL for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 15:24:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCFB7400EA
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCFB7400EA
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 15:24:32 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id B7C5C440E97;
 Thu, 27 Oct 2022 18:22:15 +0300 (IDT)
References: <20221022142040.625468-1-ju.o@free.fr>
 <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
User-agent: mu4e 1.8.10; emacs 27.1
To: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Oct 2022 18:21:03 +0300
In-reply-to: <CAOMZO5CxFizBnnyTf-bW=mJ=kO-cdrchN8xDgm6HaGr3+sKPMA@mail.gmail.com>
Message-ID: <877d0ls30z.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1666884136;
 bh=eu8qiq9q1vKAAuomR3gUrnRnTymPHe+oRS058uIUMXM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=H1qmYob1LbfBWp9zB4L2KokoicArGVUdVaUOsu/gPb6BansuPvfHnr22Y8RYIAA09
 7Wo38z/g2ZmXdLgclsgsZQu6YveFYc46zm7rMtg2NwYKePk3XLTZHAoxSJpuap/W5O
 7mTUQKvjT5U8sfzRjkoNu6/ESKoC8FMrlmJSN2+zhAxyp0IplETZ0vc0yKQfdNWIlT
 tOD+1laB0/wn5XeKnaMHzv4zMdhQlnobaj4nECVRAQ/CujmyxhX57zOcjRg7MuJBIu
 fJemlDi9LTRfr6L15eQV7T5O0d2Tj7h8GuYnN/h9CThHtdwhU8MDR8R2+H51tWw36C
 6LuEGVQAaKnuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=H1qmYob1
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8{m, mm}pico: disable ATF SSP
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
Cc: Julien Olivain <ju.o@free.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabio,

On Thu, Oct 27 2022, Fabio Estevam wrote:
> On Sat, Oct 22, 2022 at 11:21 AM Julien Olivain <ju.o@free.fr> wrote:
>>
>> imx8{m,mm}pico configs are currently failing at ATF link with output:
>>
>>     aarch64-buildroot-linux-gnu-ld: asm_stack_protector.o: in function `update_stack_protector_canary':
>>     (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'
>>
>> The ATF version in those configs does not provide platform level
>> support for SSP.
>>
>> This build failure was introduced by commit
>> 09acc7cbc91f50305730ca0690a58fb93529034b
>> "boot/arm-trusted-firmware: fix SSP support". Before this commit,
>> ATF SSP was globally disabled, by default.
>>
>> This commit fixes those build issues by disabling the ATF SSP in the
>> defconfigs.
>>
>> Fixes:
>>   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498119
>>   - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498120
>>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>
> I met the same build error when trying to build kontron_bl_imx8mm_defconfig.
>
> Tried your suggestion and it fixes the build error:
>
> diff --git a/configs/kontron_bl_imx8mm_defconfig
> b/configs/kontron_bl_imx8mm_defconfig
> index ff376662e9e5..b05828981081 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -34,6 +34,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>
> Does this need to be fixed globally? I suspect other defconfigs face
> the same error.

The global fix might be this:

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5070849d9b43..a9b9bbcc5a1f 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -212,7 +212,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	bool "Build with SSP"
-	default y
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on !BR2_SSP_NONE
 	help

Commit cf176128ec4 ("boot/arm-trusted-firmware: add SSP option")
mentions that not all platform implement the require hook for SSP. So I
think that enabling SSP by default is not the right choice.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
