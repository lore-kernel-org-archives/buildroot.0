Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEA4CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 15:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C1B606F0;
	Sun, 22 Sep 2024 15:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8UMtzfKSMon; Sun, 22 Sep 2024 15:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5609F605CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5609F605CA;
	Sun, 22 Sep 2024 15:36:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 993E31BF3E8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95253605C1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 15:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdCCJYtOJZgQ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 15:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59C5B605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C5B605B7
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59C5B605B7
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 15:36:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0636A35282AA; Sun, 22 Sep 2024 17:36:13 +0200 (CEST)
Date: Sun, 22 Sep 2024 17:36:13 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZvA5bfdDEB3WVBOF@waldemar-brodkorb.de>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
 <20240922121431.3fa71502@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922121431.3fa71502@windsurf>
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1727019374; bh=cHtV1ijsV54ZJEekJfmUc1b8ftnv2PkYjOmGRj6bLng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxLSLXF0JEaFbtpCDT/cqrhIiHuvjgjHrV+WmRdZoWM/2xgV+tD4IfKyP5wQcIrri
 La4AsS00KmJUfe1qaft4xispWJ0fhtKRX10Om3gBTaovVo+065sHOGxkv/ZAKv4G2Y
 QD4LWuG6VVAAJss4bTCVBLDnfYnDg9tfG5mNYTBvXWaO9LceZkYRcr5YXDnHUNmNkn
 7yeozB/G7466ZhXIeT8L1LzExR4LbJ2iOOWGaIUyAZfLI2LyaU3qEl7FfdkyyBtSA/
 zMZm5boVGpbF5ORJpqDfACH2oAARnipt1IIjYBcwolj5V7t5/IKFqb57589Y7FnfZw
 YxT18G2c0XHbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=XxLSLXF0
Subject: Re: [Buildroot] [PATCH v2 0/9] add ARM FDPIC support
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Dario,
> 
> On Sun, 22 Sep 2024 11:23:03 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> 
> > Dario Binacchi (1):
> >   configs/stm32f746_disco_sd: new defconfig
> 
> Aside from this defconfig, it would be really nice to have a defconfig
> that allows to test ARM noMMU (both FLAT and FDPIC) with Qemu. Could
> you, and perhaps Waldemar, check what the options are? I had a quick
> look, and it doesn't seem obvious which ARM noMMU platform supported by
> Qemu is also supported by Linux. I vaguely remember at some point that
> the versatile (or vexpress?) platforms allowed to boot a noMMU system,
> but I'm not 100% sure.

There is versatile which can boot ARM noMMU FLAT, which was removed
by Buildroot in 9c5c3fbb2295f3f2b0bb27ac235d5f59afcfd55e, because it
requires Kernel patches. This defconfig is not capable of running
FDPIC Binaries because of some missing features regarding NPTL.

There is still no Cortex-M system emulation we could use for testing
both.

So a no go.

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
