Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0CD960F81;
	Sat,  4 Nov 2023 18:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0CD960F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoMLvaWibcSb; Sat,  4 Nov 2023 18:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D958960F75;
	Sat,  4 Nov 2023 18:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D958960F75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C09B1BF285
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26EE482239
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26EE482239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvF5AoBn2s4V for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:46:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 150AC8221A
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 150AC8221A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F2DF240004;
 Sat,  4 Nov 2023 18:46:14 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:46:13 +0100
To: Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <20231104194613.56af9a7a@windsurf>
In-Reply-To: <20231104193818.519472c7@windsurf>
References: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
 <20231104193818.519472c7@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699123574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiXs3C5mHFVcC5B/OB4wXRBqmHdc5NnOH/fF72MKmHE=;
 b=ZlWm3cNFufunk8do2ls5f12r58DWtt2sk+G4O7QQ/Z66PeRKq0nd0yxGTXHu0+SbsNWIye
 E7e9BvPX+bnIFosYdQfk2pmuP2ESt4Ss3mQlaV+GskksRHYbken38B2CPh+4y0mkgQzJXO
 XgRswI3/sWKbgCpipN7h7T9dXA+tiymiD7npUVfVXoLRF/x1fNiqO9fsc3DvtvqZSsfT0n
 3xlu788z2clLVRpu/fiyDmnoIPAqclA5MhDh8sUplTdF3bIITB1X9QZSNHnewRXTAwET/D
 LBpv5YhpvVvKD7ZX2N/R8ph4S3+i8Np3oGJhG8uTP4URhRf+FIMfqrew3tw9sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZlWm3cNF
Subject: Re: [Buildroot] [PATCH 1/2] board/licheepi_zero: move board files
 to their own directory
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 4 Nov 2023 19:38:18 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Could you rename the folder to licheepi-zero instead of licheepi_zero?

I see you actually sent a newer version, which has been merged, and
this earlier version had not been marked as Superseded in our patch
tracking system. You can therefore ignore my previous e-mail.

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
