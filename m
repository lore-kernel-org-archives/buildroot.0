Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4ADC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A421410A3;
	Mon,  5 Feb 2024 15:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A421410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIelGEWGf6kE; Mon,  5 Feb 2024 15:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A8A402AD;
	Mon,  5 Feb 2024 15:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A8A402AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7CA1BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35420605A6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35420605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTvTI95V-Wo3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:13:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23951605A0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23951605A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 651D640006;
 Mon,  5 Feb 2024 15:13:41 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:13:40 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20240205161340.4d3befb2@windsurf>
In-Reply-To: <fa26b80b-7807-4248-ba4b-30771727f9cd@grenoble.cnrs.fr>
References: <fa26b80b-7807-4248-ba4b-30771727f9cd@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707146021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymwTM1cAm6isdBG4wsfbvxeq8/E7h12HBxIGzo0hLlE=;
 b=Swe0CMBquz0qn2ZHtuVDE0ktikpFWGadowWWYBujp3SVCo14uSk1+2yTatQiIM0jkNAwFX
 7JdGmFXsG2pIs6ykyM0CTjAAkbUkZchRjKVF3Ioji2JE459Tq5gsQnQEy/zY7wRrXCIHpr
 lQANP1+2tSks7n04xiEoThlriiLMqg8L40W8vtDMLPf7kkQ/Rt+M5f8P3XtW0i+7wAJcoY
 UBvtqbBYUufGAqSmw0vGk3SFpVfG9+RJOGhaCo82dyA6UV0hjip+8yyYjhtLWtGkYbo+3i
 2A7zH4k8z/y1gJgS57bk13t4/O+5Jz6gl+kcarq9z8rUpa5njlV5I3ipHP747A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Swe0CMBq
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.6.12
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jan 2024 12:49:01 +0100
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Also adjust the include path for the device tree. Since Linux 6.5-rc1
> (724ba67515 "ARM: dts: Move .dts files to vendor sub-directories"),
> sama5d31.dtsi lives in the microchip subdirectory.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 2 +-
>  configs/acmesystems_acqua_a5_256mb_defconfig      | 4 ++--
>  configs/acmesystems_acqua_a5_512mb_defconfig      | 4 ++--
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
