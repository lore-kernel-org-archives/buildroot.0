Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32228EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D31F64046A;
	Sat,  1 Jul 2023 20:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D31F64046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgF8-mBoPIE7; Sat,  1 Jul 2023 20:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2467E40A9C;
	Sat,  1 Jul 2023 20:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2467E40A9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECF091BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C653160AA4
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C653160AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2fP8cLVWRUV for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:44:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2B1F60767
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2B1F60767
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:44:47 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF96640003;
 Sat,  1 Jul 2023 20:44:45 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:44:45 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20230701224445.5d489e11@windsurf>
In-Reply-To: <20230627143401.594223-1-bisson.gary@gmail.com>
References: <20230627143401.594223-1-bisson.gary@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688244286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=graCpeO8EJVK4LP4+XZltIyYMUV1SsYQN/WT6FdsoXs=;
 b=Tu1ZplneXzzTDvMXNvUnc/sUu3uKiQg5/svLTvb+4UzVcguKdIpEa4v+gJ55wYdhcnjxgJ
 1VOs70KoZjEc9oKQTAxD14xHmIJdGOpcHWJ7jNEprRl0crOT0U1tbmwcsMPuPg0QgxWfQ2
 DqEwW8hIyRn5tNt6MW9JDng05qYMAObPHO9qq3VIt1bF7saK+Aj9YO4vT+GxV5fXTNZaMC
 p60gH83D2376t/3a5t1MCfZZQ3BNWvm7tqj2Drh38ZLXsaZIQJKqMDrpejkQrCz+DzOKPs
 WVrG/vmAodz7K4GRShdYYycpJpkMkmRTTYLAGPnD3ynYtHgG5tCExwIjH7k0ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tu1Zplne
Subject: Re: [Buildroot] [PATCH 0/2] configs/nitrogen*: fix u-boot build
 issues
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

On Tue, 27 Jun 2023 16:33:59 +0200
Gary Bisson <bisson.gary@gmail.com> wrote:

> Gary Bisson (2):
>   configs/nitrogen*: add missing openssl u-boot dependency
>   configs/nitrogen*: add missing pylibfdt u-boot dependency

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
