Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CC0C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4275C40928;
	Tue,  2 Jan 2024 08:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4275C40928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kwo4sa0BIqsN; Tue,  2 Jan 2024 08:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8537B4092A;
	Tue,  2 Jan 2024 08:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8537B4092A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 277C01BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AC981279
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AC981279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UP5gmtZQzaw4 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:20 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F119881276
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F119881276
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B41140006;
 Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:55:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095517.19d17a87@windsurf>
In-Reply-To: <20240101222156.46284-1-fontaine.fabrice@gmail.com>
References: <20240101222156.46284-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tupmK6duFIvi2mUkXwNp4R1eUb6LYyUdS+/NzwHkwGw=;
 b=A1U5l/4iBvNhappf5pMQfQFbubcQccPbV7cP8JsBafsZFrcpIQZ/94sChYcVWxjW9W7rm1
 kMjOU8dDF6EjPU/nAw2oWpNqTqd1PG/EbVQK6cmo0p/Kn+BWCAu5SWAuSHnFnw4yo2MPQe
 6c8bcOBy8i0MXmFdFF/dwPrxAmoKJqPIoUyWLrp5GNk3InQqtRr0lclJ8bjRpRagryph9c
 PMHwqhxomWdQCtIXLVfBjJkyCYrO985q1cpXRlAOmwcNIy6nO2ppqTPBL+ujiQlpj6aL+n
 Vnc4x4GGGeVj/i4issFq8asZVaHhEXWVreeyeRUh0NbA+yD3U8X1sKhnLzTj6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A1U5l/4i
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.0.7
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jan 2024 23:21:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> https://github.com/google/highway/releases/tag/1.0.7
> https://github.com/google/highway/releases/tag/1.0.6
> https://github.com/google/highway/releases/tag/1.0.5
> https://github.com/google/highway/releases/tag/1.0.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |   2 -
>  ...Fix-compilation-for-armv7-with-gcc-8.patch |  46 -------
>  ...for-armv7-targets-with-vfp-v4-and-gc.patch | 118 ------------------
>  package/highway/highway.hash                  |   2 +-
>  package/highway/highway.mk                    |   2 +-
>  5 files changed, 2 insertions(+), 168 deletions(-)
>  delete mode 100644 package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
>  delete mode 100644 package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch

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
