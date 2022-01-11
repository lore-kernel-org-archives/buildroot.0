Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C36C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FFD460F20;
	Tue, 11 Jan 2022 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97X0zJF-7IWA; Tue, 11 Jan 2022 20:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A8660E73;
	Tue, 11 Jan 2022 20:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43F351BF20B
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE1283E65
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXEKUEywoADN for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:59:15 +0000 (UTC)
X-Greylist: delayed 00:23:05 by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C75983E62
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:59:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 411AE240004;
 Tue, 11 Jan 2022 20:59:13 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:59:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: ricardo.martincoski@gmail.com
Message-ID: <20220111215912.40bea95e@windsurf>
In-Reply-To: <61dcb681410a7_8fcfa78-19a@xultri.mail>
References: <20220110162319.294088-1-yann.morin.1998@free.fr>
 <61dcb681410a7_8fcfa78-19a@xultri.mail>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/download: drop support for the
 'none' hash
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 10 Jan 2022 19:43:13 -0300
ricardo.martincoski@gmail.com wrote:

> Hello Yann,
> 
> On Mon, Jan 10, 2022 at 01:23 PM, Yann E. MORIN wrote:
> 
> [snip]
> > ---
> >  docs/manual/adding-packages-directory.txt | 9 +--------
> >  support/download/check-hash               | 4 ----
> >  2 files changed, 1 insertion(+), 12 deletions(-)  
> 
> Another file to change:
> utils/checkpackagelib/lib_hash.py:        if htype == "none":

Good point, I fixed that when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
