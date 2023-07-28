Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA0AC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1F682FE4;
	Fri, 28 Jul 2023 19:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1F682FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAl2lQfsjYFs; Fri, 28 Jul 2023 19:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8493A82F39;
	Fri, 28 Jul 2023 19:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8493A82F39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAD701BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86D1760AEA
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D1760AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BJ_KxUpjcaC for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:23:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E87D60AB2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E87D60AB2
Received: by mail.gandi.net (Postfix) with ESMTPSA id A65201C0004;
 Fri, 28 Jul 2023 19:23:37 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:23:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728212336.6111939e@windsurf>
In-Reply-To: <20230728151903.466787-2-bernd@kuhls.net>
References: <20230728151903.466787-1-bernd@kuhls.net>
 <20230728151903.466787-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdni3Po4YAY3lwakG7N1L4BzsIMMGFUGStby7vLExes=;
 b=AQFWD1F5zzjAiMrJyKZXP0HINB98iUViuAEmMW42ts6wAlbJcQ4ruLYvNHCYyZ0xQ/nrNt
 myEmiAU7RKNk5zkAraEaLezM4IzCU/V0S3vZousGASgCwknQL+lHtphEhn/SpiLmNAwD7s
 A7oANT76Nn0yTh10Zk4XW6x/T86rIB6sbqOFP6wDvawyu05gmsPLgDd/oIVIVvhHZEPILL
 iyirwj6pm0dzQUpBx4pfaV1hHBwMWpFof4Squ3u42vKDqUqRaNtiZSjeJ9QZjkSFO2Pb8D
 5zqbkAdujkxB7PIoOD01P6ORmm5HpaS2OLYl3nF4Ee/I20OIuuWifHMsjjcXRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AQFWD1F5
Subject: Re: [Buildroot] [PATCH 2/2] package/libopenssl: fix libatomic
 dependency for x86 builds
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

On Fri, 28 Jul 2023 17:19:03 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> autobuild.buildroot.net/results/ba9/ba926fc27cf3d97274729b3ec1cadb3229bd3af3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0006-Add-linux-x86-latomic-target.patch   | 30 +++++++++++++++++++
>  package/libopenssl/Config.in                  |  3 +-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 package/libopenssl/0006-Add-linux-x86-latomic-target.patch

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
