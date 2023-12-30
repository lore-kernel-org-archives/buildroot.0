Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFE5C4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5D160F78;
	Sat, 30 Dec 2023 18:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5D160F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zDjM-CgCd_Q; Sat, 30 Dec 2023 18:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E4060F01;
	Sat, 30 Dec 2023 18:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E4060F01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 132E01BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5F060D67
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5F060D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwxxxL-sTUhF for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3A5D60A7D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A5D60A7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C6A61C0006;
 Sat, 30 Dec 2023 18:01:11 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:10 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190110.30a16c8c@windsurf>
In-Reply-To: <20231230165808.869415-1-fontaine.fabrice@gmail.com>
References: <20231230165808.869415-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pqPBG4cTSiCvxfK+VRv3rIlVQNqfAVv9cevPeTFXVE=;
 b=OKNy0yS7skR46Deujblxjl4513C9IRldtNCOsAPD8qpf7vOxxH4+x4iQ+uWqUg5w8veh9o
 ZAvll032nBDXSE6grL2htJdsJUNjqYXqAos+t0Y6xAzjKph61ltnf8Zv2Jtrx5OTpBv3+N
 xnbKsidxthULShzt4z4F821lpjWvC/ykwf6wKhlG1FPNcOIbppt+KUrwoUVG50aqBp1Xw5
 M6l8cwPiUyng8q1FLMviAdU4lUvLQVXHanDi70sEdPwOT1q2D71iKMAeGjXW7zarpxH5hn
 iBSDph9Cf8KRVbYsmQ7vUTnV19nKegmQ0yOdbSeoCHNE1GAQQDTwShmQKFE/Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OKNy0yS7
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.4.7
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 17:58:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop fifth patch (already in version)
> 
> https://github.com/OpenPrinting/cups/releases/tag/v2.4.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...raster-interpret.c-Fix-CVE-2023-4504.patch | 45 -------------------
>  package/cups/cups.hash                        |  2 +-
>  package/cups/cups.mk                          |  5 +--
>  3 files changed, 2 insertions(+), 50 deletions(-)
>  delete mode 100644 package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch

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
