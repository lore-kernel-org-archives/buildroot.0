Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 07:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554AD41E40;
	Mon,  6 Nov 2023 07:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554AD41E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Y0FX5ZWVFbY; Mon,  6 Nov 2023 07:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AAB041E3C;
	Mon,  6 Nov 2023 07:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AAB041E3C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28DA51BF368
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 016BF41E3C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016BF41E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qlq0scXiUrTL for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 07:48:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF1641E35
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 07:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF1641E35
Received: by mail.gandi.net (Postfix) with ESMTPSA id B284F40002;
 Mon,  6 Nov 2023 07:48:51 +0000 (UTC)
Date: Mon, 6 Nov 2023 08:48:50 +0100
To: enki <enki@fsck.pl>
Message-ID: <20231106084850.1d0f01ce@windsurf>
In-Reply-To: <18ba1050ead.e92a523a459223.2327298946072754198@fsck.pl>
References: <18b80c0ce62.cb399136547843.6065948676717076989@fsck.pl>
 <20231030132841.3052429-1-enki@fsck.pl>
 <20231104143527.075bd95d@windsurf>
 <18ba1050ead.e92a523a459223.2327298946072754198@fsck.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699256932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jun0ojhvfpmr2rfj76cuysXrwyB6ryCHVvBl/qmdB7s=;
 b=SBvbqjx2VUzKyQ36JojWtUoElD5Hzf2gG8ziE09nnFd/KgsJ3kvYrhJejy4C/FrneUr2Cn
 7Pzt8JXuBMDMIxXDHAXWXX88YKnYR4K36HwYMROieuT3a4tdfQTg3bBEIjO/qQTT2ohV1Q
 9ulj5dlYqmkVgoKpb3ZiyBicyVScI+HeM20UZU5AHY2Y5+57bf8eZ3UT8+XHfU1vlapY6c
 ZOO52mo6cac6yH9reD7LLOGWetsec/Wf2hCeMv0mthSmjafmlZB11SQYBnzutAazhXUSfU
 idNI/+AxQBcZMROJWt+yZ22vLSsSXanO2Fv0w+mqFEn5WhaKIht0XKVZsSRYHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SBvbqjx2
Subject: Re: [Buildroot] [PATCH v3 1/1] package/spirv-tools: fix build issue
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 05 Nov 2023 20:45:45 +0100
enki <enki@fsck.pl> wrote:

> Right, the initial patch also added a dependency on the C++ compiler. I reworked it after Yann's reply to be applied on top of the 
> already applied C++17 requirement patch. I forgot to adjust the list of Fixed: builds. 
> This should now be ok only referencing BR2_STATIC_LIBS cases.

Thanks for the feedback. Could you send an updated patch, with an
improved/update commit log?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
