Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F76FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073BD4047D;
	Sat, 22 Jan 2022 12:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Cjt_lRhXo26; Sat, 22 Jan 2022 12:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BB9B4017B;
	Sat, 22 Jan 2022 12:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9501BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DA1B8316F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIqUmEXAWba5 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:18:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225E883112
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:18:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4204E1BF204;
 Sat, 22 Jan 2022 12:18:04 +0000 (UTC)
Date: Sat, 22 Jan 2022 13:18:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20220122131803.7de0d872@windsurf>
In-Reply-To: <20220120000330.29552850@c3po>
References: <20220116211557.71866ff6@c3po>
 <44c15385-c790-6867-fc1f-b24c922b7e40@benettiengineering.com>
 <20220120000330.29552850@c3po>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/pcengines_apu2_defconfig:
 bump kernel to 5.16
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jan 2022 00:03:30 +0100
Danilo Bargen <mail@dbrgn.ch> wrote:

> This fixes the compile errors that were present with the previous
> kernel version (4.19):
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084022
> 
> Additionally, the defconfig file was refactored: Configuration
> values are now grouped logically, thus increasing readability and
> maintainability.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

Applied to master, with one change. See below.

> +# Rootfs
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_ISO9660=y
>  BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
>  BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> -# BR2_TARGET_ROOTFS_TAR is not set

Not clear why you dropped this line. So I re-added it.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
