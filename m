Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B50C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01781409E3;
	Wed,  1 Jun 2022 21:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHoKbmBo7SjJ; Wed,  1 Jun 2022 21:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365EA400E7;
	Wed,  1 Jun 2022 21:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0649B1BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 033D7415A7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eV43fy0DNsC for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E1E41575
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:42:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E52CA20003;
 Wed,  1 Jun 2022 21:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654119722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKq9rg3fQAmWUz8M64COL1cWcQ5MReuJwZcsapUpYOQ=;
 b=ITRmVBm9pYJ+RraRArOCdiTe6iOkCbau149tuNupAMsX4GdHYCcbGdcz5efvcG7YnFa7eC
 mKu4p6q3cS171kYb3STpopD98ebTqKlgGOoOeS6WoZuuHejjMIuq5hABAX74GRTt+N+3mN
 4Jz70D8Emc+FHLHg3u77GYGsWURbMHc9BgX5FLHVFLIEl1QvRFtJwfc4fnM7r0/NE2C0+n
 FHdScF4pmx1Y67Umwm+uM6xvNbegSsfXXM2pGL8Kue1u4faTRsCP6ZyDtbQVeFFocb2B+E
 2Z0blDDgyv5P0CXjKiUAK+y+dcni+RPBeDDX+BC85MG0zIvVWKGcAYFS67QSQg==
Date: Wed, 1 Jun 2022 23:42:01 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220601234201.7dbebbd8@windsurf>
In-Reply-To: <20220531105902.204022-3-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
 <20220531105902.204022-3-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/4] package/libtasn1: add build support
 for host
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 12:59:01 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> v2: no change

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
