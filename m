Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE9C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC4B440BDA;
	Wed, 26 Jul 2023 21:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC4B440BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jbd8UHQ4Tzep; Wed, 26 Jul 2023 21:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0647640BD2;
	Wed, 26 Jul 2023 21:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0647640BD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 473D11BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121EE6120B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121EE6120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nCH_IkokdRv for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:26:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 969E660AC0
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 969E660AC0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70F651BF205;
 Wed, 26 Jul 2023 21:26:24 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:26:23 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230726232623.70bfda39@windsurf>
In-Reply-To: <20230608191840.3534303-1-bernd.kuhls@t-online.de>
References: <20230608191840.3534303-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690406784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sg8MoFAuYAtJlF7koz2cQlcZhgwH/j6mqqCOMaYwY+Y=;
 b=dOogamoNAyyhOfwrM4UvjWzsem5xOU6g/l/kdZ5Bzen80rKTXaxYxW5fy5AYeUzF6ZTYME
 SyeNmwH3NnZG4sEnupYva6v8W8McxImv+D0q7UT4CCL6mGlV0uN/Cmu8On6NzZfzDZgEVr
 UxAHYHFw3beSyfO7qs/dlM9nC/8JtMlOC1XXDGsc+pnV/hHQbvt20c7rP8+twOEIirTsgi
 DSKy7EARytDAEDCjnDzFA3ekczLz03v9GXqeVUoCObimPwuyD7VzkN9mg7pTiT4dJMllTf
 XpuBPJxR247LFjOyRRWmqQ1b3JCMBp+5iFXi06rUDbh0Z3QREWPxXqdTBR8RrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dOogamoN
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: enable intel-xe-kmd
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Jun 2023 21:18:40 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> ref:
> - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418

According to this link "It is functional enough to run Gnome, browser, OpenGL games, Vulkan games... but eventual crashes and bugs are expected at this time.
No work has been done so far in optimizing for the new driver.", so are
you sure it is a good idea to enable this new/experimental feature as
soon as BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS ? Doesn't that mean that
users who currently successfully use the existing Iris driver as-is
will see regression because we now enable Xe KMD?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
