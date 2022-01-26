Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2802DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D396561008;
	Wed, 26 Jan 2022 22:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ER0TkxuwwzBN; Wed, 26 Jan 2022 22:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2028461002;
	Wed, 26 Jan 2022 22:32:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66EE51BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5576861002
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlaN4lQK4qey for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:32:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0142160B1B
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:32:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2BA01BF203;
 Wed, 26 Jan 2022 22:32:04 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:32:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220126233204.36d9c37c@windsurf>
In-Reply-To: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
References: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/xvisor: drop arm support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jan 2022 20:06:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Support for old 32-bit ARM boards (i.e. ARMv5, ARMv6, ARMv7a) without
> virtualization has been dropped since
> https://github.com/xvisor/xvisor/commit/9fcd69692484e0f6aa5036c27196f55c797582c5
> resulting in the following build failure since bump to version 0.3.1 in
> commit c4f8b8968770ecbf6444a5921c6472f126717626:
> 
> *** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v6-defconfig"!
> 
> *** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-0/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v7-defconfig"!
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b
>  - http://autobuild.buildroot.org/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xvisor/Config.in | 6 +-----
>  package/xvisor/xvisor.mk | 2 +-
>  2 files changed, 2 insertions(+), 6 deletions(-)

I think this is based on a misunderstanding of the
https://github.com/xvisor/xvisor/commit/9fcd69692484e0f6aa5036c27196f55c797582c5
commit. This commit says that they remove support for "ARM32 without
virtualization support", but there are ARM32 cores with virtualization
support! As explained in the commit log, the ARM32 cores that support
the ARMv7ve instruction set are still supported by Xvisor.

This means that Cortex-A7, Cortex-A12, Cortex-A15 and Cortex-A17, which
are all ARM32 cores, are still supported by Xvisor. So this patch
entirely dropping ARM32 from Xvisor isn't entirely correct.

So, the change should be more like this:

config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
	bool
	depends on BR2_USE_MMU
	default y if BR2_aarch64
	default y if BR2_x86_64
	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17

 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	default "generic-v5" if BR2_ARM_CPU_ARMV5
-	default "generic-v6" if BR2_ARM_CPU_ARMV6
-	default "generic-v7" if BR2_ARM_CPU_ARMV7A
+	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
 	default "x86_64_generic" if BR2_x86_64

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
