Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E28C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F26B60C25;
	Tue, 27 Dec 2022 20:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F26B60C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJXU8bIpIQgN; Tue, 27 Dec 2022 20:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF7760C0C;
	Tue, 27 Dec 2022 20:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF7760C0C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 125271BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D903181412
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D903181412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WWN6T0HHuVG for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49BC81410
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A49BC81410
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:28:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77634100004;
 Tue, 27 Dec 2022 20:28:24 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:28:23 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221227212823.72ec5039@windsurf>
In-Reply-To: <20221225211355.6668-1-buildroot@heine.tech>
References: <20221225211355.6668-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672172904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXGHIHaIxUIzK8O9CxN7sXS0HdghHxCJt10TUH85ZFQ=;
 b=OSCZEukDIvmi00GbcfXJdJqvg7iRhuVErp+l32vasY+7oaSL+dLVjxRGBczkrJ816DvpaB
 ZiW1n6IFLd+p8la0rkaHO/Wgihbxwh7nxWfg/UT3QVJ20FZsgUO/eAi6AnFiArH/z6PJRl
 G9MglnY12E/44+jjoNPE9dSEZ1lZ/WSk9bI4vr8AziIGJBbTDw+LLQBJYCPMgb6eOIMGow
 k6qoV2xWOcRHHwpW1dgAxBJf5IFwXeTrzmg0QmVr+wl2HLJE/azoknMOlorQeRT56IDwvB
 Sun0RONaVNYgdUAWbErSCjb66dr+V7VRPwTKBVh4UnIqxdtXGIwg86vY+ttiJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OSCZEukD
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to more packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Dec 2022 22:13:54 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> ---
>  DEVELOPERS | 4 ++++
>  1 file changed, 4 insertions(+)

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
