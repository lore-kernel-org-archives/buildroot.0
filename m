Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F74DEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A49820DB;
	Mon, 10 Jul 2023 17:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A49820DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_3jLYZKlTNg; Mon, 10 Jul 2023 17:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C084820D4;
	Mon, 10 Jul 2023 17:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C084820D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53A901BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C2FA417EA
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2FA417EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgpQGSYU-XdE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:43:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5091417E7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5091417E7
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:43:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1F086000A;
 Mon, 10 Jul 2023 17:43:02 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:43:01 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230710194301.57eeeadd@windsurf>
In-Reply-To: <20230629135124.63139-1-marcus.folkesson@gmail.com>
References: <20230629135124.63139-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieg0JEiNMbDQaer/+mz5lHfJ0KnOAIl1C5nWZlw1gnw=;
 b=YjSrQUCNGJAylofYb6Nt7FW67adlIwQEJvpfsZ1c0Q0I4yNlKvfCZtMIAy8OlwftnPm67p
 a2hr1i9LeuneAEvHN/S/vNggFvZ1EnNKOAfNV0W6auIC65Q0Sf2zba8ZU/SCdfKFNbeS6r
 zVQkIsbl/GW4J3zcqX2bTwWNCyHR3SQBjPjVOIWmyGaHK1/3ggoUPyLGTw0c1LQygzZfrf
 SIs6MAzti2zBsVJjT1kNPyfEIOPDz4cb/mxpkSc8ol4XPw7+PaDPGAVafeRjiVT6fiOxAG
 Ml39HnfPc0W3dHXdInb1gPuip2aR2nNplHdUo6eZ0h9pK8g+xQiUHNHXKm32/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YjSrQUCN
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: bump to version
 1.2.0
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

On Thu, 29 Jun 2023 15:51:24 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera-apps/libcamera-apps.hash | 2 +-
>  package/libcamera-apps/libcamera-apps.mk   | 2 +-
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
