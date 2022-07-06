Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730F3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 06:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D8E4028D;
	Wed,  6 Jul 2022 06:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D8E4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1mzmgg5KJoU; Wed,  6 Jul 2022 06:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEB734018D;
	Wed,  6 Jul 2022 06:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB734018D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 451EA1BF271
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 06:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBE8408EF
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 06:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EBE8408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XisoDMNBQbe7 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 06:59:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 507F4408DD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 507F4408DD
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 06:59:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D719420008;
 Wed,  6 Jul 2022 06:59:08 +0000 (UTC)
Date: Wed, 6 Jul 2022 08:59:07 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220706085907.10eff0d1@windsurf>
In-Reply-To: <20220705061627.146616-1-dario.binacchi@amarulasolutions.com>
References: <20220705061627.146616-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657090749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2fdDFE65uvDxPMZnGS4Ds3AcZWLcgtJrldqjJjA15VI=;
 b=X06tDdh6sFz5Vksm2g3WpFyglD7jWZ59FLhUscejIbVPZ5ox/v7i9tnN13Pq77TlULJ1Hp
 Me7xDRS1qte3NKONOSoAk4dWKogIrm/PPSOMnz/UqNciT0yW8E6dAzZc16J03qzoG2qO6f
 osl6lu+ohI/KLGmUS7GRK+/031ne2VgG1lX7aSMulxE/nEteQ4cN1yJnduR3cNmxCtY+PL
 i0zup/P+9JqWpF6NdUWHLage9TvIx2RWxtq/5p/77MPvTcy+bKSFO1jZ4HS6eJ42HYmmyD
 V/Kauog2etzbAs0YVK9UGOob20W1/VHWgVFDijpRQ8M5sZ9tgkEY0DujSSpTsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X06tDdh6
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.224
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Jul 2022 08:16:27 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> It requires the host-zstd package.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for the patch. You had just forgotten to test "make legal-info",
and the hash of the README.md file had changed. I fixed that up when
applying to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
