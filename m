Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8FCC636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0059C81C40;
	Mon,  6 Feb 2023 21:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0059C81C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeKsdkfKjuXV; Mon,  6 Feb 2023 21:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B95281C20;
	Mon,  6 Feb 2023 21:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B95281C20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6351BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9A5E41755
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A5E41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2q7mZ1UBgfj for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:34:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5C24175A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE5C24175A
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:34:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DDAF560003;
 Mon,  6 Feb 2023 21:34:06 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:34:05 +0100
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20230206223405.67ec0a5a@windsurf>
In-Reply-To: <20220926185047.301080-1-dmrauh@posteo.de>
References: <20220926185047.301080-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675719247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojCj+tXbwbVj+qiBvRDz9ApkgCijYlMCk/ZRaVrzZGo=;
 b=jmrlQeHWOCt60T+IKlmEDcywNX6o9fpWIaYw4DhbeBBaypa8E2RS5yU6jVd7d0/jp7AP8v
 ItjqWOHCJ7mrxjjbUSUkh6gePFtzXGmm5sdjTQCtPoqtH3BEmNJX9XrKvB990Hke6iOhoJ
 FWk0MQ7RFRUYqwQzf3c9zP8qtt++9w4tVBKT4nzNFmtuyGnD8sWTke1+3KtaLOf/q/acq0
 b87cHS7jj1Tz6USEt0Zd6vXEqxJ40GZRizC4HNkKoc93Y86GhPFOnXAwcgAQ4R5pmn2YXP
 vpBER5fSCD7upAanYsH+/xL71YeJhMU/xrTih4LHbK6mckzb1FO4OoFOCX3xhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jmrlQeHW
Subject: Re: [Buildroot] [PATCH v2] package/gdal: bump version to 3.5.2
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

On Mon, 26 Sep 2022 18:50:47 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
> ---
> Changes v1 -> v2:
> - Fix commmit message

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
