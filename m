Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0CACA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BADC416E7;
	Sat,  2 Sep 2023 07:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BADC416E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7b4CEWtJ-I-N; Sat,  2 Sep 2023 07:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8A814057F;
	Sat,  2 Sep 2023 07:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A814057F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8C11BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 144EE81EAE
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 144EE81EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3PumPhPDSaQV for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:41:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ADE881E83
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ADE881E83
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4C271BF206;
 Sat,  2 Sep 2023 07:41:39 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:41:39 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230902094139.116f5fe9@windsurf>
In-Reply-To: <20230831201737.509574-1-romain.naour@gmail.com>
References: <20230831201737.509574-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaxE9buhNCJw2xLOOfnMO1n/TP069t/+kDnhlPDn4q4=;
 b=eknAnx5t57SksdwStn7nEL6BNqito2POydK10TT1CzFlWWZOoBFWdA4CgPC2k5NUfEPbDk
 OkTXChgC7RQ3XBdgfYOYOyntXnfNrXYfWU0m+tBdoApWvUsIWxqIDioDMHT7tO6vMw3Fww
 PEOeULzCG/GNUSa4z4vSiTqjqV3ULlrmcUK8r986YGn0KxCZM9IzovT2NSZlgFgwVPRExl
 QtFPDj3SJtj/0JGY8gHibhjr1V3knKd0FmkxCSCrERKu3bwMlGyW8u5wtiyQ4W1NAoTDl7
 aA6knj1TM5tHehFxFc2GfZTBW+pcEL/Q1lbukxhnpcjUguWH7My8nmWIJLuLxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eknAnx5t
Subject: Re: [Buildroot] [PATCH] configs/beaglev_defconfig: fix build with
 binutils >= 2.38
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

On Thu, 31 Aug 2023 22:17:37 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Backport an upstream patch fixing the build with binutils >= 2.38
> for riscv's for Zicsr and Zifencei.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4987456149
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...iscv-Fix-build-against-binutils-2.38.patch | 58 +++++++++++++++++++
>  configs/beaglev_defconfig                     |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch

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
