Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C05C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD0C60FC1;
	Sun, 10 Sep 2023 16:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD0C60FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sb7oXoJWFh7m; Sun, 10 Sep 2023 16:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21A360FAC;
	Sun, 10 Sep 2023 16:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E21A360FAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15BC21BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEEE281760
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEEE281760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtiEuBCUoX5D for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:42:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E13AC8175C
 for <buildroot@busybox.net>; Sun, 10 Sep 2023 16:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13AC8175C
Received: by mail.gandi.net (Postfix) with ESMTPSA id A510240006;
 Sun, 10 Sep 2023 16:42:51 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:42:50 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230910184250.05311207@windsurf>
In-Reply-To: <20230904165745.1150674-1-francois.perrad@gadz.org>
References: <20230904165745.1150674-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694364172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3/qd4eD9zZv/7SaX1u+NHFeaL2HtnzgvhfL1UKZKO0=;
 b=J5wwZIRnPLhUNm9ixw+yh+/cIJ8vdGSKrucR/jXrt9zwlw5ew+Stm1LgDRbw/mdY3grP+W
 Lwg2KF60krE84qv4JrK1VWbxvAsxK4cT5AUWl3DGuOHtfUzmyrJLHL23OmH/uXrsHfTOBr
 R0N8Mt/pDI0G/rJNj6VPRrZBjh8LXpeZxDy1wLw+zIHkprP62Gu+t84aC9ifuyjhEo4Y+A
 VhNwHhE45UxuzlsMDSrLXc+j/9TDjCp4PKBePPB7dO56xTECEsxqyQYkkf/d36rvV9Klqv
 FokMfHWPSAMq1IS2cGOPuo1zV2p0ectmIurYux0jVbArvMO4X7axfwU7UwkU3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5wwZIRn
Subject: Re: [Buildroot] [PATCH] package/strace: bump to version 6.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Sep 2023 18:57:45 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
