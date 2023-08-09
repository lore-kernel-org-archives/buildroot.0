Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6BC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E148E41923;
	Wed,  9 Aug 2023 17:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E148E41923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJWrKUFIg-V9; Wed,  9 Aug 2023 17:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EA0418F7;
	Wed,  9 Aug 2023 17:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EA0418F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9895D1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8D7610B4
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8D7610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLWlfYUf74RI for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:38:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DCE160E5C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DCE160E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31D75240003;
 Wed,  9 Aug 2023 17:38:55 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:38:55 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230809193855.60c6b89c@windsurf>
In-Reply-To: <2691942.mvXUDI8C0e@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCkDWQdVLn5Q7qkzcOorf5BYjiFMwEf72uOBZh7SByk=;
 b=DqfLLxdvGN/CITYHT1pJdOxFjjg6QQt4id7iKjNBpMjK6M/lIbqaNbAmqCq9sFyNuiz5uf
 Imev1y+Wh/9/YT4242WRGHX9H7fDh7s4J95Ztaz47SDjRhFpCh3c2dbl9zhCylWX7MCaMu
 ROkSjq7iEExsT0BsPs27clsMO8NeydPRa/8tf8rhDPtKbKRVfzaFKF+djtWyyUATRI1pb1
 yuU2330q93csJU/Hf4yxT0F3C1lMaQKCpwSrSWpTJwH6/XFFUqV7buKpfzdOEaV9B/InED
 DhaoEc0YI1Z7V74nxA0yE+NWUBekHaGzy9dFKrse+J3bYLFyUjkZ2gqsa9Jy5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DqfLLxdv
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 09 Aug 2023 15:57:21 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> I am interested in adding board support for the BeagleV-Ahead.

Ah, ah, I was working on this as well!

> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/beagleboard/beaglev-ahead-u-boot.git"
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="beaglev-v2020.01-1.1.2"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="light_beagle"
> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beaglev-ahead/uboot.fragment"

Backport commit 1dde977518f13824b847e23275001191139bc384 from upstream
U-Boot on top of this vendor branch, it will solve your problem.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
