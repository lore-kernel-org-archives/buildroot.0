Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C35681815;
	Sat,  4 Nov 2023 21:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C35681815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiUDkQ77YYiZ; Sat,  4 Nov 2023 21:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430DE80A54;
	Sat,  4 Nov 2023 21:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430DE80A54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 824901BF5A7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6120D80A54
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6120D80A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm1LqCRtcuOS for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:44:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BE73803BE
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE73803BE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 300F1C0002;
 Sat,  4 Nov 2023 21:44:04 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:44:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104224403.53afe8a2@windsurf>
In-Reply-To: <20231001153801.1123445-1-fontaine.fabrice@gmail.com>
References: <20231001153801.1123445-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699134244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvHabU6Rgey+yAmXIUJk/nn53XBZh9pGDfSEFSBoszc=;
 b=QEkaJtGgyCaab4B8eXwETIzVJpEwPPXeTwXpTK4eUuAN/V0YwdHzVlaq2cLbX4RSc4uBE3
 5BB5tR+U5bKCZ6Q6HftcUigkLu1hoqvdM/zKteQcZ2swJSZ1K7qaqbpv+CfG5UZfso9ZWc
 kPqy0yOG1P9K3pGjGJqgZ4YomntCbrw17ZHHuIBvR3xkqcFo+6GXH6zuSwPEWEdgJHcGD6
 65RZ9xqShdXRiKP42gSbF0pzfxUWRkAU03+LAD2scz+OG8D+Cv4q4RLP1xW8PkJ1SBwpoh
 LCpVD5fBUjxFLgOQBQPqMQtqa2xSOFksIVBBlrTEiZzeauyEKsZYK/zovUytzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QEkaJtGg
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-tacplus: bump to version
 1.7.0
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

Hello,

On Sun,  1 Oct 2023 17:38:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -LIBPAM_TACPLUS_VERSION = 1.6.1
> -LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))

[...]

> +LIBPAM_TACPLUS_SITE = https://github.com/kravietz/pam_tacplus/releases/download/v$(LIBPAM_TACPLUS_VERSION)

You also changed the upstream location (the old one redirects to the
new one), so I've explicitly mentioned this in the commit log. I've
also updated the URL of the project in the Config.in help text.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
