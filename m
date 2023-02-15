Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE1FC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0E24023B;
	Wed, 15 Feb 2023 21:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0E24023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbatXHcqnAPd; Wed, 15 Feb 2023 21:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAE8402B3;
	Wed, 15 Feb 2023 21:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAE8402B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 665EA1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D55C600CA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D55C600CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ljp1oNB4sLrc for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:38:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7D1607B0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A7D1607B0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:38:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 148311BF204;
 Wed, 15 Feb 2023 21:38:41 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:38:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230215223841.3c083b5f@windsurf>
In-Reply-To: <20230214110827.1281144-1-giulio.benetti@benettiengineering.com>
References: <20230214110827.1281144-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676497122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjpFfWbVgy+hBoDBwbYr6uVL3n9wYFPUWO0Miy1gDbM=;
 b=XZDreLXEh1MNrnS6j1LYe5niO14cJdf1GR5/dH8paQWbWfZPecXvGNvc7vcka+0V+QFjAg
 isQW5NimezoTVocsVoWM+h5y0vTofbOKDVpwnJcU9VMQKfPI1zDaZ39fB0Jn0xUGnxZm70
 7U/0m/i8P4n5X2c0qGB3uc6r4bArdvuD5M5W5qj9IuulA7q4M6N5RK4IkBYCLb1y8MNssL
 msm/vrzdu1icRzpmq0td2sVUKdNZWcZY2x1NjzKje6CPbrq7WTcmaLpOK6ja1isWsJGz1z
 hX7+zXPsQQmUgQl+XBs9SkT5ziEXY7lGfCPdfbiUtyoprdtFXcEzWTBgODyTcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XZDreLXE
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 2023-02-03 version to fix build failure with Linux 6.1
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

On Tue, 14 Feb 2023 12:08:27 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/e128298929fce31374687a566e50b00c150131b8/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
