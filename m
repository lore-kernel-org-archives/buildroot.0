Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7990340457;
	Mon,  6 Nov 2023 21:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7990340457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGVV8jqXoJ7E; Mon,  6 Nov 2023 21:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D0B40336;
	Mon,  6 Nov 2023 21:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D0B40336
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A81F1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 230AA81227
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 230AA81227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQQPjNvypNpN for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:05:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F347181210
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F347181210
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7877C0002;
 Mon,  6 Nov 2023 21:04:56 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:04:55 +0100
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20231106220455.40196ccb@windsurf>
In-Reply-To: <20231106104838.3248519-1-jamie.gibbons@microchip.com>
References: <20231106104838.3248519-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699304697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSxPCb1SQMbx/vweiumbaW+zwBtIzG9bDRwv8Jh6lho=;
 b=hSBpkKVg5lseUpCCmOTDG/9LszZmHrXk/UEdp0shzLgfIbbkDYYTz7xZ3fJ3DuB++ddIqh
 D+mt1lz23xE/LkA9VHGCfpGDByglPi0i0A2fxECZx+RRhqpSabyO7VS8PiDVwXRVTTi9f9
 9mkO4/Fit48/L8+KZLsbGq5THjlJ69YgE+4xUnvYleczyiv01KlbvBzUdQ2yA3DU+Xgnm9
 9G2g0pCfnMIuvVmNzNIpMDMLX3qQQPQwnckO4hZngFnTYB1LbADTBmRdtkh1TnczVqLYqQ
 C0qp07WZ0vzo3/lWMxeXKWf2rnH1VS9PVQQ/coLdLj/aY+6swHZWkttNpeLL/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hSBpkKVg
Subject: Re: [Buildroot] [PATCH v2 1/1]
 package/microchip-hss-payload-generator: bump version
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 Nov 2023 10:48:38 +0000
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Bump package version to latest release.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
>  .../microchip-hss-payload-generator.hash                        | 2 +-
>  .../microchip-hss-payload-generator.mk                          | 2 +-
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
