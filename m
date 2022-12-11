Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD98C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D3F060BCB;
	Sun, 11 Dec 2022 13:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3F060BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZFy4vjoSBA8; Sun, 11 Dec 2022 13:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667E560BC4;
	Sun, 11 Dec 2022 13:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667E560BC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF3591BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A4840106
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A4840106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id squWjqegU3MB for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6612940549
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6612940549
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 734911BF203;
 Sun, 11 Dec 2022 13:34:26 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:34:25 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211143425.5d1eb096@windsurf>
In-Reply-To: <20221208212215.4109073-1-christian@paral.in>
References: <20221208212215.4109073-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuQnr1VjYefHVHm8Ftip4rmUhU7fDa+Ivk6wgmoOpKI=;
 b=UrP4AHhj3RarXrymGsXkwzx0FNTs/h4FD672QfIBeRLVcuQuIOmT8DBLEz26CBadk/opHu
 4PDQmWEVc+HO/KdY3GCVI2qbWhfeDjgwGnD1eLM2OOt/VyhvAtzKQ1uP2foyi6QGBzYBX+
 /Iy0hNf8Ly5B3DuHyn36KpAM3fxenrfBbieInuJjX/n1/Ti9M/FO86OOGBezeZtpgXB+Pm
 VatHvgXXpSvQXuunuZIyx8gaiiJTgnGDED1jhht2U4nguTtMvSYHJH0K1RPW037Ysm65j2
 Ym/I8VldV6ObCgkF+kTLiYb0NFXttgUYhZwtrbZJYEvEV2OCmpmd8OvvRD7TyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UrP4AHhj
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 20.10.21
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

On Thu,  8 Dec 2022 13:22:14 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Partial mitigations for CVE-2022-39253 Git vulnerability and other fixes:
> 
> https://github.com/moby/moby/releases/tag/v20.10.21
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
