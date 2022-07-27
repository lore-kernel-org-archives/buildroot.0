Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECCC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A10C404A8;
	Wed, 27 Jul 2022 09:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A10C404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZW9NHoEhKchr; Wed, 27 Jul 2022 09:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4A940498;
	Wed, 27 Jul 2022 09:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4A940498
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1D31BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58FD240498
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58FD240498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0loHuv4XTVWx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4951E4028D
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4951E4028D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:58:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50D7E200008;
 Wed, 27 Jul 2022 09:58:15 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:56:58 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220727115658.3b651808@windsurf>
In-Reply-To: <VI1P190MB049338FB77B48163B93C25A99F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049338FB77B48163B93C25A99F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658915895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wAetjrwQn+bDG28MGgvXlIepQ7Uz/16PGEPKmiCZdM=;
 b=kFNkwb5bcm8ZZ1+Z8aMhxprbtjF/tDO3mVFzTQpxcNz/qupBwHBtQ0ia3I3uLR3pJJk54G
 7pHfxxxS11sSlwClbVIU2dTTI8EBCKbJD39QRalDH1Ow/CR5YN3VGtHvtQkQhEIo85xNzY
 snYeuwJT6amfQTx9U5PseAyS1Gj6pc+LuUBBwDQic/FOJQGptkFHcvHFTKWXO7lyQ3ifYd
 HZ3NwcOxRl3E7eZANYe7clA6P3JYJLMtW+8Vp2g9f5+NtWdxAg//xYoLTw5E5L+Um9oQcO
 IdO0rdecwSzYwW0+qU/xF1k3GZipwVFhEpNnyZxbJO20RKskWdG+LJz4krr6gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kFNkwb5b
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: sample file path
 without white-space
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 08:35:20 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> By default sample files are installed to share/doc/Eclipse Paho C/.
> The white-space can cause problems later down the line.
> Therefore the path is changed to the one used by paho-mqtt-c
> when configured to build the .deb package, which is share/doc/libpaho-mqtt.
> 
> Before:
> Install configuration: "Release"
> Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish.c
> Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish_time.c
> Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_subscribe.c
> 
> After:
> Install configuration: "Release"
> Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish.c
> Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish_time.c
> Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_subscribe.c
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.mk | 1 +
>  1 file changed, 1 insertion(+)

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
