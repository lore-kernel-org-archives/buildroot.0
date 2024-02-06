Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1434C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED0E61042;
	Tue,  6 Feb 2024 16:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ED0E61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtF0CgVJX6xm; Tue,  6 Feb 2024 16:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24B7612CE;
	Tue,  6 Feb 2024 16:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C24B7612CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C46091BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F33F41F5C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F33F41F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwYNeTkopr1o for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:38:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 908F441EF1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908F441EF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6B506000A;
 Tue,  6 Feb 2024 16:38:22 +0000 (UTC)
Date: Tue, 6 Feb 2024 17:38:22 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206173822.27cbeb7b@windsurf>
In-Reply-To: <20231219121508.1695768-7-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-7-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707237502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62b0YnMGxAIHWJu93wmL8zdaL+UfPcC/CWZ2NSrF1Q8=;
 b=o6Xt5JxqFkVE1T1uWcE1FOfKbRKvQ5nvkz/NBDmlmYaSz9wXqSyBi6uKZkucxNmOIIaSkX
 gvTvm2Jvr8Z/svOt6kkf5xJLkPokyun0TOKDOSTPPv0pDT5dAqvWRJV6ecdPr2/qII1djI
 nuMnxUJk9Gv89vy46i3XDcPC/aogSLmtrzHFlFw/ZKqDh2DvOpSMLjXoIJMBroEGYK7kN0
 ZJ3v9wPzLl1JfacMXJuqNPY4nBiA/0pEFCXJKLRTMt2v5nfc0lRQpNsP/YNagQqfMr2Iga
 PG8G5l4ct9rVP9JItfxXl9cc2Cb8Q/D8YCoNb/DUUSc9m1xyUgC1LHYNpg0G6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o6Xt5Jxq
Subject: Re: [Buildroot] [PATCH 6/7] configs/stm32mp157c_dk2_defconfig:
 update arm-trusted-firmware to lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:07 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> The assumption is that updates to the stable branch should not break anything,
> so we use the latest LTS rather than a specific version.
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  configs/stm32mp157c_dk2_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master after adjusting the changes in the defconfig file to
the changes we made to the option name, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
