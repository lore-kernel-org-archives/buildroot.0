Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1980CC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 17:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B669060B38;
	Sun, 12 Mar 2023 17:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B669060B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFV3BHTqZhiP; Sun, 12 Mar 2023 17:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0694060B3F;
	Sun, 12 Mar 2023 17:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0694060B3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB491BF574
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5F440102
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5F440102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYc52Xo71mpB for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 17:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97A91400A4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97A91400A4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 17:45:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA268FF802;
 Sun, 12 Mar 2023 17:45:22 +0000 (UTC)
Date: Sun, 12 Mar 2023 18:45:22 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312184522.3c07813f@windsurf>
In-Reply-To: <20230226131838.509224-1-ju.o@free.fr>
References: <20230226131838.509224-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678643123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ylvbrd2KG96NE4eNxTP7fgoibYvGOZoTYyDCms0nFs=;
 b=gNukYkfUjGn5E3Dovkxl97iECz0WJtoaMUGBSFd8kuCGm1sr6sAbs+J821RGGiHZzmmIIi
 HLDOb1AhHXrumzflhH4X1PqIWcGm4FlgxHTJQO73jycBzdNS+p68nRW5cNjxvXtOIKvYnM
 A608sis/8TxMNZkGQPHZNsCZDz6yyR0qBRwC1dfaRYl91g/Ikb/3n8VknE42Yo3q537VVW
 fSUmuaSJGm6iW/igMSZUtDp+yoXf4keY6GTCACT35o550MhbU/33p79Tf81uGUH93MHyY+
 KEVhTi2A4qQavKUqkL7YDl5N39WSZYYrRvaP5w14RtVy+SXM1AY8381mR7m1pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gNukYkfU
Subject: Re: [Buildroot] [PATCH next 1/1] configs/spike_riscv64: bump kernel
 to 6.1.14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 26 Feb 2023 14:18:38 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Linux Kernel 6.1 now being officially promoted to be a LTS, this
> commit bump the kernel version of this defconfig to 6.1.14.
> 
> A Kernel config fragment "linux.fragment" is now needed as the kernel
> no longer enable SBI v0.1 support and the earlycon RISC-V SBI in its
> riscv arch defconfig. See [1] [2].
> 
> The Spike riscv-isa-sim was updated upstream accordingly [3].
> 
> In order to keep a smooth transition, this kernel config fragment
> re-enable those options to make sure this kernel will work with
> both old Spike versions (not including commit [3] like the v1.1.0
> currently included in Buildroot), and newer versions. This commit
> was also successfully tested with riscv-isa-sim at commit
> 0d1a48c0c0.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6f562570b9c5d6a3e30d87aec60a9d8f22a3203c
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3938d5a2f9369d1ebd56320629fed395ce327e9c
> [3] https://github.com/riscv-software-src/riscv-isa-sim/commit/191634d2854dfed448fc323195f9b65c305e2d77
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on top of branch next at commit b793f3a with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
