Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F9C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4EA83376;
	Tue, 31 Oct 2023 11:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D4EA83376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hc0hSgEfX2_f; Tue, 31 Oct 2023 11:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F5782CF9;
	Tue, 31 Oct 2023 11:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F5782CF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 019491BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B65D642862
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B65D642862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bs-WO8xzJ7AL for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 11:12:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CD3F42860
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 11:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD3F42860
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FB1A20002;
 Tue, 31 Oct 2023 11:12:23 +0000 (UTC)
Date: Tue, 31 Oct 2023 12:12:22 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231031121222.1dfa4035@booty>
In-Reply-To: <20231018111357.2898095-1-neal.frager@amd.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698750744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shFGZLAbfOqDBloymAVx+QY7T79nNOi7s0dulPA2lMQ=;
 b=CHY1XJ9CyDFMaeBjy6ybkTXSUGVuavQqQaKamJo1jeKQEwrKKo5lqmX+q1Egh75OBz5Lki
 nn0SB9BMoq/OlnQHXpeiD+xt4wj3h7vT9Wzy+fgnx7OzSextuB7BiTJqMcky8Y/aac5vKJ
 ga50dtTAxVtrq08BVshmp9fyoP6OEvB/EPnW8o610L8TWjo9GK5ON6CQe2AECqSS+pyCXW
 o9GiPT7VegxgzQXko8nSl5XmMGtX0HW+PKboyxobjWXkNpsBX8TDOCOmFuIG0ZjiQ36HNE
 iKCJNi7pf4tCqbGeWNyP5LM7OIsm93QyIIz/eJjQnx8sFqxIsVWK0GiDpop++g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CHY1XJ9C
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, 18 Oct 2023 12:13:57 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Zynq ZC702 starter kit.
> 
> ZC702 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

This patch looks very clean, however I have a question. The zc702
config you are adding is identical to the existing one for the zc706
except for the device tree:

-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc702"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"

However, exactly because it is so similar, I am not sure about the
usefulness of having a large number of (from the build system
perspective) very similar configurations, where a user can simply 'sed
s/zc706/zc702/' to work on a different board.

I'm wondering whether we could have a unique defconfig that builds
artifacts able to boot on both boards. This probably build down to
whether the hardware components involved in the boot process are
similar enough to allow U-Boot to boot with the same embedded device
tree for both boards. At a quick glance the two dts files appear very
similar.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
