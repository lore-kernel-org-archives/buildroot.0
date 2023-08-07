Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C622C04A6A
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 15:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 081DF40A1E;
	Mon,  7 Aug 2023 15:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 081DF40A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3C1y3gchHEYb; Mon,  7 Aug 2023 15:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59EE44031E;
	Mon,  7 Aug 2023 15:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EE44031E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3471BF276
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 15:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 390AB4015B
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 15:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390AB4015B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aX0nlJP8n7LY for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 15:37:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87B564024D
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B564024D
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07E040008;
 Mon,  7 Aug 2023 15:37:14 +0000 (UTC)
Date: Mon, 7 Aug 2023 17:37:14 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230807173714.3972bb24@windsurf>
In-Reply-To: <20230804172213.GR421096@scaer>
References: <20230804062307.227606-1-bernd@kuhls.net>
 <20230804143516.4df34cfe@windsurf> <20230804172213.GR421096@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691422635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVTcHHsjeFpniaO3CwW4VhWUIndmBV4csvno1wqj+mM=;
 b=mkf5OjJ1paAshtT0UKNVlJoZqGbNfWmY3lHqcQiNudAqtrzzTD7SfrtDXM1id6BCaahiYh
 I0cw00GTaYxU4TBe2EaqMO+27L4itvQ/6U0ky17Xsna+byGwq2n2ouBgLBpInOuEuG9I4+
 f+cm1JOYVLhKggyWGMRPy97weyAH4ATSprvZNT3vnFkSDqVR13azhixjWlAhb466hbWkxm
 sgoCW+aoDZ7OZp7a59aaL8eoR5J+y0NGEKO17Q+jo2WhcFD1mrHbCpm6fg3U5sQKEyGy8A
 AaZPQhaj7akd34rh3o09d9NloG+Oe6J7fADmiSEGvLG8/jhl94xipadmA5/KFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mkf5OjJ1
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: handle host-php as
 an extract dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 4 Aug 2023 19:22:13 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > What do you think?  
> 
> I agree that we do not want to introduce it in the generic infra for
> now, until we have at least a few packages that need it.

Agreed, but to me the issue was not so much that it was made generic
here: my concern was that the proposed solution was half generic, half
in the composer package.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
