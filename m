Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0850BC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05CD400DD;
	Sat, 22 Jun 2024 17:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRpEB08tefWk; Sat, 22 Jun 2024 17:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9868A4056B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9868A4056B;
	Sat, 22 Jun 2024 17:50:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D97D1BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 094B781EFA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4-AO1K8ZRry for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1179081EE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1179081EE5
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1179081EE5
 for <buildroot@busybox.net>; Sat, 22 Jun 2024 17:50:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 78B64C0C48
 for <buildroot@busybox.net>; Sat, 22 Jun 2024 17:44:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A667160004;
 Sat, 22 Jun 2024 17:44:00 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:44:00 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240622194400.604cdd27@windsurf>
In-Reply-To: <20240612170604.1931016-1-francois.perrad@gadz.org>
References: <20240612170604.1931016-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719078241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ip4e/uobrMkCcWHINceH9IRhhDMYTv5+R+2MWpzy/+8=;
 b=ez3hUOLGf+Qu1EdoAlpP8TO6uH9y9f/QGLTr/GC2UqAPt1GqoorSGLn/Rj1TMNI5IM5xin
 /IsbO7mIgjoY2pqa0h45y2J2NR0eS/J3lnAlkBvBDU0GbloOLyJ3peU2SY81MzTWxJY1VC
 6vz+I+5fDpeF+sHlCGgAF1w/3tvC8r9tNWtB1ZI/S9hDk7WjEiUxD9DYxbAEVyWybBMI5G
 J9nrnEDjqn/w766jGAIWvEPY9Rl0it5RELP0utBmHsVguikQS1roFE/O1UeWOSHpWEKRM9
 nvVVREiJvoPkcYfetaowhZUHilJTHzEo/dakMBR/YaKeJsFTeWy8t2Z4tt6UlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ez3hUOLG
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.42
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

On Wed, 12 Jun 2024 19:06:03 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
