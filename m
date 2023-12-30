Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E0BC4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB9A60F78;
	Sat, 30 Dec 2023 18:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB9A60F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xe3T5N9DxXDT; Sat, 30 Dec 2023 18:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D7060C14;
	Sat, 30 Dec 2023 18:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D7060C14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 789161BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513C8414C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513C8414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Asui4wnnXs71 for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F03854149D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03854149D
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECCE920005;
 Sat, 30 Dec 2023 18:00:58 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:00:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190058.51156a64@windsurf>
In-Reply-To: <20231230151650.234413-1-fontaine.fabrice@gmail.com>
References: <20231230151650.234413-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8hW6+5g10m4W9Fr89MoEHQSgI0AORzUT+9xByup4k8=;
 b=HVn8vkD3O6Jicz46jpMK11rjcSL390pDvhr+nuy8VTzGDh8Paj0oyiCd5S7RDnSL0AmupC
 +/BmM9gtkOi9mA2YWU6tFEO6rtNzMTQD92GueTZqnbB986CWEf7wMb5BqPxrve/v9E4xZY
 fim8vut5rWLWboCYiswP3XX5GVaDfljFKH1TwQ0x5lmRgoHQfSifQmqbswQYri1/j8lg1u
 SRfRU9K2ehcqVuEJ7P1Mu8wcGaLZDExKQXor0mwnbpmVtwq2873gCKNhvq+og9U9oF8AoU
 Cq5Mh2hbEO7NN0AeH0l3OeikDDNCGLh3AQNFtmQJFI4fg8TzeMh+f44HTP4PlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HVn8vkD3
Subject: Re: [Buildroot] [PATCH 1/1] package/atest: bump to latest commit
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 16:16:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  .../0001-seq.h-fix-build-with-gcc-10.patch    | 40 -------------------
>  package/atest/atest.hash                      |  2 +-
>  package/atest/atest.mk                        |  2 +-
>  4 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/atest/0001-seq.h-fix-build-with-gcc-10.patch

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
