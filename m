Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A24EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:25:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD4160F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBD4160F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F5B405C6;
	Sat, 13 Nov 2021 14:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRBeGYncPhu0; Sat, 13 Nov 2021 14:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FF440449;
	Sat, 13 Nov 2021 14:25:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 030FF1BF349
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B8E4027A
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2SuEi2Tc5RZ for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:25:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3D0740277
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:24:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E099E20002;
 Sat, 13 Nov 2021 14:24:57 +0000 (UTC)
Date: Sat, 13 Nov 2021 15:24:57 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211113152457.129243a9@windsurf>
In-Reply-To: <20211111230455.11470-1-peter@korsgaard.com>
References: <20211111230455.11470-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/sheevaplug_defconfig: backport
 gcc >= 10 u-boot patch
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

On Fri, 12 Nov 2021 00:04:52 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966307
> 
> The old U-Boot version used does not build with hostcc >= 10.  Backport a
> patch fixing that issue.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...e-redundant-YYLOC-global-declaration.patch | 28 +++++++++++++++++++
>  configs/sheevaplug_defconfig                  |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 board/sheevaplug/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch

I've applied both to master. It would however be nicer to update to a
newer U-Boot release if possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
