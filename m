Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119FFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95FA84049F;
	Sat, 23 Jul 2022 17:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95FA84049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7Tv0XAq4ouE; Sat, 23 Jul 2022 17:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A82EF40515;
	Sat, 23 Jul 2022 17:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A82EF40515
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B00C1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A3F60E6F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A3F60E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UK0EwZLF7_ks for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:47:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F6560B5B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7F6560B5B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:47:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 750941C0005;
 Sat, 23 Jul 2022 17:47:39 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:47:38 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220723194738.63e885ab@windsurf>
In-Reply-To: <20220621210529.251477-1-ju.o@free.fr>
References: <20220621210529.251477-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658598459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1F/9CQA9qwmY3oX0uVWeBxov1kvOcTIMXhSkCkldKY=;
 b=mh88sefZlMkMzaWR5B71fJKAR5hSVRgNqphn47msklfvtMHZN9ovTyTEc+gnR+tjOJBg3Q
 iGo7cNvqguMDE5PCll629xm4k09V9Bw/TNyqRTCvDK0pwOd7aUrDSoNRN6SrJdk7amEnjr
 tp2LZXkppjTh34UTnl2HwA8f2kdR+y2yp5l/sdNdjwXbvscc/fxHlfX7Li4u2kaaIwCwaY
 JDcc0vgYKHfSKQZMpG0rnC3tQ872gBb13EamfN5lHBpYXb38JAB39fz4zjkadc9PMCusfG
 /xh0I00eBAQQ2coyoPtgXwyK+gstf2vRLnx3VZAcFtZswWaP7a+LhvyTipHUFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mh88sefZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version
 0.4.9
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Jun 2022 23:05:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/vsajip/python-gnupg/blob/0.4.9/README.rst#049
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested with:

Applied to master, thanks. However, you had forgotten to run "make
legal-info", and the license file had changed, causing its hash to no
longer be valid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
