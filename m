Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B821ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 212C7410D5;
	Fri, 28 Oct 2022 06:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212C7410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doit5Rne3UrQ; Fri, 28 Oct 2022 06:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 276C140164;
	Fri, 28 Oct 2022 06:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 276C140164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90D191BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6950160A92
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6950160A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxQOmC2Xq8VF for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:55:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C1D60A8D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66C1D60A8D
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:55:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DBE924000D;
 Fri, 28 Oct 2022 06:55:46 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:55:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028085545.4cb62b57@windsurf>
In-Reply-To: <20221022220808.191363-1-fontaine.fabrice@gmail.com>
References: <20221022220808.191363-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666940147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js/4/hBv33A934JUMQa+iY3yn4bP2DeIqeg/AwuEeUY=;
 b=BpoYhQyS6QJTux2TNcE6lpuJTtnUGda8ADV6B7RpYZknI4fFOwr+bpRMz662cESDZQHDXC
 zMZtRojuy60kIDL2o5qo4Y59LZ9nkRYIbNcYyFkf59IBi/3UEK4IxNp5eF9kz9PaPMoTp4
 Er/jQ0Z8Amd+OGMatx7xD/TVioMBgxvsYd+67JRiRuuIhRtS6FEkZC+hfwVZvnLENIomE5
 Hf+J0L5S0gsnL1lHlj+1ukmDNrNwfJUvgKpSW2dnYG3Fr64xWtG1W7LZoYwDW2jl935yoK
 Vhf7COkF79l4FxYprJSCHP+bTRpsG+CW9i+fnx+bQf7aRq/7WyqdvhX5Dt+i1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BpoYhQyS
Subject: Re: [Buildroot] [PATCH 1/2] package/lv2: bump to version 1.18.10
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Oct 2022 00:08:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash of COPYING (standard ISC text used since
>   https://github.com/lv2/lv2/commit/0030682770cdab7069c8c96e2fdf0e99f9b42b65)
> - meson must be used since
>   https://github.com/lv2/lv2/commit/d4a970f6962dda28133290194832b726b566ddab
> 
> https://github.com/lv2/lv2/blob/v1.18.10/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lv2/lv2.hash |  6 +++---
>  package/lv2/lv2.mk   | 13 ++++++-------
>  2 files changed, 9 insertions(+), 10 deletions(-)

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
