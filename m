Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC7C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863AD60DA0;
	Thu, 24 Nov 2022 21:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863AD60DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6UkPvlo48jl; Thu, 24 Nov 2022 21:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BEA60B3B;
	Thu, 24 Nov 2022 21:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BEA60B3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 810451BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF2982235
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF2982235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9kkzjEwd28s for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:16:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21068222F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D21068222F
 for <buildroot@busybox.net>; Thu, 24 Nov 2022 21:16:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9F83FF803;
 Thu, 24 Nov 2022 21:16:19 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:16:18 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221124221618.34e4cfa4@windsurf>
In-Reply-To: <0930eb42f01f1754f95f7382fd59b359e3d8fa77.1669311917.git.baruch@tkos.co.il>
References: <0930eb42f01f1754f95f7382fd59b359e3d8fa77.1669311917.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669324580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SamakdLQvFBHMEwj3GfPCLJ+jpVrTIcgHRMCrHJHJMQ=;
 b=Etb6QEPbWIKgrratzVowUsKkfomKJ4/7BU/zBBwYUq/RH1A9713cyoSuNWay7+M5X/Zr3j
 5aNVzLZdSJb6pNN2TACgFzKqvKHF7W8eCD62GcYT22YSoooFq5qey/rrTPbybl5N5gObZ7
 ihw5NR4QkHc623ACBOTu7Qs9yDLGb8rKdAzROxGbMKrXKoTerz/kl4PujI0ov5y0NrE0aO
 cQWq1rUKdrRQnTzULmsofPhTKCv6o95WyIwt8bWksypyQaOG0fP+thADg6z34/qScQDhfO
 X8FoLHYRikwSuc1g+ZZL8LFV5TlAFeG60xWDRLzn/cevLMTwscD8Kl7fK09/rA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Etb6QEPb
Subject: Re: [Buildroot] [PATCH] package/dropbear: bump to version 2022.83
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Nov 2022 19:45:17 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> DROPBEAR_DSS is now disabled by default. Enable only when
> BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 8 ++------
>  2 files changed, 3 insertions(+), 7 deletions(-)

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
