Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A1BEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B2460758;
	Sat,  1 Jul 2023 14:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B2460758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lanLO72NUNvJ; Sat,  1 Jul 2023 14:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2678D60ABD;
	Sat,  1 Jul 2023 14:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2678D60ABD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0E81BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4386760ABD
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4386760ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUtDZlS9t1oE for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28ED260758
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28ED260758
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:15:57 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41EA840002;
 Sat,  1 Jul 2023 14:15:56 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:15:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701161555.23d17067@windsurf>
In-Reply-To: <20230628061052.15804-1-bernd@kuhls.net>
References: <20230628061052.15804-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tY43ulyFIDkj5ewHDTSBy9VD6iNpxZkWTsFmZOhQ5HU=;
 b=V0JsZnURtpmN26JFqwYeTW1/YrrXQ4IV6LOkb7VH10bAyAW1X79ErBs1Ab1D5VWdd6HpLL
 AwZra1ZmC8rWLlu3neg7Z+djXj9xGmYtHhJPMDPnAUWxSJg7/af6dYWxIoEG7AogHbNSkt
 KFgTxNeIWH3Wybft2FTq071+R6Pm3PbOy7FpaEiJyEibb5YxA3sI5w5xEWoKon8j06RgBu
 v5AhlU+/z24tNtPr/o7bAGqg4HyNGxI0KxpR7f3r+q6Hn4jB5gYbFtg8mIPc/h/x2GeQ4c
 Sl2uEUGg4KvDER/lXp5b/XMqpLaX+I2zgg7CcLqghMKwQKEg74UrAKl2XRvHDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V0JsZnUR
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.40
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

On Wed, 28 Jun 2023 08:10:52 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://sourceforge.net/p/png-mng/mailman/message/37860896/
> 
> Updated license hash due to copyright year bump:
> https://github.com/pnggroup/libpng/commit/9923515ff441b4c07ce3f8c9985a547fe582c4da
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpng/libpng.hash | 8 +++-----
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 6 deletions(-)

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
