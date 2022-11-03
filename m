Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9011AC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407876105B;
	Thu,  3 Nov 2022 21:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 407876105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTz0hyPMmxp6; Thu,  3 Nov 2022 21:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743FF61051;
	Thu,  3 Nov 2022 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743FF61051
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0331BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45C8060AAC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C8060AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIzORt7PxYXg for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0873F60769
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0873F60769
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB052240002;
 Thu,  3 Nov 2022 20:55:48 +0000 (UTC)
Date: Thu, 3 Nov 2022 21:55:47 +0100
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20221103215547.6a56c616@windsurf>
In-Reply-To: <20221103014032.791064-1-m.niestroj@grinn-global.com>
References: <20221103014032.791064-1-m.niestroj@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667508949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHWJNWIVb+IEkfH4AOUhuo4IclBXfzGkRaflMq473Kg=;
 b=iU/AVVu6Vh8dmB1/0bJiSbmz3RnO6tkJbu+74dXZZyPur8smMSj2+CvUO6LMdehz2JcHum
 TEdrfoxBrg2UzHJK3jPhtjP8VbbBiW3o162uWXZLOg66ROo+rh+YrRTcdufUQ+ZspSLYde
 TRF0k40RgqQWfJ7Jp3nVHkh/KQqOyQuKSJXTbjlXbIbSo/vEX6G+CH/3Q28rRpn+agdIby
 63SiAqs0QxIzo4ER9ABETCardTKKkTexK5VO7b4JLD7jy8hsyfW0M94moCOX/MlGHwQI1t
 Rd4aR1r7mdTlbqKsrU9wvDieysbJm7/AqJNIQjGmp/y8aOEMo1RVzKDjR7z5Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iU/AVVu6
Subject: Re: [Buildroot] [PATCH] package/python-pytest-asyncio: bump version
 to 0.20.1
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

On Thu,  3 Nov 2022 02:40:32 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
>  package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
