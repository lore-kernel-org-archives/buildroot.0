Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666CC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0AD81DB2;
	Sat,  5 Nov 2022 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0AD81DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxN0pAKAtorx; Sat,  5 Nov 2022 21:19:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D53381DAB;
	Sat,  5 Nov 2022 21:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D53381DAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC081BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55266408CB
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55266408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgK8VmA8Ub6O for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:19:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 006C1405A6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 006C1405A6
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:19:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D98AFF803;
 Sat,  5 Nov 2022 21:18:59 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:18:57 +0100
To: Carlos Santos <unixmania@gmail.com>
Message-ID: <20221105221857.5567e63f@windsurf>
In-Reply-To: <CAJ4jsacyrm_vy13vFbX0sR9K991LeVa=iJsQeevo_V9+OkSA_g@mail.gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
 <20221104235727.587650-3-unixmania@gmail.com>
 <20221105114433.2a5e6b09@tuxfamily.org>
 <CAJ4jsacyrm_vy13vFbX0sR9K991LeVa=iJsQeevo_V9+OkSA_g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667683140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wg5rTeaFn180e1WZKNXBw1ULwKdaiGSfqa+VayH0kTc=;
 b=c1lL7zM/eZgL+GuZ61XAWJE2B8eXkdVa2ZD6qlWBNrQtlwEV8n8M0cuji+ji4YzzGt+J/Z
 kMfn3XMWekNa+/YF7ddUfTqQ95VkHlsKWRmByKYG21sVHFWW6sRtO9AaWMhb9a4HGnPiSY
 HAMS4wNnDJ4rfnN2eM8klpWwKB9O9jcaC3AAFN+iONkkX7H1Rfd/zDVlo+9GQFimzPTBWv
 0354Sb/SnHLl4/ET5VUx3ivCxy+goo9gVxfz9S7y8YOA7s13HOD8i1AH5kneTblX8K1S48
 yPLEqHhh4cGVeWzCAFFF8gAYRxIUJs/KjeVmGjRLHBP1np2ovvUt7xASCr5Uiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c1lL7zM/
Subject: Re: [Buildroot] [PATCH 2/3] package/qemu: select FDT for custom
 targets too
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 5 Nov 2022 17:23:53 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> BR2_PACKAGE_QEMU_CUSTOM_TARGETS is a string, so adding a "select
> BR2_PACKAGE_QEMU_FDT" does not have any effect.
> 
> A better solution for the case in which only linux-user targets are
> selected requires a more complex approach. I will submit a separate
> patch for this purpose. Meanwhile, let's put this series on hold.

Hm, I think I start to understand the issue, and with the current
organization of the Config.in options in package/qemu/Config.in, it's
going to be difficult to fix in a correct way.

For example, it looks like the linux-user mode emulation doesn't work
with the musl C library:

config BR2_PACKAGE_QEMU_LINUX_USER
        bool "Enable all Linux user-land emulation"
        # Incompatible "struct sigevent" definition on musl
        depends on !BR2_TOOLCHAIN_USES_MUSL

So, it means that BR2_PACKAGE_QEMU_CUSTOM_TARGETS="i386-linux-user"
will in fact fail to build with a musl toolchain...

I only sane way to address this I believe would be to remove
BR2_PACKAGE_QEMU_CUSTOM_TARGETS entirely, and instead have
BR2_PACKAGE_QEMU_SYSTEM_TARGETS and
BR2_PACKAGE_QEMU_LINUX_USER_TARGETS, which would only be accessible
when BR2_PACKAGE_QEMU_SYSTEM or BR2_PACKAGE_QEMU_LINUX_USER
respectively are enabled. When BR2_PACKAGE_QEMU_SYSTEM_TARGETS is
empty, all system emulation targets are built, otherwise only the
specified ones are built. Ditto for the user emulation targets.

Obviously as usual, the main drawback is that is breaks backward
compatibility with existing configurations...

The other approach, which you took, is to assume for the "worst", and
assume that when BR2_PACKAGE_QEMU_CUSTOM_TARGETS != "", we might build
system or user emulation targets, and therefore this option needs to
have the combination of the dependencies of the system and user
emulation options.... which would mean disabling this option with musl
toolchains, for example.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
