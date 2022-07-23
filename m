Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A88C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0493641903;
	Sat, 23 Jul 2022 12:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0493641903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YH_FyHp2qbHE; Sat, 23 Jul 2022 12:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44A6419A3;
	Sat, 23 Jul 2022 12:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44A6419A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB0A1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 068B660FE0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068B660FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLCFFJ-M5Dl1 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E45760FDE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E45760FDE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:57:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF1E6240003;
 Sat, 23 Jul 2022 12:57:20 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:57:19 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723145719.56bd2b93@windsurf>
In-Reply-To: <20220529131811.481017-2-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658581041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy91N9Y4P7lS5p5JkVYoYBixJzrAHHrTFy3qNwYlT/Q=;
 b=NPMu/iC8g9bFOeP8nfuCVo7ZygZYZqMACidXsm7Lcxa4WJVUm0MwToBpw1TQKKCwVsrvpj
 ZXtqObKrXAA/Ekyjgq8GnOz+vsiwP0L8HHFyY8Y/KBCGdkIGdWDAnvAhj93cKMi+Vfm4A9
 khbqmXRidQt7F/DKCzII1LgrvckyF4h8OfMO9vfFpcQudDN3NINs20bVaE9g5GcxzDRHi+
 6Ju7bHu8s2juZ0TeOfOkb9+GTNxSw2Y1oz5ACsQGUHD42b9LCYxIBo/laTr6PXIT463xM4
 hdOiqwV+oXYOVC19ppV7ICcbRGTT1We7jbs+bsLihLMvcAjl68MRuU69axHH9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NPMu/iC8
Subject: Re: [Buildroot] [PATCH for-next  02/11] configs/qemu_riscv{32,
 64}_virt: kernel bump version to 5.15.43
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
Cc: Mark Corbin <mark@dibsco.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 May 2022 15:18:02 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> To build this defconfig with gcc 12, we need a patch from v5.15.24 [1]
> fixing the build with gcc 12.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7486227fa47aa84b102be18fd9985f6e8e11e756
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Mark Corbin <mark@dibsco.co.uk>
> ---
> The issue fixed by [1] can also be trigged with gcc 12 and binutils 2.37.
> ---
>  configs/qemu_riscv32_virt_defconfig | 2 +-
>  configs/qemu_riscv64_virt_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
