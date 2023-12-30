Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7EBC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 440EA60E3B;
	Sat, 30 Dec 2023 17:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440EA60E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByAplOqiaatU; Sat, 30 Dec 2023 17:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C9160AB0;
	Sat, 30 Dec 2023 17:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C9160AB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C109C1BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99EDE81E35
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EDE81E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3CIrz_PXoaa for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:51:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7000481BD6
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7000481BD6
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1117FF805;
 Sat, 30 Dec 2023 17:51:04 +0000 (UTC)
Date: Sat, 30 Dec 2023 18:51:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230185104.2160bea9@windsurf>
In-Reply-To: <20231230174727.945145-1-fontaine.fabrice@gmail.com>
References: <20231230174727.945145-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703958665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmwV7HyCLg/seRFT1S1pSOR18+1ZQX/uc5zUjoPrYto=;
 b=DzicAl5y8IuUyb1as27nhgXAKQ8GiSSupIHPgCRTiAthUVyKqNvje6AE2tQh6MmnHnir/L
 paJ/f/r7PQvL1xzHApLcDdINaLfoj6bDj3CAig93ZmEs7xcRYu/QKQwKet5cmC4hSN3L5h
 vhZIrRymNoAy4nw51baQZEvr3Xt29Tsva8LhD6Dj6aPl+Z9QcFz79RiypSX2abkb9Doevb
 6SqGylnU4qAnt+MhWkKefLwZhCysfqFVD3CvlZzw0+r5gxHi+eKDUXcE2bj4C4zGjSCBlt
 1NUwKNr5g16dYrnJpiFn5q3YbFvqc16Q3dMJs0eFzlsiWHZXw6vAFRq3y5kQFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DzicAl5y
Subject: Re: [Buildroot] [PATCH 1/1] package/libhttpserver: bump to version
 0.19.0
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 18:47:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> C++17 is mandatory since
> https://github.com/etr/libhttpserver/commit/17772843eac42bbd15e13659f96596d59e622872
> 
> https://github.com/etr/libhttpserver/releases/tag/0.19.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libhttpserver/Config.in          | 6 +++---
>  package/libhttpserver/libhttpserver.hash | 2 +-
>  package/libhttpserver/libhttpserver.mk   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
