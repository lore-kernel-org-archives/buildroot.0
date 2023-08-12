Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B840C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EDB4093D;
	Sat, 12 Aug 2023 21:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EDB4093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_nYBeFpTEf5; Sat, 12 Aug 2023 21:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39188414D6;
	Sat, 12 Aug 2023 21:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39188414D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 661641BF5DC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BDA3414D6
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BDA3414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kyd_mrarooHq for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 21:14:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA8AE4093D
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA8AE4093D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15D4D60002;
 Sat, 12 Aug 2023 21:14:28 +0000 (UTC)
Date: Sat, 12 Aug 2023 23:14:27 +0200
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230812231427.7dee9cbb@windsurf>
In-Reply-To: <20230626160030.93063-11-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-11-bmeng.cn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691874870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yu0m6FnuSwNgs2zzYu8XjHL8xwPM//GS7INHiXwJs6w=;
 b=cCWWccUK2e6KFC3XNDUKUxK5ZKLdKDZ44pOuKTWIn63ZDHwTBnrAE3Qpjs+jLDvfrO9Tg0
 Ilf7WYOSHEgP1n83EFJfiLW5oExt+5h0ITpaQ7zA6idLfVLHeoymssYcrI1FvvLHUaEikO
 igYn/fz/A3+xJWjTWm+ZtBVVpEFDFJBhcPZXi5mw0WuIKBiH29Ofkcnt3pbqqVa7tsD3dD
 aF1UVT07eltVu0LVqGyF23TaRED9psZHy8Hh+1qeSZ4YhUFU3opdTF/wA0ZuKhBD5BZiis
 qcSEsyduWHiBQqK2CtxKUH87DcRNmtP5K7h0V19yGdwYO6BQZnSD27xTkV7WnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cCWWccUK
Subject: Re: [Buildroot] [PATCH 10/10] board/sifive: hifive-unleashed:
 Include QEMU instructions in readme.txt
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
Cc: Romain Naour <romain.naour@smile.fr>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Romain Naour in Cc.

On Tue, 27 Jun 2023 00:00:30 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bmeng@tinylab.org>
> 
> The upstream QEMU 'sifive_u' machine supports running upstream U-Boot
> for the SiFive HiFive Unleashed board out of the box.
> 
> Add the QEMU instructions for testing in readme.txt.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Applied to next, thanks.

Now that this defconfig can be booted under Qemu, maybe it makes sense
to ensure that our Gitlab CI does some actual testing of the
"bootability" of this image under Qemu? Could you have a look at how
our qemu_* defconfigs do this, and try to adapt the HiFive Unleashed
defconfig to do the same? Romain Naour in Cc is the author/maintainer
of this logic that all the testing of Qemu defconfigs in our CI, so I'm
sure he can provide guidance if needed.

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
