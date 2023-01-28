Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D0AC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5461410BE;
	Sat, 28 Jan 2023 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5461410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxSDCvVvAVRG; Sat, 28 Jan 2023 21:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B682A408F2;
	Sat, 28 Jan 2023 21:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B682A408F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1600C1BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D43E941744
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43E941744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIwLonjSyG3I for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1E641729
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1E641729
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:45:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 93F78100002;
 Sat, 28 Jan 2023 21:45:39 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:45:38 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230128224538.12c5bd5a@windsurf>
In-Reply-To: <20230122115640.24776-1-bernd.kuhls@t-online.de>
References: <20230122115640.24776-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfcZYK66J1cNKdc/pDcyiQFSCkaqamQFvw4ZTNpFEJc=;
 b=Z6eRySN8kXqoTHiSBeKQFOEgb/lezrTDoBQ2zZNCNmtoz4g/9pWrbTVS75QDg+AdZdhs+Z
 8Mgb/r5sa2oIKvHwc+jPuHyQiyv135k1VEz0BTqqG3hq8eUsgi44HhZsk2BEPln/mUnRsY
 Jy2cuEqsQrlYbIOhM67ti3g0omNORbv1YoqSAE95c1WsiKxlUvOr87hQ2LI/cIGxuTbXTP
 aI8EAnpKMBIn564U3ghQFOJh0CcPBe1B+K7rJfaZPVmpGdYujBMw7QHdLYRzMX3DGduP9m
 y2iSy9JTatsCPqAUse4Xu+hD2RugT3/eFJdJeYKk09MmyUO36Pb5QyIU7qpOzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z6eRySN8
Subject: Re: [Buildroot] [PATCH 1/6] package/kodi-pvr-vuplus: bump version
 to 19.0.1-Matrix
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

On Sun, 22 Jan 2023 12:56:35 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series of 6 patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
