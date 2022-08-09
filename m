Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A510C25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1441E410B8;
	Tue,  9 Aug 2022 11:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1441E410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDbxNn9rECeE; Tue,  9 Aug 2022 11:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB9A409F2;
	Tue,  9 Aug 2022 11:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB9A409F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D00341BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A791940278
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A791940278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvKsUhPfqNVO for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:49:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D08740151
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D08740151
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:49:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22E7760002;
 Tue,  9 Aug 2022 11:49:30 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:49:28 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220809134928.56a91c28@windsurf>
In-Reply-To: <20220809075704.86472-4-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220809075704.86472-4-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660045770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6JTBSAKMZaCMR0s8b2K6Y6JXk4lpp4FB8CL5MZySnw=;
 b=bkcvB6lhtFcPSLOzQgSYaropNf3MPpvl+/lVdepIMNA6pR0A4BTnyoqbK4zDEl2+TI6dct
 ybwcnfxRSPGjv8BpGpnvbWuPdGnnV9DqvOIdzQyDkMUbfH+fzg2WoviTDfiCbTalq6IZ0s
 JCfoeC+gyj5LspETthkspPR+S0t8WjRQGC6kVpb8NBQ4mKhRFiLDkPfNUo9nOvkkZqfWOM
 yens275mSV7r9xfhkrHg8nhFSenJNX1lGxxnM2O6MPOOUx8yVmBhDdJ79Nw8oVqJ0RUeJF
 VTYxl4h3i9wVzNQPd52XqYFE0k+rCD7EJbQziBkHPmQlimUAB3GAKMU2x5ENRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bkcvB6lh
Subject: Re: [Buildroot] [PATCH 03/13] nodejs: remove v8-qemu-wrapper stuff
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue,  9 Aug 2022 10:56:54 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> It's pretty broken, so we won't use it.
> 
> Even with this wrapper, I get:
> ```
> debug-wasm-objects.tq src/wasm/wasm-objects.tq
> /bin/sh: 1: ../../out/Release/torque: Exec format error
> [324/2786] CXX obj/src/libnode.node_wasi.o
> ninja: build stopped: subcommand failed.
> make[2]: *** [Makefile:127: node] Error 1

This is odd. Did you debug this a bit?

On my side, trying to build:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NODEJS=y
# BR2_TARGET_ROOTFS_TAR is not set

before applying your patch series, leads to a different error:

ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1271: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

The issue was reported at https://github.com/nodejs/node/issues/37441 a
while ago, it is not fixed apparently.

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
