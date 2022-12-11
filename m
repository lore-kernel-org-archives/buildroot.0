Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14880C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B251F812D7;
	Sun, 11 Dec 2022 10:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B251F812D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnEOgZAq7tf3; Sun, 11 Dec 2022 10:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E93AB812BE;
	Sun, 11 Dec 2022 10:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93AB812BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03E781BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2EFE605D8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EFE605D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqy9mJFsixTP for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:40:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63CF605A1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B63CF605A1
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:40:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8370C240003;
 Sun, 11 Dec 2022 10:40:54 +0000 (UTC)
Date: Sun, 11 Dec 2022 11:40:53 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211114053.781d5362@windsurf>
In-Reply-To: <20221209005629.1049654-1-christian@paral.in>
References: <20221209005629.1049654-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670755254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zR/3MxqhmevIvU5gagCFleVPhT4p51gC5zb29V6IU4=;
 b=D+2x5KX9sJLXg4PX38x5ZoI/oC4EEAZGbnXnYO2AMqjq2vrTZQC1W9MuXJwdRG7TDtUxqW
 wqLC2FqGibHlhDKdcdonYT0ISLTYc8AnijCGUaJOG6Uj4RklPOu4wvBjqGKvkIFw5I9IYY
 /DODd87dgoSNl6QIAGtclND+O0/OCedJVHetO2FVbVHP+F7jIkZdyb8XAidKiZfysiY0A7
 45jBgV7vs5n+EYNvpKSTcRXvm30MzNdzdJfZj1+p8jJkP4Nxd4mHfgu9RqjKYZogWOgtr+
 YLjihYmINHgQj1st+KKvXSJwvb6HGjHJXYX7Y8YrtszIur3cCIc+uYH3n30OpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D+2x5KX9
Subject: Re: [Buildroot] [PATCH 1/1] package/nerdctl: bump to version 1.0.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 16:56:29 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Nerdctl has reached version 1.0.0.
> 
> https://github.com/containerd/nerdctl/releases/tag/v1.0.0
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/nerdctl/nerdctl.hash | 2 +-
>  package/nerdctl/nerdctl.mk   | 2 +-
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
