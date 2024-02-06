Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682B2C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3847B82A0B;
	Tue,  6 Feb 2024 17:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egjOnoNuKsb2; Tue,  6 Feb 2024 17:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F22F83180
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F22F83180;
	Tue,  6 Feb 2024 17:52:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 446731BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D88A41FC3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D88A41FC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4eLqBsjaD43 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:52:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D307D41F9F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D307D41F9F
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC575FF805;
 Tue,  6 Feb 2024 17:52:44 +0000 (UTC)
Date: Tue, 6 Feb 2024 18:52:44 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240206185244.2b75b044@windsurf>
In-Reply-To: <20240131112223.2175855-4-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707241965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXYa7UYsPaepRDyDiBh9wGgbTwqrh8/CfoBHr46j35I=;
 b=plQ5qgSzjv96mqZahPAbFssDIY5e5xlPFXWxFs5nj7JejgcINubXlfahyzyRIPWUzB8Rpe
 DhJnKCmVcllvbgRdkBgbfhV7kli6uyouJGJNBQEGqeJGAnSGBANfs7HO5Cn1+DhzJeVI1F
 ZiMnZrSRNLW267RBmy+7UlEYMU//1z1PB24eG3JaLWyb3NoUx4POPfNzNYgea3XvUM3UVj
 XRt891oDluNgwBs2QkxbTh8Eu1YwsbKTKJe6SjNE+Df0YFmTWpYfYZDs7QxOz+7chgBuDJ
 8BYujB9OULL8RmRDKvTl+f9xvCs6/ei0aTVkTeDvWaYHG0MRDSnClLTnMaD8ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plQ5qgSz
Subject: Re: [Buildroot] [PATCH v9 04/11] package/newlib-bare-metal: new
 package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jan 2024 11:22:16 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new package for building newlib for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> V1->V2:
>  - removed default enable to be replaced with toolchain select config
> V2->V3:
>  - no changes
> V3->V4:
>  - replaced unnecessary =? with = for assignments
>  - improved menuconfig help comment
> V4->V5:
>  - added license files
>  - reduced all lines to <80 chars
> V5->V6:
>  - migrated to toolchain-bare-metal-buildroot
> V6->V7:
>  - hard-coded version
>  - converted to target package with gcc-bare-metal sysroot install
> V7->V8:
>  - no changes
> V8->V9:
>  - bumped to version 4.4.0
> ---
>  DEVELOPERS                                    |  2 +
>  package/newlib-bare-metal/Config.in           |  2 +
>  .../newlib-bare-metal/newlib-bare-metal.hash  |  8 +++
>  .../newlib-bare-metal/newlib-bare-metal.mk    | 52 +++++++++++++++++++
>  4 files changed, 64 insertions(+)
>  create mode 100644 package/newlib-bare-metal/Config.in
>  create mode 100644 package/newlib-bare-metal/newlib-bare-metal.hash
>  create mode 100644 package/newlib-bare-metal/newlib-bare-metal.mk

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
