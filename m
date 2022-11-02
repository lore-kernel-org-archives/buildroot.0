Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C49C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6F660881;
	Wed,  2 Nov 2022 20:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6F660881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjjE0qMqgiMF; Wed,  2 Nov 2022 20:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F5CF60B9D;
	Wed,  2 Nov 2022 20:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F5CF60B9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 902671BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 782EA8196A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782EA8196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNDxPQiTueOS for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6CA818AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6CA818AC
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:03:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF6C7E0005;
 Wed,  2 Nov 2022 20:03:14 +0000 (UTC)
Date: Wed, 2 Nov 2022 21:03:12 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221102210312.06b2faa8@windsurf>
In-Reply-To: <20221102114137.931851-1-buildroot@heine.tech>
References: <20221102114137.931851-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667419395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrXorUWPlYeNoh54/4IfKDnX1EWJBnHmDV01TdIMDnk=;
 b=mTegOFIQpcaNq+6w7XgwfU/K9Wt5oDyNVYFgMC8CprX9VrElrLSeyRxSAVg9XM595fwrw1
 fI4DofBvzClEyzxCEPD/CEBCu/2moE8+GLxbRqBwXMoT3/DUCvs17wJ6ywJk/oFJIy4QZt
 +i+0ScgQIAVOx25QSptLTUqnUVx8kLnALzbZ0rXH5m5jYqkHTYPpf4DbBG9yWmhPkZQOz9
 c0ZeYMfX1W5/fhGTvlSTCK/wMivfFyPEC4EEUXJ0O/mIJWZnv96iZis3giXmFFPVClkLjK
 XMRn/uJH2jcvDyOLFYg/V5ndbhT9sd/yScZo+9qZD1xxXJ1X/R9v5WPXDj4hYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mTegOFIQ
Subject: Re: [Buildroot] [PATCH] configs/pine64: Use mainline ATF
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Nov 2022 12:41:32 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> update ATF analog to pine64_sopine config.
> 
> Fixes:
>  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499154
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  configs/pine64_defconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

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
