Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880F5EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41782612BC;
	Thu, 20 Jul 2023 21:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41782612BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfGIHoHdknBr; Thu, 20 Jul 2023 21:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A666612A3;
	Thu, 20 Jul 2023 21:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A666612A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862421BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60532404DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60532404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ox1686ZWwIg for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:30:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AF7A4049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF7A4049D
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7A8C1BF207;
 Thu, 20 Jul 2023 21:30:48 +0000 (UTC)
Date: Thu, 20 Jul 2023 23:30:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230720233047.11e3c641@windsurf>
In-Reply-To: <20230720053915.34294-1-bernd@kuhls.net>
References: <20230720053915.34294-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689888649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8a9mIrOSTgf0Ha51w+9g3l141nCFBnTHAg3KA8zpZ3Q=;
 b=pMSqC6n15BUBgAIXtozi2pEZBjTGMtYVoJnER6PRNBwSCbSgQL7Z12XuSZZQDbCwPsdGeR
 gxaaVDQTpexl8Tkl0jDTb4JvKh2JzhFoSBc7vlfGPm/6JyStmNFHF9H3U5QXGcqt4IxLeB
 QV1wtrr07P3aHDXNVFuxyDw/toPTt42ezdSqmDXt/rjYAaEPFuMD0qYnWThwxxWUBAkG9u
 0ELrvH08JH2k44MWvh8i1oy6NJjz17VIPDJ+SleACR4ch/rjKaesq8yfuAF7dd46P0k3jo
 qrT39ezQBYNDwCwitm6hZO7xO5q81BZAK8+RZMrD/6n7E3lvkU80ORGEgeWXqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pMSqC6n1
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{1,
 4}.x series
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

On Thu, 20 Jul 2023 07:39:14 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 4 ++--
>  package/linux-headers/Config.in.host | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
