Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E96C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 09:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50ABE405D7;
	Tue,  7 Feb 2023 09:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50ABE405D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Bm1hBNdRxN3; Tue,  7 Feb 2023 09:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87B01405DB;
	Tue,  7 Feb 2023 09:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B01405DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5E0B1BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A670F41721
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 09:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A670F41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZrY4TTaDf35 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 09:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6AF415A3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C6AF415A3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 09:04:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E685D24000F;
 Tue,  7 Feb 2023 09:03:57 +0000 (UTC)
Date: Tue, 7 Feb 2023 10:03:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230207100357.5503a9f5@windsurf>
In-Reply-To: <20230205214132.6941-2-dario.binacchi@amarulasolutions.com>
References: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
 <20230205214132.6941-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675760638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc8teTeVpyS877+X0OVyv2fCg8t2qHk/VkOmX89eXR8=;
 b=ENSxP0LXDlpaUMIvTjjs5J0jtuRZoE3Agh+GIcJ/BnDRioVyN4DdEQN3lRffs4vn1VRJei
 DPE/odRX/lU6hTX0eBjbwNqHGddK/ZnRk8lRS+rp/cYXN7QV+TLDwVhoUVsbGCOpOkz7E/
 t0w+TcZvidZE0HGHOk+UmlUuFqE9VzLjWNEiiVi9rrLu9QDSscTgyIajxn7mJ+zYDS7nlk
 zlIIuQkzpxhEBX+z6syDKVtueNI1jyLO9RmSKw3n2x7tqDV3ZHm/QLHz+PfhDcm71xxBuk
 DebfnvHuoYW9A9pTRgW4/Mfll6dTGFUv8kAQ9WyLt8vmPs9I93Wgf5e+MfS3cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ENSxP0LX
Subject: Re: [Buildroot] [PATCH 2/2] configs/beaglebone: bump U-Boot version
 to 2022.10
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Feb 2023 22:41:32 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Starting from version 2021.10 only distro booting is supported, as
> reported by commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only").
> The patch allows to update U-Boot to versions later than 2021.10.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/beaglebone/extlinux.conf | 4 ++++
>  board/beaglebone/genimage.cfg  | 1 +
>  board/beaglebone/post-build.sh | 2 ++
>  configs/beaglebone_defconfig   | 2 +-
>  4 files changed, 8 insertions(+), 1 deletion(-)
>  create mode 100644 board/beaglebone/extlinux.conf

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
