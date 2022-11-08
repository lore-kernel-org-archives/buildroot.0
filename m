Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6C6C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 07:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E9F60C08;
	Tue,  8 Nov 2022 07:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7E9F60C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCPu3LcmGula; Tue,  8 Nov 2022 07:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FB360ACF;
	Tue,  8 Nov 2022 07:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FB360ACF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA911BF35E
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 665F960AE4
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 07:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665F960AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kw2wn9QTRimK for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 07:38:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C12460ACF
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C12460ACF
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 07:38:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C1D8240006;
 Tue,  8 Nov 2022 07:38:38 +0000 (UTC)
Date: Tue, 8 Nov 2022 08:38:37 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221108083837.67014205@windsurf>
In-Reply-To: <CAPi7W83h9UyvLgf834At4_wxUXq7xXyYxyDVXcz0=T_9caJRZw@mail.gmail.com>
References: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
 <20221107230925.73bb92d9@windsurf>
 <CAPi7W83h9UyvLgf834At4_wxUXq7xXyYxyDVXcz0=T_9caJRZw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667893118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5cr2v67tQDHyaqCnNxBx2HgebKuNuswI3zqhMkjY6c=;
 b=JlG/8vskagRGZTVOnscKDXb40WUyuvsDvaWhMLKX/rCkjHbfN+mX/9B7JFx8Q9tahEwBn6
 Vz06A74QNDh+rXQ2Qb4UOaXEaZrvxJdsHskvhTvEuDLLg52u/By78uq9n/SR440mu7R7Mx
 F2KPLVxU2F6OsMTuaLEo8XGTaL3M3qFuqZMH7bigMHdp5D223Hpl9tMwaekz7jDNb7J+Sl
 7l0K+H66CLFqw5A+rjcjkSYpa0z91R0jEifhj5QeYm0IO52PBEat/LnLCjndv3qjJREYX8
 QtqXxvOnTpOKGg2sngjsNjoNKUUzFfJI0ibNz4FMhAJtLtkbVg8qOEJK8KbIkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JlG/8vsk
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 7 Nov 2022 23:35:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Applied to master, thanks. However, aren't some of the other
> > linux-tools also affected by a similar issue (tmon, cpupower, etc.) ?
> 
> Nope, tmon was already fixed in commit
> 2cbcdbf0add46da55020eb56b5e4b974b44e958b.
> The other ones can't be built statically.

ACK, thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
