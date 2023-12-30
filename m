Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C8C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA1B6104C;
	Sat, 30 Dec 2023 18:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA1B6104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWJL6-zkPBKk; Sat, 30 Dec 2023 18:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A5461071;
	Sat, 30 Dec 2023 18:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A5461071
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B107E1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8910240189
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8910240189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6RL_CjL1pAj for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40AF640103
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AF640103
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A8A41BF207;
 Sat, 30 Dec 2023 18:01:48 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:47 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20231230190147.4d13dbc9@windsurf>
In-Reply-To: <20231228094727.27357-1-buildroot@heine.tech>
References: <20231228094727.27357-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4O2l+husrO9D8/vX2cMeeIu6hnXM4LBRZNr8J4st3Dw=;
 b=V14tjaYT6ev8lTyYnG91dfM4IiQjg4WoRhvmiwNWjxoN/m2GHdOXRBsibMVINRXjGEVfwa
 bktJ/GJRQVZETyGUM3E1IqA1Unu25DiG5QLV9yRRtGPlXg3CEz9n5V+yayftg0DIHn+Y3y
 gbUpQvpXzLuVWzta8W1ivMsB3IR2ldH0OMyO79UbXSIn/+qMELCxss0FUkWAHwxCUueNwz
 QhvM7HBnG/rV9xDDtK6Xrm6WxAXMIq5Yya25uIpxmOPpJpcu7fQwWgySApzAONzEn3+XdF
 MQEeKO2EmSXdTvuL4/zV2Gz8t9G77BUjmwMyTD47Pik/0lqel9kwjqNm+NlVtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V14tjaYT
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Dec 2023 10:47:24 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
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
