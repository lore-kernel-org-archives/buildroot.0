Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A6EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 10:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE4B981EE5;
	Mon, 21 Aug 2023 10:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4B981EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrruSFouI8By; Mon, 21 Aug 2023 10:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1072381F3A;
	Mon, 21 Aug 2023 10:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1072381F3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92F601BF308
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31F1081F3A
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F1081F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXDYFJhzNmQi for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 10:02:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A2B781F1D
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 10:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2B781F1D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A0ADC0013;
 Mon, 21 Aug 2023 10:02:07 +0000 (UTC)
Date: Mon, 21 Aug 2023 12:02:06 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230821120206.481e9465@windsurf>
In-Reply-To: <20230820113527.505124-1-ju.o@free.fr>
References: <20230820113527.505124-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692612127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4gno9zEUl7iwFd+S88hThNbZ7X1G9IfJ/+JY/B2H0s=;
 b=dOgVi4W/GbCNowOBlOqu801hj4A8yqPUwqX1C0EbMl71vmAoNtWpl649o3vtRhQNjvCvhg
 WKepmWHxby43dKMtKuhbnPEvWQv8L+lWUPhSMrErfJnKYg/OiS0mGerXBg3M6+eGVSphqo
 t957GzUO6XMISO51elpk7yScA33i7xoa+YxhMKLmZgeTCRVnAmewNUyrQpQmisfhWnNCEF
 7AM2WxDcB7uhj218AYu558HiUg04RV4pdGgWNLEwPKNiTKIeW2Jh7LX7E2Xn1auzjlHQCR
 qJvBaZBjlKJFCJrQqxx7CL12lymAHRfHYXDrRV2sNJ0s85BwWzHi141UvYmsWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dOgVi4W/
Subject: Re: [Buildroot] [PATCH next 1/1] package/perftest: bump to version
 23.07.0-0.27
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

On Sun, 20 Aug 2023 13:35:27 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/linux-rdma/perftest/releases/tag/23.07.0-0.27
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit c614a7d with commands:

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
