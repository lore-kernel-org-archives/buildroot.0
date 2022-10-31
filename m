Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923BBECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AF260D74;
	Mon, 31 Oct 2022 14:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2AF260D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqTklEBGIvsK; Mon, 31 Oct 2022 14:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B20760C22;
	Mon, 31 Oct 2022 14:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B20760C22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA2E1BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74BA60C22
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74BA60C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75cCp0W9FUlr for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:42:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F41360BDE
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F41360BDE
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:42:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EC0B7CE792
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:15:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8EC981C0007;
 Mon, 31 Oct 2022 14:14:37 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:14:36 +0100
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20221031151436.328c576c@windsurf>
In-Reply-To: <20221018110157.35331-1-paul@crapouillou.net>
References: <20221018110157.35331-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667225677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7F7vVNOt2zdL0GKJRnsFY7v0Ls/LmDqBs58xCNqSVQ=;
 b=cLcJ4EDxnZWEtY9BQeV2qKpJOXdtmfB2rhaA5ZUm75Ct6rw1SCQt4y5dWbo7Bty9Ht3/wJ
 dpbecTs/vWi1JLrbwP0ZFthdi/I+mPaNvAj99J9VrCM0iQV0wdGGtJlKtFACiMUvmFUnO5
 PcbLrVfdOQpvIVUHaRzP/s/25s8IFQfDMDx1Hvsd/2vL8yKTB2du2cKzGB8GyfoGkSwdck
 oQmIioOQmq2wR1s3OCvVOdb1LuZ0udgkMntd0rFBeuwHlK9FYVSGiZ1wr1/c27y4UDhW8D
 0VreSngu71OBkGgnChipYTTgfrvmK0vFL9e2/u3UqBs1mF1ABv+fTU85H3LGpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cLcJ4EDx
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: add patch to fix
 output_dir make dependency
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

On Tue, 18 Oct 2022 12:01:57 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Object file targets need to depend on the output_dir target.
> 
> Upstream commit:
> https://github.com/viveris/uMTP-Responder/commit/d84216a678edaca81c0899318231cdcca2100d38
> 
> Fixes:
> - http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d/
> - http://autobuild.buildroot.net/results/0331fb9cf2748b16440ef830d09452a9812f5217/
> - http://autobuild.buildroot.net/results/a1b1de9e2f764ce22f23d8a8ea88f7ddcf2969a9/
> - http://autobuild.buildroot.net/results/7c7dbe03d769dc5f155fc14102f6591855605640/
> - http://autobuild.buildroot.net/results/6cd90b7877520669d9ab9c9fadc9fa36912963b4/
> - http://autobuild.buildroot.net/results/186689fc9637ae1a8330d7e19057cd1b3c9a841c/
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0001-Fix-output_dir-make-dependency.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/umtprd/0001-Fix-output_dir-make-dependency.patch

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
