Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A0C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B5A610BE;
	Thu,  6 Oct 2022 19:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B5A610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_FRntaciwD8; Thu,  6 Oct 2022 19:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48ED6610C6;
	Thu,  6 Oct 2022 19:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48ED6610C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 601EA1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A9461037
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A9461037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kl2KVRAivjpW for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F423460F6F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F423460F6F
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0288740004;
 Thu,  6 Oct 2022 19:04:33 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:04:33 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221006210433.51ec7a62@windsurf>
In-Reply-To: <20221003151207.3250577-1-angelo@amarulasolutions.com>
References: <20221003151207.3250577-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665083074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgN7x7VEWbz+wGU3GyToGxzVbGLDA0vGpGzYF5r/LsI=;
 b=mNl1VALBn/GIrIJ13mzHZopRMU99j2G8fLEosi8fQ9EBQ83zWNVFQYefcXB650SXIn6x4/
 05xa94Blcb6Y+t9Tfd944QvUDQUGc01n28DLnml9BM+sCgypKjcA+3Gr576HUCWJ0ND+P9
 ThG1ifV4zgELtBtcEUJeHaiwduxpM6ooFNpDZrX8McP9I3CBGRkToxp/rdnFnYQUy6eeVx
 4vIfMHMwli5bIF5+U+YfHqpKAOJRpCl+xPCEpfFvZY6VWKDdOf1adJ1yri+0nRBbP5dJ6B
 Tn5Hj4eAUh9t4B5AUpPuhiSAasrK3Did65zG0lMXq2DVNbJlufIEMUxUfRLwFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mNl1VALB
Subject: Re: [Buildroot] [PATCH] package/python-pydal: bump to version
 20220814.1
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

On Mon,  3 Oct 2022 17:12:07 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-pydal/python-pydal.hash | 2 +-
>  package/python-pydal/python-pydal.mk   | 2 +-
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
