Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21882C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B041F417FF;
	Wed, 30 Aug 2023 21:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B041F417FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGaZRyIGEP7A; Wed, 30 Aug 2023 21:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08366417FD;
	Wed, 30 Aug 2023 21:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08366417FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9FB1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 482194169B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 482194169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb0df59cjHs3 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:04:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B33B3415E0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33B3415E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19797C0005;
 Wed, 30 Aug 2023 21:04:05 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:04:04 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230830230404.4e8bc96d@windsurf>
In-Reply-To: <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-3-dalang@gmx.at>
 <4c576534-7bd0-d1c4-61f3-a84821da3825@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693429449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=782K0TfxZYGLijNMce/3xvX4JJtGcuVB/kLrbsfBQeQ=;
 b=fViqoUI1u2rpgMF2TilRfjUVWwExit1rqjDY8ApsN/AaBWIju0ElWspxvkxaSqQ8on8QkB
 vFsfnmG38cQcqE4R0hi06f2EH9VvlLAwAFIZ2u3dHS8JehHYHXUna5lqx96HAyYnLSF1xI
 WCbjCFAvbz8IJLM22imUeSJDGgV/19bl/FzXSBzVz+Y/5As4Imoslid2GBzlVJsWyY+zKO
 rDSUALn8m+Ltwg/WOZiYdaFUnDIU2rsWgysk8Y7M3VOTiodSfyr+202zR8+AhFSaw8LKJK
 YltsrS9b5fUqK9pXgy78WNM5GohPz8Rl19pHM7wtxsen9Ed9foVzR+jIapS0tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fViqoUI1
Subject: Re: [Buildroot] [PATCH v3 3/8] support/scripts/pkg-stats: check all
 files for warnings
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
Cc: Daniel Lang <dalang@gmx.at>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 22:36:10 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Do other maintainers have the same opinion?

Agreed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
