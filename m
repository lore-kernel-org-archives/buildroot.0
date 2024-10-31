Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577CED767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10511605FC;
	Thu, 31 Oct 2024 17:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vamur8mg2Afm; Thu, 31 Oct 2024 17:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142F860A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142F860A99;
	Thu, 31 Oct 2024 17:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF755E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE3060A62
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cCkG7ENy5nu for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AA57605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA57605FC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AA57605FC
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:33:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22F9A240004;
 Thu, 31 Oct 2024 17:33:17 +0000 (UTC)
Date: Thu, 31 Oct 2024 18:33:16 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@163.com>, Andy Yan
 <andyshrk@gmail.com>
Message-ID: <20241031183316.23ca9174@windsurf>
In-Reply-To: <ZyO9bOAks5c_vMrV@smile.fi.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
 <20241026144748.09d6b892@windsurf>
 <Zx9EBoth4bf6QpQd@smile.fi.intel.com>
 <20241028092600.61ee97f7@windsurf>
 <ZyO9bOAks5c_vMrV@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730395999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCWkPzX3FYAGe0IPhjflU7J06NOe5WtlVCFxPRL8aFs=;
 b=ZZDurptK0fqSZbViFB7s92PE/LGe9+znhN0bqcCbt8jCdrLWJAoHK4kes11pMzA1ubiZwh
 oyHwxvBLeBWzx95b1Vuv5BvL9PwyjspyJbSUWS4WnwB351w6ZD424txuXMLx3S55JRMzum
 zDHG2J7RiJt030gslJofYO/qaoHCsVKTJeINGn/uNh9uFbZPTexL47rI9mxy45Aj4oO/H8
 2aaa0M1Pucu64nuWwRM4d2HKEQsqzYZMyl4yDCbed3XPYK3uJ2+cjDdFyjqMwdGK8ZiVFb
 E7xXyv065QeWkZPB4TKhV3zfg42K8l0tnpzTFg4s5Gtwl643yEa+3tMq2wpBPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZDurptK
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Oct 2024 19:25:00 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Seems Aaron already does a lot to improve this by moving to CMake. I asked him
> for a few changes in his PR and most likely we soon have the updated version in
> Buildroot that satisfies the requirements.

Clearly using a standardized build system (CMake, meson, etc.) will
definitely help in having a more "regular" behavior.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
