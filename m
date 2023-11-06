Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA6AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FB342204;
	Mon,  6 Nov 2023 22:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FB342204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4ZR_Y1neVdX; Mon,  6 Nov 2023 22:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E21420A6;
	Mon,  6 Nov 2023 22:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E21420A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94FBC1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DCF78293D
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCF78293D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Py73xi1nxLI for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 692328234E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692328234E
Received: by mail.gandi.net (Postfix) with ESMTPSA id B086E60002;
 Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232425.25670683@windsurf>
In-Reply-To: <20231105060645.2850983-1-james.hilliard1@gmail.com>
References: <20231105060645.2850983-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eKZEGcfiL7Q1yKZHYGkKgXqQjYFUDCAJmSVlRBWVxfM=;
 b=K2zzYoFU2A+Og+9gh+KTt8/daKRhMYni606dGL3/VN0a6NoR1DSOXthOyp/+pjGYcGLpNO
 EAN7OuaJfbUFDUDzhPKJN4X99gWhE1o19PmRBg0XmD5ef9Sky5Sgtm8pGFJm5OcB74z6Vc
 BXYpWb9DQXc08iQlzx7smBz3XH/X1SdkI4gW+6DUtE9Yu/HVS+oBqnuMiVXrU1t003U/PD
 IPCdIwXKn5iMljS6k2LPZQsOTrRJI2iADjEGPnQwEdOwMim8wVBnQhnr8EsG1WRrnjTUbE
 KRZ5ttUMUL24Dh8JlB+bW3lTiItoZjV/kAbBcdL7mtca69e/i+yrYx/Vsygs3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K2zzYoFU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-babel: bump to
 version 4.0.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 00:06:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-pytz runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-babel/Config.in               | 1 +
>  package/python-flask-babel/python-flask-babel.hash | 9 ++++-----
>  package/python-flask-babel/python-flask-babel.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

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
