Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24106C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCD3D4370E;
	Fri,  5 Jan 2024 12:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD3D4370E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8emNu0C8la6E; Fri,  5 Jan 2024 12:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA7CA43703;
	Fri,  5 Jan 2024 12:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7CA43703
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4745F1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA4061497
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA4061497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZ08SimPHqdl for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:49:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F8D0610AE
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8D0610AE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6095160005;
 Fri,  5 Jan 2024 12:49:37 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:49:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105134934.357312f2@windsurf>
In-Reply-To: <20240103071115.6131-1-bernd@kuhls.net>
References: <20240103071115.6131-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWdNb9N/vzGpGCTRgLCzOzyzWk6xWzYBiZdXEIvt2JU=;
 b=DArf3oWUZXDkPEoEBSZwSGw7MsdgjnY+uBf2tMl8sBM/+vMwdubVxEIIcGj5Ndrgy2XP4Z
 qcu0msozWn3bgYGAI/KXMoRMh1A3t0jftHlAScRs9VCrWVL+3r0F1MdGBMRB+OF/BECQvF
 D9kWhhPO33w6mcf5axWD8EE4v5swnzfg/W245oR8kk7xCMpLBwILB1GIrHfSwahRFtPL0w
 nrnLjK7X/fwPWHSWWbDnrJ7/dbEb9iH/MiIPx+4KsXjoeUttyQT+Koo5IRbxppkhgnvZgS
 9Y4++qoPHTwa/VS4j4a58rHGlLwi9bQenxqmXCMEor8DYfrp3ELGZO9wVk2ytQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DArf3oWU
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.28.1
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

On Wed,  3 Jan 2024 08:11:15 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://cmake.org/cmake/help/v3.28/release/3.28.html
> 
> Release notes:
> https://www.kitware.com/cmake-3-28-0-available-for-download/
> https://www.kitware.com/cmake-3-28-1-available-for-download/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
