Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3124C04FE0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51906410B1;
	Mon,  7 Aug 2023 22:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51906410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQG4FjMyHcFS; Mon,  7 Aug 2023 22:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D071540F4E;
	Mon,  7 Aug 2023 22:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D071540F4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5A01BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52FF14048E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FF14048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piRvlxS796kM for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:03:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 394D040363
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394D040363
Received: by mail.gandi.net (Postfix) with ESMTPSA id 214C7E0006;
 Mon,  7 Aug 2023 22:03:40 +0000 (UTC)
Date: Tue, 8 Aug 2023 00:03:39 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230808000339.5fd4fd70@windsurf>
In-Reply-To: <20230806102306.45138-1-thomas.petazzoni@bootlin.com>
References: <20230806102306.45138-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691445820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaVPIOdoRIfgLS8KnPI81/DF6Lkx/Ctn5dab7zo1+pE=;
 b=j0fgfuUpz+ml62eKKPesrDTIH/DF7WA+pLQsDlRCa86WLQYl3ZDpPxrteVD0LU6qllY6sv
 fqyF21jkYtr8/4arlyMz/kOs4He+BX5UACMEc3q6TFuY0axGz2KBS5UcR82ask33ywqEJt
 xEiA6sCMNIH4cvK/UO5lKDhiOhzxdu0ANCMWIuMWKYiaeCipRyJKsqQteDbuP+0iZ47CCd
 Qh95a2eqxGXnqgXC6tkE9hMZ1lqdPV8Sk+vqaJmETAiTWglNXpa++M6kygq/+tAV2rN8BZ
 PzTTJMjdKHfX4r57n7++MDP3ks8hNSdMB6QoKDK5cEOuu69qnd0P+iAzkhGZUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j0fgfuUp
Subject: Re: [Buildroot] [PATCH] configs/qemu_m68k: add Linux kernel patch
 to fix build with binutils >= 2.41
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 12:23:05 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> The m68k Linux kernel build is broken with binutils >= 2.41 with:
> 
> arch/m68k/fpsp040/skeleton.S: Assembler messages:
> arch/m68k/fpsp040/skeleton.S:502: Error: junk at end of line, first unrecognized character is `#'
> arch/m68k/fpsp040/skeleton.S:508: Error: junk at end of line, first unrecognized character is `#'
> 
> This commit adds a backport from the upstream Linux kernel which fixes
> this issue. Many thanks to Romain Naour for the issue investigation
> and the identification of the kernel commit fixing this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...001-m68k-Fix-invalid-.section-syntax.patch | 97 +++++++++++++++++++
>  ...001-m68k-Fix-invalid-.section-syntax.patch | 97 +++++++++++++++++++
>  configs/qemu_m68k_mcf5208_defconfig           |  1 +
>  configs/qemu_m68k_q800_defconfig              |  1 +
>  4 files changed, 196 insertions(+)
>  create mode 100644 board/qemu/m68k-mcf5208/0001-m68k-Fix-invalid-.section-syntax.patch
>  create mode 100644 board/qemu/m68k-q800/0001-m68k-Fix-invalid-.section-syntax.patch

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
