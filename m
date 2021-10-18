Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAF1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:04:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594B6610C7
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 594B6610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2B280DD2;
	Mon, 18 Oct 2021 20:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8Zm8BgK9LRD; Mon, 18 Oct 2021 20:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FD380DB6;
	Mon, 18 Oct 2021 20:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 565471BF2C3
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4644360651
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2K04IDxN-G7 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5006F60635
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:04:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 860B11BF208;
 Mon, 18 Oct 2021 20:04:28 +0000 (UTC)
Date: Mon, 18 Oct 2021 22:04:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211018220427.5971bba1@windsurf>
In-Reply-To: <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
 <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,2/2] package/knock: add knockd option
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
Cc: Michael Rommel <rommel@layer-7.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 16 Oct 2021 11:32:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
> +KNOCK_DEPENDENCIES = libpcap

From commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1:

    Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
    conditional is the root of all evil."
    
    Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
    conditional is the root of all evil."
    
    Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
    conditional is the root of all evil."
    
    Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
    conditional is the root of all evil."

Care to repeat after me ? :-)

Anyway, with this typo fixed, applied!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
