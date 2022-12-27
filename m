Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3248C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722FD60C0C;
	Tue, 27 Dec 2022 20:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722FD60C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHI3n98xzXg6; Tue, 27 Dec 2022 20:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29C660B35;
	Tue, 27 Dec 2022 20:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29C660B35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB8D1BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D906D401ED
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D906D401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6GxvivcrSml for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772FA401DF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 772FA401DF
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:39:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98A9E40004;
 Tue, 27 Dec 2022 20:39:57 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:39:56 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221227213956.4e867eb6@windsurf>
In-Reply-To: <20221225215509.981425-1-bernd.kuhls@t-online.de>
References: <20221225215509.981425-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672173597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGqwOnQBKQbTuOIz7DHqavYizQqq1GmE4GzEIvIsgvI=;
 b=DxqUfXIIeUHJzFzrzvy7ZIngYO7wWbVzSKWqSRfZ7dpoXzoVpFzJrKsTTXnII5RBsodqwh
 /ekNvAATKiG1PSUCOodkKGtoG5P7r82E+ciZC9HA//R9EYUyI2JHT7swfjSzltQ0zU7X44
 4aUGnEBeOXdiWT18btsoUfnUdEmFujgLdf4TRSyrTaV1dLNsivjy+0+l1bAsqol0h6ZkKP
 0olC7UTju+Wiboa15Stxm6tPrAVpbMc4JVOX4PZ9QSjD/eQ6jGERsZijOnCarfRcXFBYLM
 saxtp8x/Aqn9tlk6JUsdfUpbmp55qhuKULayYwSS7HuVpXGXVi5aMuFzruR7vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DxqUfXII
Subject: Re: [Buildroot] [PATCH v2 1/1] package/stellarium: bump version to
 1.2
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

On Sun, 25 Dec 2022 22:55:09 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Add patch to fix build error.
> 
> Removed sha1 hash.
> 
> Add configure option to disable searching for qt6 as of now due to
> incomplete implementation of qt6 modules, like gui, in buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: updated patch after upstream comment

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
