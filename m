Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64491C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0386D40448;
	Sun,  6 Feb 2022 10:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVvY97MKr3ug; Sun,  6 Feb 2022 10:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01615401ED;
	Sun,  6 Feb 2022 10:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1DE71BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB86C401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfCzOEc5uMTt for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:50:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1A7F400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:50:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4DEB0E0005;
 Sun,  6 Feb 2022 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644144642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeEtYeoiByvhhm0IiwGcmWaRuX1R7PQSsUSm56PNRM4=;
 b=XA5VosvpQ2M/Cde5GOqR8wXBqcsM2dUOqcGEqRMWQhtW5NRmkSUhAqNSPJ8PsGfTkdrFeE
 /gxf3dkyQ8vr+lYPSvwfQnKCjTotyS746qZqoqYWc7Er4zevjUrXC4trvpoAlfF0iCTO0L
 CkcLuqWhpsqJDQ9NdGJQCHiPR+kJlrdDcWo/8gT51tQny2YeZDB0OLitTJDtMxFwcfbVjS
 xCRLUc8M3snOnVwLQo9wPKDyCFsMOBOTJen6NdkgsyTrDEHeGZPaCvcoA0a+st5GRz4ujJ
 GCucKsoivuM9xsMFDTbDiCZYG5ZJlu+ci1aeNRqVa0x0A55CxXnlAClgr+hUTw==
Date: Sun, 6 Feb 2022 11:50:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206115041.58101a3a@windsurf>
In-Reply-To: <20220201230414.4144930-7-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
 <20220201230414.4144930-7-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 6/6]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add missing
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for linux
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Feb 2022 00:04:14 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821100
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add host openssl linux
> ---
>  configs/microchip_sama7g5ek_mmc_dev_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Same problem as PATCH 5/6: the kernel version should be defined as a
fixed version.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
