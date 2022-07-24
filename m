Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36192C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80FE61156;
	Sun, 24 Jul 2022 13:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80FE61156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EKAKj0IEgrq; Sun, 24 Jul 2022 13:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36C960FDF;
	Sun, 24 Jul 2022 13:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36C960FDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE101BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF3BB402E0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3BB402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fk4pvJ96wPoT for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F3240C2D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83F3240C2D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:40:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 141EC60006;
 Sun, 24 Jul 2022 13:40:43 +0000 (UTC)
Date: Sun, 24 Jul 2022 15:40:42 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220724154042.24e2fb8e@windsurf>
In-Reply-To: <20220114024555.319448-1-festevam@gmail.com>
References: <20220114024555.319448-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658670044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWWy9HpZ+z9whHBia7dU1txLNhFfVee+rEUUl7avDpg=;
 b=QPjbU+Xws0Q7JrQSPUVYsyPmmwz9QgwqCvHivbxtpaaHOJfP5lMIfcyw/KDrPi4IUA7e2R
 e7wULEt6I92Kf8qMJpTzRZKlgs1INB5UaAJ2TwF/T1SFTeWbSM9LgV3th/oYzln4jLQH7i
 SzMLT9d8ryZJOtUXGHxZUwTAkhUKIQ7P1h5NbFDdD/t/H0MWSTjwGNwkqQTceA6o4BB4jT
 loZMTmZ85DPJZEUM7cgFf+X4lBgzq5iJYBBubhDuE+Z+WrucpI2PoM3xCUzLlRLeiRIxsA
 DsHsXGI2xGAtU6VYFpt2BS/XThJ73TRaQIXUHtpu15bYWSWffe8qllnAhTLH+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QPjbU+Xw
Subject: Re: [Buildroot] [PATCH v2] configs/imx8mmevk: new defconfig
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
Cc: heiko.thiery@gmail.com, frieder.schrempf@kontron.de,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabio,

On Thu, 13 Jan 2022 23:45:55 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Add support for imx8mmevk_defconfig that allows booting kernel, U-Boot and
> TFA from the upstream repositories.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Also use TF-A and U-Boot upstream versions.

You had some comments from Heiko on this patch, and you said you would
come back with a newer version, but unless I missed it, I couldn't find
a v3.

I'll now mark this v2 as Changes Requested in patchwork, so if you
don't submit a v3, we will most likely forget about this topic. But it
would be good to have a defconfig for the i.MX8MM EVK.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
