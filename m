Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2291C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672C583F28;
	Thu, 28 Apr 2022 21:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sWQPyixlcys; Thu, 28 Apr 2022 21:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E10283EDD;
	Thu, 28 Apr 2022 21:53:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B68B21BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B390360B5C
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOen7bVgSwiU for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:53:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A977960B4A
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:53:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CC5240002;
 Thu, 28 Apr 2022 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651182820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XSQrWk6qJFor6CiggfCD8pplvfItG8jpApcoqrzdJw=;
 b=p1nScpticLW/X7aUPmdjSP7iih9jXcDRT+R7jhS4UgYmvHG3eSqOEQnX7GQEtqdRMpJKqQ
 CK06Z0PaakpyI0pYY0p7oZrze/stRXi80gCRQiZPJY58HF/gWuquDUzrw61CrcVcRWjJ3/
 VTWk2MgYV4F9yn1NmV9HQJJwuYyxShA4xvbFuQW5oOK8H+umku9CKsZ9oeFGrUlb/3TcBV
 0gDy7KpUcZdc7uqRcQEKFfFC0GAMTlwCRbaMn4uuZIVQDXm0Ibiz7xswUevms0VQX4wls2
 wwjszrF+kWe7KqxU+bjak7g1UIwqpraehRFNLdkaNV992pPmcWWbiRGwFkisUg==
Date: Thu, 28 Apr 2022 23:53:39 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220428235339.51dedc2c@windsurf>
In-Reply-To: <20220427202524.53586-1-bernd.kuhls@t-online.de>
References: <20220427202524.53586-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 19.7.14-Matrix
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

On Wed, 27 Apr 2022 22:25:24 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
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
