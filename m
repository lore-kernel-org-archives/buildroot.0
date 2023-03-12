Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37931C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 08:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD4060F91;
	Sun, 12 Mar 2023 08:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD4060F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2X4HG9VMMmTh; Sun, 12 Mar 2023 08:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35AAA60F85;
	Sun, 12 Mar 2023 08:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35AAA60F85
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 109F21BF3E9
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 08:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE0F581DF4
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 08:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE0F581DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAFsnZe2EywK for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 08:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC931819B4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC931819B4
 for <buildroot@busybox.net>; Sun, 12 Mar 2023 08:58:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C235240009;
 Sun, 12 Mar 2023 08:58:42 +0000 (UTC)
Date: Sun, 12 Mar 2023 09:58:41 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230312095841.486c5c84@windsurf>
In-Reply-To: <20230308085055.126427-1-francois.perrad@gadz.org>
References: <20230308085055.126427-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678611523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrOqPnO+UWDdT+VZpO3erdqu63ZE6qJRprKp8XpYOnA=;
 b=eRpWtcl51VcdzFSZmWkZ9h/KsjJMyzSStCJgU8fmp5pue4vxH3fnGbSCgjU1l6SBcz7Er6
 cdAwQX9lpTXhzbOgJiELXILbT4F/79LK7dT9o0DRIyvTpi6qLh2QwUtEdltshafQsWgIEc
 yA3NNlXAKENLUQnopSl45+aydT/bN7cA6bW/nlnK5JHEz6YHre79k2cfgAdBB9MEpDYPCG
 9/btksl4t86eD8GC9CM5XVR9Hs8OBke+J3lAOGJcMliMH2p7Z3ltAbscxIVB3BeVesSVFX
 FyIzJ7nzA9zOxWbNfJdhoU00ohZ5+r9Yw2LtNZ7exiUE+8AZ2Vvdd4qV0pTX4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eRpWtcl5
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.37
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

On Wed,  8 Mar 2023 09:50:55 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
