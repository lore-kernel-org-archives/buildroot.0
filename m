Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AC9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E75A2410A5;
	Wed,  9 Feb 2022 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHPTr8MFhKI4; Wed,  9 Feb 2022 20:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32495409E3;
	Wed,  9 Feb 2022 20:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55F751BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446CA60B6E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evHy-xAhcJRf for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B312560808
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:03:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A5B7200005;
 Wed,  9 Feb 2022 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644437024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GXSbwAx2e+SEvd4aK/lAtIJC3fR4k44QElXps6Uj4E=;
 b=nyQRIz1Po1yI+eInu9/2f2CBye79VKP3pp6mNg6STLffOKkXu/78SUfGuowobx9YTkV9fB
 Es98zvmDX4wnYXXncE6E2Xoj7lpzy5eFV+DczeSxjNQUf46LzxYgbN0K1MyVxHh9pf1Zm0
 MlansiTbsP2NpjqV48wOYDvIV1PVapawW9aTeY0h7BjmZiJOWLgC6dSFv08BbQbYWt135N
 Gz2d/KgkykY+K/tEOfcXK768lS0xy5G1ycKdadydV/6jVgXRfSaH1kvaFZD7tAuHLO7XoI
 V1HTeuP4eKbbdXtUjspYvhuAF0kDRX7RhT8w3QuhHRwAIGvLFMOifc5uiu1RVg==
Date: Wed, 9 Feb 2022 21:03:42 +0100
To: <yann.morin@orange.com>
Message-ID: <20220209210342.604b2661@windsurf>
In-Reply-To: <25580_1644422947_6203E723_25580_17_1_a1a52ce7fd9920435f8cc9e82513d62f9badd738.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
 <25580_1644422947_6203E723_25580_17_1_a1a52ce7fd9920435f8cc9e82513d62f9badd738.1644422916.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5 v2] package/pkg-golang: host-go is also
 a build dependency
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Feb 2022 17:08:47 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, host-go is a download dependency, because we need go for the
> vendoring during the downlaod step.
> 
> However, when using a package in override-srcdir, there is no download
> step, so host-go is not pulled in as a dependency, which will break the
> build of a single package from scratch.
> 
> We fix that by adding host-go as a standard dependency too.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Christian Stewart <christian@paral.in>
> Cc: Anisse Astier <anisse@astier.eu>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
