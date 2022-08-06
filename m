Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25ECC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8165E60F84;
	Sat,  6 Aug 2022 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8165E60F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSNYdgxKiti3; Sat,  6 Aug 2022 21:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 908EC60F6E;
	Sat,  6 Aug 2022 21:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908EC60F6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0457F1BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D198C4162C
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D198C4162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nrqes79AGHcO for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:24:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E811A41626
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E811A41626
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:24:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0EA6200003;
 Sat,  6 Aug 2022 21:24:44 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:24:43 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806232443.1a74cb77@windsurf>
In-Reply-To: <20220806210800.176207-1-yann.morin.1998@free.fr>
References: <20220806210800.176207-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659821084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/hWs6cGG/7OXFNSTFeaFsBP1j1lHtMep6dPE3/+L3E=;
 b=c6t6hWQGyk6INisqReoz1h5Z/YbsUA289dq2p7C1NAiUtsU2O8GO6CM8oTJeYqjrA3Nqtp
 12wH94EZLJIqQZC+gsxDrCQict0gHIj7IwB6G1ZXvicX0f/3JFsxrfWRjgmniRgpcO1GC9
 Wuvx4yYtxnDiyFWQRqZmWgau6FVHLxwyukzMZsPLnFlJHDMThxDlDbwMUv1595wvz+7DnD
 +IfkPJ3rcoSj2d3TZRJImmM3C3ojQ+igG7xICB4t705IoGHmcuumpfgRVguJ5o1foEboav
 m/e8osS6+Cc/g+9EuDNn8L+LS8DZ//XDWcT9QU8oKtluFfmptAa0SOI4OLIR+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c6t6hWQG
Subject: Re: [Buildroot] [PATCH] board/friendlyarm: drop nanopi-neo
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

On Sat,  6 Aug 2022 23:08:00 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> nanopi-neo no longer builds, as uboot needs python2 on the host:
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053540
> 
> I no longer have access to that board, so I can't test an update to
> either uboot or the kernel anymore.
> 
> Drop the board.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  board/friendlyarm/nanopi-neo/boot.cmd     |  8 -----
>  board/friendlyarm/nanopi-neo/genimage.cfg | 34 ------------------
>  board/friendlyarm/nanopi-neo/readme.txt   | 42 ----------------------
>  configs/friendlyarm_nanopi_neo_defconfig  | 43 -----------------------
>  4 files changed, 127 deletions(-)
>  delete mode 100644 board/friendlyarm/nanopi-neo/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-neo/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-neo/readme.txt
>  delete mode 100644 configs/friendlyarm_nanopi_neo_defconfig

Applied to master after changing the commit title to use
"configs/friendlyarm_nanopi_neo: remove defconfig", and removing
entries in the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
