Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D8EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457956104E;
	Tue, 18 Jul 2023 21:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457956104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9T7JF9yrvGk; Tue, 18 Jul 2023 21:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6CA61044;
	Tue, 18 Jul 2023 21:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B6CA61044
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA5981BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9059B81F75
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9059B81F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGuflvEx3Goa for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:06:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9150181F74
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9150181F74
 for <buildroot@busybox.net>; Tue, 18 Jul 2023 21:06:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9063C40006;
 Tue, 18 Jul 2023 21:06:28 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:06:26 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230718230626.6558812c@windsurf>
In-Reply-To: <20230717175547.781816-1-francois.perrad@gadz.org>
References: <20230717175547.781816-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689714389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iUYGXk/Mlv2BYX+W7tUveBMwV9dMduESUXmn9LfAgo=;
 b=CqGtoYdcCcSVEhlyWq8W+VAMHsYl3Ya2TAVYeuogpTr0/kUvGQoAzG7KIXeDWFwE87XKs0
 HSRXC6VIjytjJEjEf4CRKpVs1B9PqwBTnquPrbQTC5QEzCiOMrffijzrhrJsxhM5z9EKOs
 mP+fYLhEMtdmYueu+795iIAODLL6gBl3kclrvi7aH0eTxfsg8tPZE+okklhpL2GI0ovwZ+
 JstLLINnyphFYhefkh3no4CuyjhAQonmJ1naGSJuzMRo0rBGUVp7GL+5DKRuebbarWdxqL
 DfJFHkrpHeZ36m0MQTJvxB1h9FtYMbSMoUv76D1FIfn3tgvVKeLJfdwQxTq5sA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CqGtoYdc
Subject: Re: [Buildroot] [PATCH 1/3] package/lua-rotas: bump to version 0.2.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jul 2023 19:55:45 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> diff COPYRIGHT:
> -Copyright (C) 2018-2021 Francois Perrad.
> +Copyright (C) 2018-2023 Francois Perrad.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-rotas/lua-rotas.hash | 4 ++--
>  package/lua-rotas/lua-rotas.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
