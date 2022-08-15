Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B33C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA43D60DE5;
	Mon, 15 Aug 2022 09:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA43D60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9R7RGWIc7oH3; Mon, 15 Aug 2022 09:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F3660BC2;
	Mon, 15 Aug 2022 09:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F3660BC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3B81BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E6D40869
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E6D40869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_vyeEgnvEl2 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:33:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A6840863
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2A6840863
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:33:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77E3D1C0006;
 Mon, 15 Aug 2022 09:33:31 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:33:30 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220815113330.5383950c@windsurf>
In-Reply-To: <20220814233845.2247022-34-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-34-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660556011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xqlntJcCtS+5SdC4PEdhZolP02m+Z9xUxEB4yKDDN4=;
 b=MKLIGqIh41m4RDrPeM6XN+dXR7Zbev9NFbcpRNho0gJ2ojAEZDOgI3dqLTJPiuFnuqwcp+
 ER+e2AVtDoiCGm/Y9uUM5Usm2lrcev7phFSnMOVYMHD2Va9EInZZ0s31OUig5CAdGrNFih
 Zx07Ti6g5V1Cz4w25NY+wsW8Q3Echci/KdTl87GmVrx78k9qiThC+gRfDpGDzuLg0/kEJ1
 Lhgf6wpb9dtLv5bQwA4uob889KqSHCoeOeAJ7hKS9YnRPLUZTYwvcGl18+csAxsFFeh5T+
 TMEC3tt1zEGZ9g7a+3tHPJg8PKdOleoHjC+gqMkHwqq4VrpM9YKgMo74puTBkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MKLIGqIh
Subject: Re: [Buildroot] [PATCH 33/33] utils/check-symbols: new script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Sun, 14 Aug 2022 20:38:45 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> This is just a WIP!
> - it is ugly
> - it was not designed for performance (speed, RAM usage, ...)
> - it is poorly covered by unit tests
> - it has no help/usage
> - it has no debug options
> - it uses a hand-made database
> - it has a long list of false positives, ignored in the DB class
> - it does not support yet:
>   - rootfs
>   - virtual packages
>   - barebox
>   - linux extensions
> 
> ... but it gets some initial results
> 
> Someone willing to adopt this patch?

Does this imply that you are not interested/willing to push this
further up to a point where it can be merged?

> I don't know what to do with this symbol:
> package/fwts/Config.in:config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> package/fwts/fwts.mk:ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> maybe one of below?
> 1) make the script to accept 'ifdef' as a valid usage for a menuconfig symbol
> 2) rework the package to use 'ifeq' like the other ones.

I would say convert to ifeq. However, there is something a bit
"special" done here:

ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
FWTS_MODULE_SUBDIRS = efi_runtime
$(eval $(kernel-module))
endif

i.e the eval kernel-module is done within the condition. Is this the
reason for using ifdef instead of ifeq? I don't really see why, but
maybe I'm missing some aspect of GNU make sorcery. Which is why is in
Cc of this e-mail :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
