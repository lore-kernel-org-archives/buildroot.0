Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D606ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D68A86106C;
	Wed, 21 Sep 2022 20:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D68A86106C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMQpExKKkX9Y; Wed, 21 Sep 2022 20:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1514161069;
	Wed, 21 Sep 2022 20:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1514161069
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10DF01BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15D0D6102D
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D0D6102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9T6qYKxf_io for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00D736106C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00D736106C
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61AA6C0004;
 Wed, 21 Sep 2022 20:09:44 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:42 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220921220942.01521a4e@windsurf>
In-Reply-To: <20220917215615.1351902-1-james.hilliard1@gmail.com>
References: <20220917215615.1351902-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7nOtpp5jrXIKmg3e42q1p2S5IYGiNKLLdNZjdoWmWE=;
 b=YfjI+KtPh/7jrOwboaXc8dSjhGDQzaCeBomj1fsYexFkWoxdCxHYe+ylrpZobs4l0YhJsx
 xOw9k/C6WpIdhHx1uESvPRPIbZ6RoMQ5rtcRpzIN4ScAMRRlSq6IA7q4ZTTrivU3uYAW8/
 aHGU+e49treCHRCWB17dqd7nrBEVkScbza9YvJgTTjYwdgbzvxP1qfsqYDtv9GhvpJGECH
 Ap2v+NMRi8/r73u49y+EvvvcPrL46HZHB1CUFY2YEeVrESXz8flBGreQEe2GWyeR6K+xc3
 o5DtWksBrPXOFLmjiI/E/rwZh1IDdrswBjFR45KPqnmgvW4bvLHidiSoKjb/Ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YfjI+KtP
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to
 version 1.26
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 15:56:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wayland-protocols/wayland-protocols.hash | 8 ++++----
>  package/wayland-protocols/wayland-protocols.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
