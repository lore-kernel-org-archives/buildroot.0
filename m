Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E80760F07;
	Thu,  2 Jun 2022 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQN6z45frwvI; Thu,  2 Jun 2022 17:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F1D260E33;
	Thu,  2 Jun 2022 17:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CEEC1BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 17:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35B1A60E18
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 17:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vRMNaOCx74D for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 17:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD0060E33
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 17:00:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD0EAE000D;
 Thu,  2 Jun 2022 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654189203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9kfvFpGYigFwRseGVOjSLzc+8mi2MzI0PXZwuZRPxA=;
 b=jetweL2HpuBppsrMbiA8WXor7VQObVzJMdEm6xYtjai2wzcbR6IhUj0ai3a9nFKefPaeTg
 P0B7TDDrio8F+HnRQOhhFLYIIAFlt/JRKJeAus71IC6kF8B4JfyBUaYK0f6sWGKa5TTcUh
 2KfdVuB4FSTC4TEnaed2BZhC+i4EH0Dixi7Tpg6v8dlfnsPOSH1DGXOLhhfwOL0u+vgpKs
 Af0wiBBlaW3RYomPrmYxQK0usW0RWrDjz5pyUeidbG1EQkvcCMZB2unXdFj8mtseANTIKw
 WTPaAATDpVchRAqnyjul3cCUeKtP1zoZezp2YdTJb+ciaKrZyX5xkivTJSss/A==
Date: Thu, 2 Jun 2022 19:00:01 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220602190001.0c4c9f35@windsurf>
In-Reply-To: <871qwiozwd.fsf@tarshish>
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
 <87a6b6pwqf.fsf@tarshish>
 <CALtfCQZPYEJBT=2hx6XJ1FH=ESHhw2N_LaqYbd+xdGkXxT503g@mail.gmail.com>
 <875ylup27u.fsf@tarshish>
 <CADvTj4r=46JdJUPSzOXgmXVDBWYDM3v5wsFjymbzGF1xoyzO4Q@mail.gmail.com>
 <871qwiozwd.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 25 May 2022 10:01:06 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> The '*' in the table indicates no_std, that is, bare metal. That's most
> likely not what we want for Buildroot. Can we map BR2_ARM_CPU_ARMV8A to
> armv7 line the following:
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index a86d95236d90..6aac703b2a4f 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -42,6 +42,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>  	default y if BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>  	# armv7-unknown-linux-gnueabihf
>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> +	# armv8-unknown-linux-gnueabihf

I think this comment would be misleading. Indeed, based on this
comment, you could think that for this configuration (BR2_arm &&
BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC) we
would use the armv8-unknown-linux-gnueabihf variant of rustc, but
that's not the one we would be using.

> +	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>  	# mips-unknown-linux-gnu
>  	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
>  	# mips64-unknown-linux-gnuabi64
> @@ -86,6 +88,8 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI && BR2_TOOLCHAIN_USES_MUSL
>  	# armv7-unknown-linux-musleabihf
>  	default y if BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
> +	# armv8-unknown-linux-musleabihf
> +	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL

Same comment of course here.

Other than that, it looks good to me.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
