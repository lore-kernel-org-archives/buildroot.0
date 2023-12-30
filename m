Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18791C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C6260F01;
	Sat, 30 Dec 2023 18:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C6260F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBO2S4s1rt7b; Sat, 30 Dec 2023 18:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1499660FD0;
	Sat, 30 Dec 2023 18:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1499660FD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594211BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 320E081E8E
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320E081E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rM8cI3bP5hir for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 263BB81E8C
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263BB81E8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39A1A1BF205;
 Sat, 30 Dec 2023 18:01:56 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:55 +0100
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <20231230190155.28192ce2@windsurf>
In-Reply-To: <20231228152657.488457-1-antoine.coutant@smile.fr>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yfTLehYiOLr4tYqQwqo6lfJ4Z+3HI+/wX30N3x7tTg=;
 b=XL6GtWfHfcQ6fHoEkAL/EMNia8wZqcsa8Sao+xrfph++DE5LkF8x8uVvIJzT/HIOXo2BTA
 1qW8IMIcScdvZXT15/P2QPiHHxf5P2JEbgl2xdqOj9lNvMNf2ZsnV1CZLaymf5nSFugJrN
 +YNAGbKDrwB3JPeHUNZPdys6yF5Z9F3CYOp5d1lS90U4t1Fs+Ub+3yRI99+X3OoQ+JRHI2
 FmOpQx9JRjlfbP4qpofby/btTBnz1Y2uwYc5fHkN82R5A5LvwNJJ1A8s8ez/SEKoDF1+7F
 oC2tYhtXFkm+elNqxp6r48iU9R7ehhx5KK/jjMQaHcOKUJhrhJegM4Pb4mRC/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XL6GtWfH
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{rust,
 rust-bin}: bump to version 1.74.1
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
Cc: romain.naour@smile.fr, sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Dec 2023 16:26:55 +0100
Antoine Coutant <antoine.coutant@smile.fr> wrote:

> Link to Rust 1.74.1 announcement:
> https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html
> 
> The mips*-unknown-linux-gnu* targets were removed from
> stage 2 with host tools in version 1.72.0.
> Release note:
> https://github.com/rust-lang/rust/releases/tag/1.72.0
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
> Tested with ripgrep using qemu_aarch64_virt_defconfig.
> ---
>  package/rust-bin/rust-bin.hash | 236 +++++++++++++++------------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   6 +-
>  package/rust/rust.mk           |   2 +-
>  package/rustc/Config.in.host   |  10 --
>  5 files changed, 114 insertions(+), 142 deletions(-)

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
