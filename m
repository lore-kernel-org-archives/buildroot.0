Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4038BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DACB540FF2;
	Thu,  6 Oct 2022 19:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACB540FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gftMTbw6okhl; Thu,  6 Oct 2022 19:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ED2040A9C;
	Thu,  6 Oct 2022 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ED2040A9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7341BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE5740FCB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE5740FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMqdzUc64oMO for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:41:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5276403FF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5276403FF
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:41:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ECBF01BF206;
 Thu,  6 Oct 2022 19:41:14 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:41:14 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20221006214114.003cd90f@windsurf>
In-Reply-To: <20221005212150.1384370-1-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSISsH2/WGge6qhqaxICsA9MQfLfvUQN4gBH4sd4LTU=;
 b=HMBU+7mcVBIgpOAFouBNLO7Xp4mns8TJt9h1A5Wmmd6kk5w94Woy6aZh6cCjJz+GrFtwlf
 B2iUv6Vu0gWs8FPN9qf2usRK915xmJ4pYW7kGUvJJfILA+W1b27j0kacycyvNtatEFRkzI
 Q0CB/JkGYZejJ2Pc/mgtGiG064mwJN1JvFp2sAd7tWZ8mekWRn4eB+WpfpsRrjEl3B4vJ0
 5JPNy8UQ6zcAXPrYOFQgsZ+8rHLBg0dk4JycmW31PbBaJvgBehE2FFqFboVHtZNoG1vrvI
 IgZqEoICYBi4EDwBixdwCSwmPR2Ug/s9EShymBNXqKyesnTQccvmP6Ll/QLHLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HMBU+7mc
Subject: Re: [Buildroot] [PATCH 1/4] package/mender: bump version to 3.4.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 14:21:47 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Updated vendor/github.com/mendersoftware/mender-artifact/LICENSE hash due to a
> year change.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/mender/mender.hash | 6 +++---
>  package/mender/mender.mk   | 2 +-
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
