Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8EBC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E4A610DB;
	Wed,  8 Feb 2023 11:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E4A610DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89tzBIVqpxw0; Wed,  8 Feb 2023 11:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3E9610C4;
	Wed,  8 Feb 2023 11:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3E9610C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37F01BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4B1813F3
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4B1813F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F72hcyxBV1fV for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4C4813D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4C4813D9
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:09:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8361F60004;
 Wed,  8 Feb 2023 11:09:27 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:09:26 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208120926.2e878f52@windsurf>
In-Reply-To: <20230207171721.2973997-6-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-6-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EKFRbLZ465vzDBMpP/eH1+hiMg9V86XVHn71JSSZxU=;
 b=Ae6dXahr8Du7R/f38r/ZqVoi3erHAmcAItHKRliSWaKxpnb0Z9h+Zi7qjaN/gX/4tY8jMc
 youxQ1dA30Bab+dXX/0f3bB4uXManLo/uy6ZwkfQl78mpTOS2KsCJFHEcMl1zN3qxOjccd
 TnGFcMDWX3eDESFQV0NKToYJRtDbiYbQLENg9MV/YhtVFL1LIMHOumqiIhXa8nTKZIFvDE
 cowmkllFNFsDHI5kXJnVB3avbVSmg3qrxnV7o0mNDcgMCr5Ha3NTiJW9DpA9q3b75RE2Dc
 HYGyhBA1JPnzADwSVhKalPgrYd9R44xLCRb4O1+lA40ZhpW4wHl+Jj5GruquQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ae6dXahr
Subject: Re: [Buildroot] [PATCH v6 05/13] package/qt6/qt6base: add support
 for widgets gtk backend
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:13 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

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
