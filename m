Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAF5C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7342060BE6;
	Sat, 12 Aug 2023 12:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7342060BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37MFfxKkaq4Z; Sat, 12 Aug 2023 12:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05EA60B3F;
	Sat, 12 Aug 2023 12:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05EA60B3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4EA81BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE8C4012F
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 12:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE8C4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OuOGB1uZ535 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 12:28:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DED8B40018
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 12:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED8B40018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9756340008;
 Sat, 12 Aug 2023 12:28:00 +0000 (UTC)
Date: Sat, 12 Aug 2023 14:27:59 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230812142759.2bc8cee3@windsurf>
In-Reply-To: <2300152.ElGaqSPkdT@kilian-aisec>
References: <20230812110359.27170-1-peterlin@andestech.com>
 <2300152.ElGaqSPkdT@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691843281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwqIrG0Q6paO5ljd1mQ46Epqy5fFTCWyoTlTV8fQw6g=;
 b=mNhtrTBcwUc+qb7ZnIEvjxUYHPX8enrudcyiA93sgptcDt+tA0gfmbiABQwcQHvV32TcC4
 AIm1vie5MT0BYa1ELOsQhehUkOWbLZJPF/PclVsJ/tksQOTQxBUe02tLejM2v4gw/Q2vAA
 2HWwnMTKz7RRVSk+cAaiORbCMYv0im81Ckwubj9ScRWBAgIFyrjyLEJPAXcNW9U1xL4gqH
 Jjhbfiyq5D6hlS2AssU7tWNSSU0lbwF+OWHQMF1IqwCrOA6B77ID/kqtTDMLPI5HQcC0Aq
 8ZOGqW0xBfv4aYqZMOxj7GjwHXX/3F/2noHHF+1AGcEyPOeg0Xyf1fXvSoNdAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mNhtrTBc
Subject: Re: [Buildroot] [PATCH] andes_ae350_45: Fix build issues of AE350
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, ycliang@andestech.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 14:00:00 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> So I think setting BR2_RISCV_ISA_CUSTOM_RVA=y is correct. However, you could 
> try whether it works, if you then completely remove the 
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS?

The U-Boot version used by the andes_ae350_45 defconfig indeed includes:

# Newer binutils versions default to ISA spec version 20191213 which moves some
# instructions from the I extension to the Zicsr and Zifencei extensions.
toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
ifeq ($(toolchain-need-zicsr-zifencei),y)
        RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
endif

So it should already be doing the right thing automatically. However,
the fact that the defconfig forces its own ARCH_FLAGS=-march=rv64imafdc
is probably what breaks the build.

So I agree with Kilian here: please try without any:

BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"

and see if that helps. However in that case, you might need indeed to
keep the addition of BR2_RISCV_ISA_CUSTOM_RVA=y as part of the fix:
please double check that.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
