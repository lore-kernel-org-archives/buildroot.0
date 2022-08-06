Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D05C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 621B883E6E;
	Sat,  6 Aug 2022 21:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 621B883E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o249qlTGbQTD; Sat,  6 Aug 2022 21:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8874283E58;
	Sat,  6 Aug 2022 21:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8874283E58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD1121BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6EA5417D6
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6EA5417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHhRmtl7bXTl for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A720417D5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A720417D5
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:25:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F80B1BF204;
 Sat,  6 Aug 2022 21:25:52 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:25:51 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220806232551.5b06fd3d@windsurf>
In-Reply-To: <20220804054341.3107780-1-christian@paral.in>
References: <20220804054341.3107780-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659821153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMGpKy4I153PhbcGkFtYoCwh/baAUOZiAp33vbQqt8U=;
 b=UlV10kKV6ZdCc3qOFJdKpclW3dQ48WRBQHphkafo4TlRcuYLvLd+fBy5ZfpHaH1x1hhj2N
 xjHHeDYrSyIBx6cCkPivl0T6OCC5GE7lTji8mhgGfGpDFoL8Dm7+mhd+P9tu7cAfNKitZQ
 zk7ZyM6CjJnIMIh+4By8q7vCTjeWhK3Cqnl8x75pQCAFs3c0BgNpqyZFolZlAF0+8DR+zm
 4/Ewe9XfWiGyslcKiiDSJW4i+YKszL/Mkzyr6hp6u6B9ZY2jBsJ5rDfKYrzuGtHnMoiCR2
 cHVnsIffUhX2bmmziipH5BjiVjhHZe1/PVXRQh2rzmPW+nLu52OAsd+ZsSM2WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UlV10kKV
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-cli: bump to version
 20.10.17
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 22:43:40 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-cli/docker-cli.hash | 2 +-
>  package/docker-cli/docker-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
