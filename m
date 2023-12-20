Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D394C46CCD
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC61E610A2;
	Wed, 20 Dec 2023 22:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC61E610A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zNDODz-Owhn; Wed, 20 Dec 2023 22:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4415061096;
	Wed, 20 Dec 2023 22:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4415061096
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 592B81BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309724372F
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309724372F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUkfu84ZkjgU for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:22:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAE9D40525
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE9D40525
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38555E0004;
 Wed, 20 Dec 2023 22:22:39 +0000 (UTC)
Date: Wed, 20 Dec 2023 23:22:38 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231220232238.4efd1100@windsurf>
In-Reply-To: <20231218194001.544887-5-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
 <20231218194001.544887-5-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703110959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW0SEzWQ0x21TTTew+G6g2nwAjbWs6yUso1+A/+iNUo=;
 b=U3DxEjKlXMQmOyoqcZXfbZqzP6MJHQqfw9x6H9H3P+gzgclCVucf8VQg2zZwiU4DlCoJif
 EGPnKras7tLz4QpfCdd+06kLTAZtC4qMwlzRogXQrYPtCp5psWPheDkF7AHQDqrqaR/QsR
 adzgH4mX1lNLN/GT2fVfN6m0YA6RaItGnGlzKORABjMH/ExWDnd8k+0CMDPl4u8RYsiXAK
 HrW7gVcPTNlZlNFkcJSEXCi8PoX0hb8vxJrS5wautIYxmZm06maYb5zORDTKpPdswu3AdA
 TzfRc/TJLbmtTq6rJ5vtFP+BvfwcjDOr8tK32B0cTrIw6eG8MWUbOOM7BxqL3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U3DxEjKl
Subject: Re: [Buildroot] [PATCH v2 05/14] package/fcft: new package
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

On Mon, 18 Dec 2023 12:39:50 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: Fix the sha256sum of 3.1.6.tar.gz

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
