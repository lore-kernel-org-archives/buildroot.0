Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1EFEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8BFB81F9B;
	Tue, 22 Aug 2023 10:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BFB81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5GkIgv3OMP8; Tue, 22 Aug 2023 10:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 427BC817B0;
	Tue, 22 Aug 2023 10:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427BC817B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 722201BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C8560BC8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C8560BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJ_pRX_A4jTT for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:32:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D9B60BBB
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D9B60BBB
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB7FEE0006;
 Tue, 22 Aug 2023 10:32:34 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:32:33 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822123233.0c6e70aa@windsurf>
In-Reply-To: <20230616002359.4139814-6-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-6-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692700355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcNHRkPxLcYRDozytjMuJpyHCljXpxvPg3LuOG2brAA=;
 b=BcQPQgZI4ug3k77Qxtln8I+F74diViDSoImGyJU5GC3l39WnaST0fL7C/6HwYML7+TlIe3
 Fc/lukMvQB4AlpWZHASZG7GjQcaoi8MXWA8lzjYpybq8P91S5E3OX0AP+ZzOv7IqwRMEen
 oNiFRrvsBHtm/C/dish9qLS4PEOTIyM1sEyuXdZgZZdFikAgrpQhYZ2+qw1sRmxr1amsY5
 YokGcwL4rUq3ARR3QYNafheVVoJSgtPrOuFZlsYG3IRZtq+PBILh8FcIJMm4DbtxIRZbtf
 1sCFOBx+TCvir5481bFjkzLgKTZjHJRi9KPmHiQ2mENRLDEtZL7e+Vvz0n+lGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BcQPQgZI
Subject: Re: [Buildroot] [PATCH v8 05/10] board/ti/am62x_sk: add new board
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
Cc: Xuanhao Shi <x-shi@ti.com>, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Jun 2023 19:23:54 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> From: Xuanhao Shi <x-shi@ti.com>
> 
> Adds support for TI's SK-AM62 board by introducing the
> am62x_sk_defconfig file and related support files.
> 
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM62
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  DEVELOPERS                     |  4 +++
>  board/ti/am62x_sk/genimage.cfg | 27 ++++++++++++++++++++
>  board/ti/am62x_sk/readme.txt   | 26 ++++++++++++++++++++
>  configs/am62x_sk_defconfig     | 45 ++++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
>  create mode 100644 board/ti/am62x_sk/genimage.cfg
>  create mode 100644 board/ti/am62x_sk/readme.txt
>  create mode 100644 configs/am62x_sk_defconfig

Thanks, I've applied to our next branch, with some minor changes:

- Defconfig renamed to ti_am62k_sk_defconfig

- Directory board/ti/am62k_sk renamed to board/ti/am62k-sk

- Defconfig updated to take into account the changes made in the
  previous patches in terms of config options

- Minor formatting improvement in the readme.txt

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
