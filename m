Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2688C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 10:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2C841BC5;
	Sat, 12 Aug 2023 10:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2C841BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgbqHzd1RSzV; Sat, 12 Aug 2023 10:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A3C41B8C;
	Sat, 12 Aug 2023 10:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A3C41B8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF2E81BF288
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989B781FE2
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 989B781FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2HlO_WNUiwa for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 10:47:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA6FE81F7F
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 10:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6FE81F7F
Received: by mail.gandi.net (Postfix) with ESMTPSA id E56ECFF802;
 Sat, 12 Aug 2023 10:47:29 +0000 (UTC)
Date: Sat, 12 Aug 2023 12:47:28 +0200
To: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Message-ID: <20230812124728.12b3a89b@windsurf>
In-Reply-To: <20230812050845.1551717-1-alexey.roslyakov@gmail.com>
References: <20230812050845.1551717-1-alexey.roslyakov@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691837250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXFSCRGO8cS69a0pAxv+nSidykW54l8YovNMyp1R5CE=;
 b=g17ixOJfzkC0yli7dTFjOwns9sn6BG6OmOET76mwC2XHICWVL3gG/ywcNeITuKvzu25Blz
 zQBkzIbnfkXWpSQM85LtZUxgtuVYTUxJf1nm6XAF4drp9DNuZuTTQ57wrdDtdaHS9pwPDc
 O+6/GRK23YLFBUpDDFCLnKJMEogctMViTOo+6cCflC1A2AhP2uS4Tg00PjYkN+oN/PDLKl
 Wfn3MX7bmKf5QhqEhlXb0EMPidbI+pCI5U/VY5EJWrhOi68dfQN6yELkMaitSFx3CgvRp8
 JmuMvPOmzl/mtQUfZRMRWBp2C/lk5iGoFcavRy40XBHgL435NHDvhBNC24k0/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g17ixOJf
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: enable hdmi console
 for systemd
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

Hello Alexey,

On Sat, 12 Aug 2023 13:08:45 +0800
Alexey Roslyakov <alexey.roslyakov@gmail.com> wrote:

> Most of the users use HDMI console on RPi and with increasing popularity
> of systemd they face a trouble.
> systemd doesn't use /etc/inittab, enable getty@tty1.service instead.
> 
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
> ---
>  board/raspberrypi/post-build.sh | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, but slightly reworked to avoid the nested if
condition:

 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
+# systemd doesn't use /etc/inittab, enable getty.tty1.service instead
+elif [ -d ${TARGET_DIR}/etc/systemd ]; then
+    mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"
+    ln -sf /lib/systemd/system/getty@.service \
+       "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
 fi

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
