Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136F360AAE;
	Sun, 30 Oct 2022 20:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136F360AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCCtDeF-w9VB; Sun, 30 Oct 2022 20:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D307608A5;
	Sun, 30 Oct 2022 20:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D307608A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31F781BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ABC081260
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABC081260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wh7PCVxqdazz for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D15081255
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D15081255
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:56:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1627360002;
 Sun, 30 Oct 2022 20:56:46 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:56:45 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20221030215645.1a41ec82@windsurf>
In-Reply-To: <VI1P190MB04938FB6F9AA6821AA4F67D19F2B9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB04938FB6F9AA6821AA4F67D19F2B9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667163407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNfYjKwxmyBQwKZGprkzhX0YuuSfGukQAelfOxqHYLg=;
 b=ewwI4vFFlMMAKl9jsBndr+yrFpAx2xLq43XOiVDcKmJZlAq9N3jymRfjkkgcH3sz1QGvCg
 TuYK0M+5Lymr/ieE8qSIB/Zd7TA9WHa+SMShmlKLcVRLa7ey3eaHsYVBxsWTSlNWF+QEmS
 jqJy6IZILyICtJHr4n6FLdLnb4XE4/wUpXxQ5AFKO2p8KRPgmUbagiNjDIXk6NjZfBMPMD
 e+davZW93cA+ZEiSrsvTjZTDIykqS8qCUNu9ZvUYqGxUNSeQ6AWaj/O2f9DpZBgnkq0nb3
 fymg0dmAqeSClcn0y9dOOHMX38ktjjRH829MCKgMAFy6CqlqHl+mQb/LoloC/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ewwI4vFF
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.11
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Oct 2022 09:14:20 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Service release. Issues resolved:
> https://github.com/eclipse/paho.mqtt.c/milestone/18?closed=1
> 
> https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.11
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
>  package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
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
