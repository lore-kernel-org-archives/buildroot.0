Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E8C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4506960E92;
	Sat, 23 Dec 2023 14:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4506960E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktvlunfkvLBB; Sat, 23 Dec 2023 14:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A8660586;
	Sat, 23 Dec 2023 14:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84A8660586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 881651BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6022541BED
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6022541BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0U6MvZaXYN0 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:15:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3133A41BD6
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3133A41BD6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FF3660003;
 Sat, 23 Dec 2023 14:15:13 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:15:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231223151512.0544e644@windsurf>
In-Reply-To: <20231220190154.77440-1-bernd@kuhls.net>
References: <20231220190154.77440-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703340913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ea4ceOIDNUTrxyVdc/lBg631Uvzluf0VFxcyzxhzRo=;
 b=Ls0AH9Zz9N2cNlLvdLuqtBOkNI5R8LMZz30Iq6qhao9nrlsMfWP1C1vSi0EB53UBfQNo6Z
 fQaKVtMszxUZHiZ3EmR+8F6mi3cwQriL1imndhyKtUfS48vd8/711sPkkU649BO8Yjfa4D
 jU0hw5mdHa+os1C7oP7HLRD0fmQl3P10Lv5qfzNvxdNdYSfmerhrwfty4PgS344r460tRC
 Hh4A6S9rNsb12rKSzmcBx9AWdB2u6SFo2awMtSIr/PL+kLs8n0iZZ+RVui9C09upu/9ren
 EGK5EifTyYhcgeuggTvCt6GJ3WTM86oyv6vR/yj8yTjoqz4Lq4+D41ygeummng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ls0AH9Zz
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-hts: bump version to
 20.7.0-Nexus
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Dec 2023 20:01:54 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
>  package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
