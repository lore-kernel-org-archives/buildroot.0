Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C98C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C0FF40982;
	Wed, 27 Jul 2022 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C0FF40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOxMheMY-rwZ; Wed, 27 Jul 2022 20:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6728940391;
	Wed, 27 Jul 2022 20:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6728940391
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28A821BF39A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF19B8283D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF19B8283D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id be3pCPL-BPWv for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 20:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3535D82861
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3535D82861
 for <buildroot@busybox.net>; Wed, 27 Jul 2022 20:24:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AFE39240003;
 Wed, 27 Jul 2022 20:24:19 +0000 (UTC)
Date: Wed, 27 Jul 2022 22:24:18 +0200
To: Guillaume Bres <guillaume.bressaix@gmail.com>
Message-ID: <20220727222418.6445be10@windsurf>
In-Reply-To: <CAJe0E3fFS=bMkKi5bU91RT-W3HVPSrWMmJiD1KJ1V8hjTiEcZA@mail.gmail.com>
References: <20220219181554.32204-1-guillaume.bressaix@gmail.com>
 <20220727082502.17cc05e2@windsurf>
 <CAJe0E3fFS=bMkKi5bU91RT-W3HVPSrWMmJiD1KJ1V8hjTiEcZA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658953460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx7VZUrg3Ijijltngz3j+IZmtsU8Yag6rgXwbqYFSaA=;
 b=KlEx7OWLgdFffp+4UENIQEl2e7fBTeHsNP9CWPt3BFgx74qopBoblnDpSA71YiuGl6BDsu
 wvL52BG3vRgiI2Oq94reaRgxyS/RxIzUKjt0xX2Lt/M9ppebhib88yiI9ApL2/0n/ms0VF
 wUvmPbudNOteODcVJEeExuKP3ClXf4dzyk3rYm/kMoD1yWgvh0roY7bEndJjJSRT3H1qrI
 8MCav8pmsRScjaMpTARRX2oAp+7c0pLULDuocl+otIiJ7tyahRqut3csuWoUZv2AZfliQM
 jFoAJq21XgZm8HNFo0dEsqiskxLVI64vETyPKQkQ+0gGy1N3ZsGEMvq7MKjUZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KlEx7OWL
Subject: Re: [Buildroot] [PATCH] package/python-joblib: new host-only package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Wed, 27 Jul 2022 21:40:49 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> I did not propose sklearn along these patches because it
> requires python-scipy to be merged first.

You can propose a complete series that includes python-scipy, the
dependencies of sklearn, and sklearn itself.

> I just resubmitted an updated version of the scipy serie
> https://patchwork.ozlabs.org/project/buildroot/patch/20220727192948.18653-4-guillaume.bressaix@gmail.com/

Seen that, thanks a lot!

> btw, thanks for merging the new NTP daemon "ntpsec" ! :)

You're welcome, thanks for your patience!

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
