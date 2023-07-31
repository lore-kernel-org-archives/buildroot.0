Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7052CC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1793B40BC7;
	Mon, 31 Jul 2023 21:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1793B40BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oNRQaX_JRpp; Mon, 31 Jul 2023 21:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0285E40BDE;
	Mon, 31 Jul 2023 21:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0285E40BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0431BF964
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E915A61107
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E915A61107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClvKIq2QF2u4 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:25:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F61860AE1
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F61860AE1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CEEF240002;
 Mon, 31 Jul 2023 21:25:19 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:25:18 +0200
To: Jens Kleintje <scooby22@web.de>
Message-ID: <20230731232518.5885397e@windsurf>
In-Reply-To: <20230320115508.1249295-1-scooby22@web.de>
References: <20230320115508.1249295-1-scooby22@web.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690838720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHZF5ho3n+MzjK4Br2zxzuUHSg4v3rZq+02nAuPcgcc=;
 b=HvXHzO08bmOu3EJo5JuyH3ls2MDgdE8T3Rs0TQJlkf6SQdL9zgdd1XQMwD20aFyrmSAfoG
 ehHXfDIPKO1pHW5MoccLNTMpPEilxN1J1UiIMsRG6OVocQJaNV/KUMg4ZwxiYk3E8gj5NS
 coAhqRH8sGKfHI5yuieLmHBAFsNaeU+un6/WGRwbHfLxQf82gVcbfqGUmz1pNupCd4ksdl
 p/FRW3f6HK4waXFC2bzIL2PM+LX3bIiUnWwBP4X5L/mHw33Dx1QwztQFQ1ug0xhsYXTE2j
 0cH1MqtgY4TYBsbtNbsr76Np7nqmMjlCHFW5Kp46gIU6+KHvgJ9DTmrOQbi38g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HvXHzO08
Subject: Re: [Buildroot] [Patch 1/1] esp-hosted: new package
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
Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jens,

On Mon, 20 Mar 2023 12:55:09 +0100
Jens Kleintje <scooby22@web.de> wrote:

> The package provides a kernel driver for esp32 as wifi module.
> The project https://github.com/espressif/esp-hosted/tree/release/ng-v1.0.2.
>  configures the esp32 as a wifi module. The host and the esp32 can be
> connected via sd bus or spi. This package supports only the host sd
> connection.
> On the esp the firmware from
> https://github.com/espressif/esp-hosted/releases/download/release%2Fng-v1.0.2/ESP-Hosted-NG_release_v1.0.2.tgz
> needs to be flashed.
> 
> Signed-off-by: Jens Kleintje <scooby22@web.de>
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/esp-hosted/Config.in       |  8 ++++++++
>  package/esp-hosted/esp-hosted.hash |  2 ++
>  package/esp-hosted/esp-hosted.mk   | 17 +++++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/esp-hosted/Config.in
>  create mode 100644 package/esp-hosted/esp-hosted.hash
>  create mode 100644 package/esp-hosted/esp-hosted.mk

Sorry for the super long delay in getting back to you, and thanks for
your contribution. As Giulio replied, he had been working on a similar
package, and posted on July 11, 2023 a new iteration that was more
up-to-date and more complete, so I merged his proposal.

Do not hesitate to give it a test now that it is merged in our master
branch, and report back if you encounter any issue.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
