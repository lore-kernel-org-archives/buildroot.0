Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC03C00528
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC5BE40164;
	Fri, 14 Jul 2023 21:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5BE40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMnQ3vSD2SEH; Fri, 14 Jul 2023 21:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0076C400E7;
	Fri, 14 Jul 2023 21:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0076C400E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 795DD1BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5321583336
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5321583336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdiW5duqGPS6 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C57E831C1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C57E831C1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:47:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E1A6240007;
 Fri, 14 Jul 2023 21:47:04 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:47:03 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230714234703.78d5acc9@windsurf>
In-Reply-To: <20230714064413.11433-4-kilian.zinnecker@mail.de>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-4-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689371224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6upR40wL6N0AnYf48KYWK+Jy0t8S4Oii7b68q7q0Dag=;
 b=UVmD0KMeREVah+LRL+u/eQDQy9ieOth4bE15dsTOdbWSVmpPF5H/L+Sfsw+jg9FmReQtsN
 4e7530nwCVbWVgRqQMG7WXUcxWoI4dO1PlS2hX3wem/xhXjcGlCnWt9kkkkbPlHcmdn+Oj
 h6ZiCh/sCaUWq4SSRcyKfHRkzic0XwPZMi9j27OKrehuyJVNKjOzEayJhJ0gChz9Yv6jky
 +jR4FoeQBhqlWFroT8Pq3we0MqGTLHSTNz8+AUccy3h9/Gru7zahDHFb4Ig8ZCjOvLVER/
 AN9UVKV9xgUMmrrns8byJh9MCaMLUlaXsbOyEzM2o2KIr21gzc1yO2MN9a5eNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UVmD0KMe
Subject: Re: [Buildroot] [PATCH v6 3/3] board/radxa/rock5b: Add sdcard image
 scripts
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

On Fri, 14 Jul 2023 08:44:13 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a readme and post image scripts, generating an
> sdcard.img file, which can be flashed on an SD card to boot the
> Radxa Rock 5B.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

This should be squashed in the patch adding the defconfig. Indeed
without this, the defconfig doesn't produce anything that can easily be
booted.

> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage \
> +  --rootpath "${TARGET_DIR}" \
> +  --tmppath "${GENIMAGE_TMP}" \
> +  --inputpath "${BINARIES_DIR}" \
> +  --outputpath "${BINARIES_DIR}" \
> +  --config "${GENIMAGE_CFG}"

Perhaps you could simply call ./support/scripts/genimage.sh directly?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
