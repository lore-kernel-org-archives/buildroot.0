Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2FDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3951B60BFE;
	Thu, 30 Dec 2021 14:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8kYQMMjXzVk; Thu, 30 Dec 2021 14:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C00760C01;
	Thu, 30 Dec 2021 14:27:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4876F1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375EE80BDC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpnSHOZRs_e3 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A60280BC5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:27:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 155DD2001A;
 Thu, 30 Dec 2021 14:27:02 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:27:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Message-ID: <20211230152702.1e1ed7cf@windsurf>
In-Reply-To: <20200119002805.2103-1-christoph.muellner@theobroma-systems.com>
References: <20200119002805.2103-1-christoph.muellner@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: add support for bundling
 TEE in ELF format into U-Boot
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

On Sun, 19 Jan 2020 01:28:05 +0100
Christoph Muellner <christoph.muellner@theobroma-systems.com> wrote:

> Some U-Boot platforms (e.g. rockchip) can bundle OPTEE's tee.elf
> into the U-Boot image. This patch brings the necessary changes to
> enable this feature.
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> ---
>  boot/uboot/Config.in | 10 ++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 15 insertions(+)

Sorry for the veeeeeeeeeeeery long delay, but I finally applied your
patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
