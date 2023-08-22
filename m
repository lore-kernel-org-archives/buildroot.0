Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DB5EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4647E4167B;
	Tue, 22 Aug 2023 20:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4647E4167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJLgJWdOFwzu; Tue, 22 Aug 2023 20:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494F741622;
	Tue, 22 Aug 2023 20:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494F741622
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C455D1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABAC9401D8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABAC9401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SE5WV3QSphaT for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:20:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 842A7400D2
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 842A7400D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D9F72000D;
 Tue, 22 Aug 2023 20:20:34 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:20:33 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230822222033.3ef8fd5d@windsurf>
In-Reply-To: <20230809210338.1330998-1-giulio.benetti@benettiengineering.com>
References: <20230809210338.1330998-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692735634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBxUZ7WomfsGq+SXOIj7BybCVMO8UKCr1Ca/mVZRamI=;
 b=gxsi+8w2W3ZYPqdLA79hlKhzAjvukLoQacG0gcxaPmYeXs9ScqYwauMMVrASlY5KUGpiWW
 /gZG00zA06CeCUbNoHfbdyDFXDbOBq9xWWkGp2TDwCCZoVpY+S7CVRiN/mx6yuXBgWFZJM
 flhHVcKOOCA7xHR2rHt1C9pYK2aDNZfckv3D4F9TFyOI4sV6daCgln1yYoC0iSoVmIhdrc
 x4SJ8Xvsve4VILkAJFIcR1kgYGaZKAStVqvvnLNN2k7u6lLkMNV/qY5KnTaurIleGIs68p
 9raeG8d9/ZXROQoX5y7NO8Hn6bZqI1o7w2hNGTP3HVsa3YbXn1DqTXz1NBxe+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gxsi+8w2
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: fix build failure with
 _FORTIFY_SOURCE=3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Aug 2023 23:03:38 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +# disable _FORTIFY_SOURCE=3 and set it to 2
> +ifeq ($(BR2_FORTIFY_SOURCE_3),y)
> +MMC_UTILS_CFLAGS += -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
> +endif

This is a work-around, not a proper fix, and actually the following
defconfig builds just fine today:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_FORTIFY_SOURCE_3=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MMC_UTILS=y
# BR2_TARGET_ROOTFS_TAR is not set

So there is really no reason to globally override _FORTIFY_SOURCE=3 for
mmc-utils, it builds fine at least in some situations. So it needs to
be narrowed down a little bit further, up to the point where we can see
if it's a glibc bug, or a gcc bug, possibly architecture specific.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
