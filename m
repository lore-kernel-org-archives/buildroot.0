Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8882CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62B06415BF;
	Mon, 16 Oct 2023 10:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B06415BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1M77zyzO7x2h; Mon, 16 Oct 2023 10:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A8A4154D;
	Mon, 16 Oct 2023 10:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A8A4154D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A28251BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BD7B600CC
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD7B600CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TW4E2PboWN66 for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:11:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03A8F60DF9
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A8F60DF9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7858D1BF209;
 Mon, 16 Oct 2023 10:11:49 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:11:48 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121148.0eaec482@booty>
In-Reply-To: <20230924151205.2099293-4-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGi7FpIGswyBi+LuxQuQg9xKz3q9DYKVBr/vir+Y/t0=;
 b=lgQMY7sS6EDS+9znv+mBeyXcxvCFBj85j+1mljlQg+xxpLFXgscfO7tZODjYOWnvbMdKmt
 wMYZx8fjaCAUK4dErjDrCnnMX7XAVFr3aOLJhDK+qtNxYcBVr0PdesOXOx0a6YSNy//Dxf
 mwFUucWaSCS7lvWeg5ify1Zwk47p5iwOrXYBmRWYPKP8oq7jbPYyToBl3SeNJfwjTsN23Y
 JDDPqotYYAqNw8f9aLw2wDnrqVEg8g7+iU4HoyQlC9APxrudWkZcI1PgaUOBONG24LRS5C
 lpv9jBW1kkbZVXeJ+snKrY0KVxJ6FM9TpPVxrYbfR134zGVnEEzr/sDU+RebZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lgQMY7sS
Subject: Re: [Buildroot] [PATCH v4 04/10] toolchain/toolchain-bare-metal:
 new toolchain
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:11:59 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new virtual package for adding a bare-metal toolchain to
> buildroot.  By default, this package will configure a bare-metal toolchain
> for the Xilinx microblaze little endian architecture.  When configured for
> the Xilinx microblaze architecture, this toolchain can be used to build the
> microblaze firmware applications for zynqmp and versal.
> 
> Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - adds select option to bring in all packages needed for toolchain-bare-metal
> V2->V3:
>  - no changes
> V3->V4:
>  - moved from package to toolchain directory
>  - improved menuconfig help comment
> ---
>  DEVELOPERS                                    |  2 ++
>  toolchain/Config.in                           |  1 +
>  toolchain/toolchain-bare-metal/Config.in      | 21 +++++++++++++++++++
>  .../toolchain-bare-metal.mk                   |  7 +++++++

I wonder whether this should be in
toolchain/toolchain-bare-metal-toolchain to make room for a future
toolchain/toolchain-bare-metal-external.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
