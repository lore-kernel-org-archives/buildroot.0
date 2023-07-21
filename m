Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735FBEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C6FC41864;
	Fri, 21 Jul 2023 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6FC41864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGysYD62G8SP; Fri, 21 Jul 2023 21:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE6040639;
	Fri, 21 Jul 2023 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE6040639
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3491BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A7ED408E1
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7ED408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5zhYqwCbSUJ for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:22:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A7534092B
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A7534092B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4946220003;
 Fri, 21 Jul 2023 21:22:04 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:22:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721232202.36f8ea9e@windsurf>
In-Reply-To: <20230721202355.1344466-1-bernd@kuhls.net>
References: <20230721202355.1344466-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689974524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIDMlLe/yQ+gn9GrL+GAd6MBkNA2VzMT0yNyYhRyvYk=;
 b=K1I+8UUHzUYh+dDMxyqSG1pFpnXAYgR0MdmMFOCPy6QCNXfXqxHJvv1OlH/mU5ZuWwrYdC
 a2QuUAREVF4IQC2Goa1clF2M0//w3eYcHwKWxPWZaxi/JXxVICNX9NAdtD01iMYEbkkiyS
 4U2Ezqq8cmIRMQ/Kvkb6PjcKaCby1U9Yo0cx/XYAQ2qW1NsjEsTfU2fQSA3423jEIVt+DH
 B+lgP1JuUZvmd4pmY9h8k+1EiPltaftysfGZZeWQSTVeBpzfDDy0a/GAMpB2BjaKjA+bMR
 isPCPiwDYt87retUFXOGVoHZuz9mySWSJxHtGnMs4AozQNhbOCkir5bZuJhwTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K1I+8UUH
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-zattoo: bump version
 to 20.3.13-Nexus
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

On Fri, 21 Jul 2023 22:23:54 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
