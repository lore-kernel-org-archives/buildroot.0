Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345A7C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 17:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E509414C6;
	Mon,  6 Mar 2023 17:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E509414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6FTqeuseBUh; Mon,  6 Mar 2023 17:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C40F414C9;
	Mon,  6 Mar 2023 17:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C40F414C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D82BF1BF37A
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 17:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B125760C16
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 17:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B125760C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtNC-lyODFTM for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 17:17:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D7F60C0A
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5D7F60C0A
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 17:17:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 701481063;
 Mon,  6 Mar 2023 09:17:57 -0800 (PST)
Received: from debian (unknown [10.50.67.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46CE73F67D;
 Mon,  6 Mar 2023 09:17:11 -0800 (PST)
Date: Mon, 6 Mar 2023 18:17:07 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <ZAYgE/KtpjD+PCby@debian>
Mail-Followup-To: Niklas Cassel <niklas.cassel@wdc.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Dick Olsson <hi@senzilla.io>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
References: <20230303122251.3392998-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303122251.3392998-1-niklas.cassel@wdc.com>
Subject: Re: [Buildroot] [PATCH v2 0/3] misc aarch64-sbsa cleanups
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Mar 03, 2023 at 01:22:48PM +0100, Niklas Cassel wrote:
> Hello,
> 
> Here come some small aarch64-sbsa cleanups.
> Please consider for inclusion.
> 
> Changes since v1:
> -Modified test_edk2.py to use the same kernel config as
>  qemu_aarch64_sbsa_defconfig. (Thanks Vincent.)

Hi Niklas,

Thanks for fixing that.

I tested this v2 patch series on master and next: the
qemu_aarch64_sbsa_defconfig and the edk2 unit test work for me.

The edk2 unit test is slower due to the more complete kernel config and this
breaks the CI on gitlab. Maybe we should leave the reduced kernel config for the
unit test as it is after all? An alternative would be to extend the timeout,
somehow, but I don't know if unit tests longer than an hour are desirable.

Best regards,
Vincent.

> 
> 
> Kind regards,
> Niklas
> 
> 
> Niklas Cassel (3):
>   board/qemu/aarch64-sbsa: use PARTLABEL to specify root
>   board/qemu/aarch64-sbsa: use the default console specified by ACPI
>   support/testing: use the arch default kernel config in test_edk2.py
> 
>  board/qemu/aarch64-sbsa/grub.cfg        |  2 +-
>  board/qemu/aarch64-sbsa/linux.config    | 68 -------------------------
>  support/testing/tests/boot/test_edk2.py |  7 +--
>  3 files changed, 5 insertions(+), 72 deletions(-)
>  delete mode 100644 board/qemu/aarch64-sbsa/linux.config
> 
> -- 
> 2.39.2
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
