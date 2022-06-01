Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2011FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27D26101D;
	Wed,  1 Jun 2022 12:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BlkXYFpyMJS; Wed,  1 Jun 2022 12:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6F060D56;
	Wed,  1 Jun 2022 12:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DED11BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAB260D56
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDS7a7nOfaXN for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3374D60B06
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:44:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5C34F200004;
 Wed,  1 Jun 2022 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654087496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhC9tgZBt8KXmDRSC2Ft9oPcFayYh86Pwvg3iO5mUlo=;
 b=XN+k4J/W7exjH/FkYniQRl3MxRYIvU3ao0OtBeESNeA3kb8U8yXeAsOucXJwr48UEaooAC
 HEnQ1j6ZhiRTGKnuX3BkSJyUHYajFK8Z7Y+0Zi0vlFWNeRjK7L7xtxJCIDkcYemWhf4nSx
 L/MFBAFpneMDLNx0ht+bGG4lCz5+XTA2WIQBWwWxWd95SjejvpZWwPBw5d6dVdJWKK2xNU
 xXwSa9UPSLt5019LNmDfpZlZwQ/udWOsj2lpdY7MyTjj1edHKhlqnhbtJR0XG76MyoptQz
 j4cSX4FWlpkPU8JOSW2RAC6cyGdgxk1+8Rb7/trXmYG0dRLvS1wZNLeDE9oKeA==
Date: Wed, 1 Jun 2022 14:44:55 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220601144455.2161328a@windsurf>
In-Reply-To: <20220531185444.226429-1-grzegorz@blach.pl>
References: <20220531185444.226429-1-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/python-falcon: Bump to version
 3.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 31 May 2022 20:54:44 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

This patch is named PATCH 3/5, but we have not received 1/5, 2/5, 4/5
and 5/5. Could you clarify?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
