Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0FCC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE55C81758;
	Wed, 23 Nov 2022 21:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE55C81758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bxOWS7tQySm; Wed, 23 Nov 2022 21:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12F28127F;
	Wed, 23 Nov 2022 21:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12F28127F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA1411BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8320A404DD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8320A404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxYIgyvEkOQ1 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B9E40116
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85B9E40116
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:58:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23A061BF204;
 Wed, 23 Nov 2022 21:58:41 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:58:40 +0100
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20221123225840.2409b758@windsurf>
In-Reply-To: <20221123225808.34173b95@windsurf>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
 <20221123195304.1582783-3-chris.dimich@boundarydevices.com>
 <20221123225808.34173b95@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669240721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNqUmKy0Iq11CcLdwgNYG3I0GiZmuPLV62G9Z93iwos=;
 b=csj+FNStEnYuOiSrSpMzzhcBxK2FgG8wCKd9glgcmcHum1GO/+am3/CNIKp7EQez12UAEK
 DyN9pxrmCQqrLlDxy3+hIGgXK5bfPSNZDV/agvynCU2Jsd5r91zMmwCUxQzEuvMmpGscvi
 Dw7Yp43sgmIHn0HigqrLZa2PfUTYLLpk5uRjK9MKlLbeIwODPIVYX3GirWl18CQpxBKcaO
 0D8lcXB6aMmnoKI68uZv7PcejwqCP4PAkhHTZHLZMoirodXu6kHe2lRqNu69rVM2e3x/d+
 FPAxQQwJ35nTflWjmSszVRLgNlfQ7CuSX8977YGZiB0sNQLzUJ+f4Gs7kKQXoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=csj+FNSt
Subject: Re: [Buildroot] [PATCH 3/7] package/freescale-imx/imx-gpu-viv: bump
 to version 6.4.3.p4.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 22:58:08 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Applied to master, thanks.

Sorry: applied to next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
