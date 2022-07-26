Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF1CC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3936B8175C;
	Tue, 26 Jul 2022 20:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3936B8175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yfhm6Vv6eso6; Tue, 26 Jul 2022 20:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E2E81757;
	Tue, 26 Jul 2022 20:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E2E81757
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2B461BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74DD1408DD
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74DD1408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 138q5xhYggcY for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B50A40598
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B50A40598
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:07:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DD52200006;
 Tue, 26 Jul 2022 20:07:55 +0000 (UTC)
Date: Tue, 26 Jul 2022 22:07:55 +0200
To: Xuanhao Shi <x-shi@ti.com>
Message-ID: <20220726220755.238d4f48@windsurf>
In-Reply-To: <7c1e1a84-2a16-130c-a547-96c92f6d3fca@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-2-x-shi@ti.com>
 <20220726193735.735588e4@windsurf>
 <7c1e1a84-2a16-130c-a547-96c92f6d3fca@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658866076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apKWvLhttydhgVxB75t/CBuzOuTtEmUadIuUye4j4AI=;
 b=EaLjnZWeEmlNZyFE3LFhxyS5sz68i7Tr48ou4y3qBknZRhMQbPYDthGXHapaHhIToXuUWS
 wTuO0UC9uf/aF6bBPAZZu8vnnhQ36ET/Uwtcen6gDZzeeStD3bgYipzydUB5eIkKCb2mE+
 fUPj8kFCzAHsiE7TsfD8lJCERZPH/STRNX80RBOmbx0w2xNKJtHAN5DdP7zXrRJQ0ZAxMx
 0mtdHZ8kEDZzQhkJ47aWTYYKIxNza9BFx7ETdfGEfWaVuIjTWBU4SkknQH8qqYgTmv+DKB
 QTdOkQl+meg0PeFqQlTN/KRXj53E7Ea3iSnsqWxeRwTxr4j7shOZCfnoD8rMDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EaLjnZWe
Subject: Re: [Buildroot] [PATCH 1/4] package/arm-gnu-toolchain: add version
 selection
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Xuanhao Shi via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 26 Jul 2022 14:32:07 -0500
Xuanhao Shi <x-shi@ti.com> wrote:

> I have experienced bugs very similar to this while building with version 
> 11 for k3-image-gen:
> https://bugs.launchpad.net/gcc-arm-embedded/+bug/1969997
> I think the problem is that when the pre-packaged GCC was built, it 
> could be targeting a newer x86_64 architecture than the processor being 
> used, but I am not that sure.
> They are confirming that they will fix this in the next release:
> https://bugs.linaro.org/show_bug.cgi?id=5825#c19
> In the meantime, since this bug did not appear on version 10, I decided 
> to add the option to use version 10 at the moment.

Aah, thanks, that's a very good explanation. Then based on this, I
think we should not add a version choice, and simply revert back to the
10.x version in package/arm-gnu-toolchain.

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
