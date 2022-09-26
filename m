Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9529AC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 08:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B09160EC6;
	Mon, 26 Sep 2022 08:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B09160EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KM_Gz59b_X1B; Mon, 26 Sep 2022 08:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4395560E1B;
	Mon, 26 Sep 2022 08:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4395560E1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 292971BF28B
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06EE0401C9
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 08:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EE0401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lLBTyyCpn1i for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 08:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85AEA40159
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85AEA40159
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 08:05:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77A7D6000F;
 Mon, 26 Sep 2022 08:05:53 +0000 (UTC)
Date: Mon, 26 Sep 2022 10:05:52 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220926100552.212e0d83@windsurf>
In-Reply-To: <CA+U=DsrR9+WK3gWR=N3FRiOokuLzLWt=mYeWMbRU-Pme=wJN_Q@mail.gmail.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
 <20220925204030.1661583-2-thomas.petazzoni@bootlin.com>
 <CA+U=DsrR9+WK3gWR=N3FRiOokuLzLWt=mYeWMbRU-Pme=wJN_Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664179553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXeFKKUOwi8ClBJUjhlScAwU48HvwgcO5RugTuuZDI4=;
 b=hhxPssfvdNVgCHLFAd3IVcCCi0L6RhNKM78yXHF9ZEo+EhHDNcLdJ8cx9BWso/xnhcntcv
 65p3GxeJTsVxmcQX5bW7A4Z3/qQu8qYpb2WnLP04NqSzJUOWzZofTG+BRs2oLUjVUqF+4S
 WgiQGfnr3o5iiLe62JF12690bH0NB+WWuZ2r2ruIvImxCHGZbxN26s0w90ZwiKNnyNAcYr
 nStmPonbIGtno1falDN5gLGS2hMVSx/+biUqZePRm5vQBx421gJ1HET533Bq+V4Rh7qOl5
 +l0IWZCJRBOAOt/PDvPn9sf0HeeeB/f5jNRrykCamVC+9fw68fmsNKLsdAY+xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hhxPssfv
Subject: Re: [Buildroot] [PATCH RFC 2/4] package/nodejs-bin: new package
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Sep 2022 10:56:10 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> Silly question(s) from me.
> This may go against some BR guidelines.
> 
> But, what if you were to add a 'package/nodejs/version' file and
> include it here like `include ../package/nodejs/version` ?

We've not been doing this like this for now.

> Another idea would be to maybe add a new folder sub-level like
> 'package/nodejs/nodejs/<the current one>' &
> 'package/nodejs/nodejs-bin/<this new one>' and have a
> 'package/nodejs/nodejs.mk' which includes the mk files from the
> sub-dirs.

See the commit log for PATCH 3/4, which says:

"""
One possible alternate organization is to have package/nodejs/ contain
all three packages: package/nodejs/nodejs/, package/nodejs/nodejs-src,
package/nodejs/nodejs-bin, which would allow to more easily share a
few common variables (version, license, license files, CPE ID, etc.).
"""

 :-)

BTW, did you confirm that with the latest master you can now build
NodeJS correctly for your scenario?

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
