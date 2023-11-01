Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CE5C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E577A84AFE;
	Wed,  1 Nov 2023 18:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E577A84AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLNG6dP6n9XZ; Wed,  1 Nov 2023 18:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4077A84CD9;
	Wed,  1 Nov 2023 18:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4077A84CD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839311BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F87704C2
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49F87704C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVK5OTm84sLr for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:05:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18DC6704AF
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18DC6704AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7A90FF80A;
 Wed,  1 Nov 2023 18:05:32 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:05:32 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231101190532.2bd5d5e4@windsurf>
In-Reply-To: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
References: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698861933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynoUrtX0rN+v7VukDdDxOAp/UQg00uqBQU4g7s5d9+0=;
 b=V7KLcFDCtXzKSeP0896jOdurd777lFzG29SZcMh8M3yN746NIhdH4dubrEMEeafcZRqihL
 xEThk2wAlFpYi+ftbLnnnbhQwkyB7uJtk3Oue+Z2+j1SwPr7+noiQzGbDDptFIw1/B815X
 dAEWclJSKjZEMQ7nqV1A1f5vcMzYShxzEurYZw/cucyGeWkEaab0/lictEb5X7t+YuEygv
 y23GXz7G8wDP0AjHwrfiHUVfynydZbZf8PDlkS8hQirNFNJ/wf/dsFy2L+fSmGjmpfkxgQ
 WTPw1iZY9S3+Lya1IKyYLlyRg0s9wgB+9NIvxF/HRqxcMLUumx2/znZyuuEp0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V7KLcFDC
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk-bin: bump OpenJDK17
 version to 17.0.8.1+1
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 Oct 2023 19:36:10 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .checkpackageignore                                           | 2 +-
>  package/openjdk-bin/openjdk-bin.hash                          | 4 ++--
>  package/openjdk-bin/openjdk-bin.mk                            | 2 +-
>  .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch       | 0
>  package/openjdk/openjdk.hash                                  | 2 +-
>  package/openjdk/openjdk.mk                                    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  rename package/openjdk/{17.0.8+7 => 17.0.8.1+1}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

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
