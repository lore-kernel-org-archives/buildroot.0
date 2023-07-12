Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3041FEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D209F41C5E;
	Wed, 12 Jul 2023 19:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D209F41C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLQpj_vDblGw; Wed, 12 Jul 2023 19:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C335B4007B;
	Wed, 12 Jul 2023 19:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C335B4007B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 501241BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17D4F403A5
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D4F403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GSg24LaGvV5 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:51:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E4964015A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E4964015A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:51:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 060071BF205;
 Wed, 12 Jul 2023 19:51:11 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:51:10 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230712215110.1ee1ba3b@windsurf>
In-Reply-To: <20230711224332.1799239-1-christian@aperture.us>
References: <20230711224332.1799239-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhyoU61PJamwWCMX3EmzWoGywrX5h2qygzvuK6rbahQ=;
 b=kAinseB3E9Pk5OHXeWWa6ylHqHPYsfQY+PqUlyqVoKW0BP3pnPe0u+8gAQgePb1tfHOZsa
 KihSZHXYzwAIKgPDDcSvrHYbj8a+mLX7ozJIasZqMHY4cJZN97olsCWHSKEuo0moz+AiYa
 t/8vllC3cD8MJJQUL+efawB9qsdoSLWnSfDbPej2gFAGTU84mZM1oxnEHqPKnBH07ZuY2K
 dt0DQ1WI3cDOBKnIXIVbvq99KOotAKcL0lyxcYOpBgwHrVL1mFFE54Gvj4ABZhJV1tp4zF
 rImD96LA9xN66Hm426Z+nHXZWqnmULKyqQ3j5V64z+GrX3/GWSghzfOdz88Mlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kAinseB3
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version
 to v24.0.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 15:43:31 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/moby/moby/releases/tag/v24.0.4
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
