Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB1EC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4D0614CF;
	Fri, 25 Aug 2023 17:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4D0614CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upoZW41DzQyp; Fri, 25 Aug 2023 17:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EFB614E3;
	Fri, 25 Aug 2023 17:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EFB614E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D46BF1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE219614E3
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE219614E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Btd_EjDOIQtv for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:18:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93E5460A66
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E5460A66
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64B9120005;
 Fri, 25 Aug 2023 17:18:52 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:18:51 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230825191851.41b3b155@windsurf>
In-Reply-To: <20230825101535.661486-1-peter@korsgaard.com>
References: <20230825101535.661486-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GzARNSExcFsV0YC/Iwl3y46cH0cM51POtnLN03pap4=;
 b=cJMbrJAXfz3fCDJbMhZ4h+Y+QsRnFeN3g5rgvvv3a/7ctXby80GzInFbt213wIwm5FMH7C
 Xt82lcrJZJfEWAwERe2R3Y33vJr8aQMqop9Cdmw5k3DxkMYOMNUWVlHGTlxDL1W+y32VbX
 zka0xA0SAsK8V+S3cRCxzN6s46PmW1TE+husBqA6gY4f3VfBVyPfzs4qpt3TYEw4V2dYrz
 h8X22HspilPAfEQ2U3dIB9aQEbHxEqqhRBq2TkIceKdj1Jbv4BP3FijsMYVLnlDnLmn3OD
 EjI9qNXX5K5noctjV0nEvr/y/BWYGLikUR/8ypX+MEOXt6Zl1iHi9mVZumOzNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cJMbrJAX
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.17
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Aug 2023 12:15:35 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Bugfix release, fixing a number of regressions in 2.0.16
> 
> From the changelog
> (https://github.com/eclipse/mosquitto/blob/master/ChangeLog.txt)
> 
> 2.0.17 - 2023-08-22
> ===================
> 
> Broker:
> - Fix `max_queued_messages 0` stopping clients from receiving messages.
>   Closes #2879.
> - Fix `max_inflight_messages` not being set correctly. Closes #2876.
> 
> Apps:
> - Fix `mosquitto_passwd -U` backup file creation. Closes #2873.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mosquitto/mosquitto.hash | 4 ++--
>  package/mosquitto/mosquitto.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
