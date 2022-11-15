Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC8C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E27740A63;
	Tue, 15 Nov 2022 13:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E27740A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBxnhZmm2pR0; Tue, 15 Nov 2022 13:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49607409E2;
	Tue, 15 Nov 2022 13:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49607409E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC2171BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A546760E2B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A546760E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3ZgUxnNtvhu for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:43:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805A160E26
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 805A160E26
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:43:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9886324000F;
 Tue, 15 Nov 2022 13:43:36 +0000 (UTC)
Date: Tue, 15 Nov 2022 14:43:35 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221115144335.6efcf3fb@windsurf>
In-Reply-To: <8735akgynk.fsf@dell.be.48ers.dk>
References: <20221111224011.430289-1-thomas.petazzoni@bootlin.com>
 <8735akgynk.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668519817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wk378mk9G0spKpK47p6qArYoBkKyAyPogBge0m5cp8E=;
 b=Z17BxlOA/SF6ZIm6TKr9htcwSkNrCTxAzwPVjJTMg4/3JBquTNyQyAXvhSHFVC849qnvhR
 nYV62XXaznenjNlz7JK3ei9WweVNqJhcMSlZDPIkTopaJuB9WBrTNxAf8iTEo+VbpdDVPy
 Z7TRnUw3KQlL/XdVsj/erGeBZIoiLXE18I/wbo3QcSBNOXsEV4qq4N+DGtyFQmV1o0EoJu
 Ep7Gbt0zhNTWqOOXKBeAECaZEonydAMKyQNwowbm4Gtvqzv8QN9v3ZHlMf7zO/lFfOcEh5
 Qsq8Bv798UxviJjuxilaGN4F5KPizpYe48jXtyFZHhF5VslS7y41rspaNECTwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z17BxlOA
Subject: Re: [Buildroot] [PATCH] package/imagemagick: utilities now need C++
 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Nov 2022 14:01:03 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Is imagemagick without the utilities useful?

It has a library. Not sure how widely used it is, though. dvdauthor,
libvips, php-imagick have it as a build time dependency, so I suppose
(but didn't check) that they link with the library.

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
