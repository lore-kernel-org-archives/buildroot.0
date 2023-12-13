Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E063C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E1AE4365A;
	Wed, 13 Dec 2023 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1AE4365A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldxQdQ7edl-g; Wed, 13 Dec 2023 22:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05FEA40488;
	Wed, 13 Dec 2023 22:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FEA40488
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBF11BF3FF
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 22:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8ECC6146B
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 22:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8ECC6146B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dQSluYAbQn1 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 22:28:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E1EC60F2C
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 22:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1EC60F2C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31C4760003;
 Wed, 13 Dec 2023 22:28:55 +0000 (UTC)
Date: Wed, 13 Dec 2023 23:28:54 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231213232854.5242117f@windsurf>
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702506535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TUUelHEqrH4UH/dRkI1gT75ZhAKsLjA1P8xClbsWCk=;
 b=dBKBW8RF6/I+4+fSrpoZ94i2+06ZKaFPs3A7IARnuNYs5R5foprqcb5apHmVcvI1gjJq7x
 JtYxB4qpHicStZ4oMy1NN3Pz1D0Wl9f7zGz30aXHkhSRSu0gD22J9bLHzW5q9QvKtkPMsK
 MDiiW+7ZkL/rDzSj2pux5IHyvNONnxJbU0PLYqkGnB2c1YA6m1SXFVgResLjvtGSY+MHpg
 fxWiIu3FZ0v0Xnm5ogbQBVuFScLHH3KXHq2aLictypoeQVAcvc76mDWk/nkU3ZSvgMiNNw
 qOE7nURvt10QP1e21N7bfWo2zTIghGLfz/mD99gX0U0rpcn5zsdm47p8uXKTIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dBKBW8RF
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
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
 luca.ceresoli@bootlin.com, Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 4 Dec 2023 07:34:33 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.

Thanks for sending this new iteration. I finally took some time to look
into it, as I wanted to merge patches 1 to 4 today. I did some good
progress in fixing a number of issues, and my current progress can be
seen at:

   https://github.com/tpetazzoni/buildroot/tree/bare-metal

Do you think you could rebase your changes on top of this, and see if
it all works fine? I of course encourage you to review the modified
commits, to spot what I fixed/changed. If you agree with my changes,
and they work for you, I think the changes in my branch are ready to be
merged, so I will be happy to apply them.

One thing that still bothers me is:

+define NEWLIB_BARE_METAL_FIXUP
+mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/include \
+	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/include
+mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/lib \
+	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/lib
+endef
+
+NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP

But I was able to find that it's due to:

tooldir='${exec_prefix}'/${target_noncanonical}

in newlib's configure.ac script.

And interestingly, this issue had already been spotted in an earlier
(2015) attempt at bringing newlib support in Buildroot:

https://lore.kernel.org/buildroot/1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com/#Z31newlib-0001-configure-tooldir-path.patch

I'm not yet decided on what is the most appropriate: your hook that
moves things around after installation, or patching the configure.ac
script to get things at the right place from the start.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
