Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF3AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 06:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B6641B99;
	Wed, 25 May 2022 06:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 326dJLc4850D; Wed, 25 May 2022 06:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459FC41B95;
	Wed, 25 May 2022 06:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B505E1BF319
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B231261269
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 06:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGs6nIKn7Lvf for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 06:15:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D983760E82
 for <buildroot@buildroot.org>; Wed, 25 May 2022 06:15:37 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id ADE0A440478;
 Wed, 25 May 2022 09:14:20 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653459261;
 bh=DtvrAYqCgjpJ2ekgvAtmCJM8KmGd8hG44Pxex/4HzgU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=UIVmqzbl0AZ7K1NQFmOY4ZfHLfhnqIqyUvw04sIbM2grXQXyxCj1FRD+6VGO+NmIH
 S7HsBuHgWl+JjgPL1N+65k7yAaooBFm/eLaGTs93ZMtXANZeR7CItxBEn543XUsaCB
 WMj8m61i1x7rksvKQU61L/fFMEgVS4uGl/XgLf68XhupFbFUmCvQODqNbLeKcQOTMg
 jloEgwynHhh8OYodeumhjAYELj+MhcRmoWe8WYMumuFEfHLghHvi2DB6XAwdL3vk6+
 SXxPQmkZmB9MwB3LMeGIbcytVy5TGS8Dd4TvrNo4DxJh98u8ebY/GlE/vqeKyMncBz
 UX0+G3UYMxSiA==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
 <87a6b6pwqf.fsf@tarshish>
 <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 25 May 2022 09:05:22 +0300
In-reply-to: <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
Message-ID: <875ylup27u.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oscar,

On Wed, May 25 2022, Oscar Gomez Fuente wrote:
>> So now when you lookup BR2_PACKAGE_PYTHON_CRYPTOGRAPHY in menuconfig
>> search do you still see 'BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]'?
>
> YES
>
>> Please send your .config file.
>
> OK

I see the problem now. Your target platform is BR2_arm (32 bit), but
your CPU selection is BR2_ARM_CPU_ARMV8A (64 bit capable). This
combination is not supported in current
BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS or
BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS. This patch should make
BR2_PACKAGE_PYTHON_CRYPTOGRAPHY selectable, but I'm not sure it's
correct:

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index a86d95236d90..64b135f86f27 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -42,6 +42,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# armv7-unknown-linux-gnueabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
+	# armv8-unknown-linux-gnueabihf
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
 	# mips-unknown-linux-gnu
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-gnuabi64
@@ -86,6 +88,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
 	# armv7-unknown-linux-musleabihf
 	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
+	# armv8-unknown-linux-musleabihf
+	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
 	# i586-unknown-linux-gnu
 	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
 	# i586-unknown-linux-musl

Adding James and Thomas to Cc since they showed interest in rustc over
the last year.

Is that the right solution?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
