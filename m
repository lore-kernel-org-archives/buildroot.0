Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4502C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D408246F;
	Mon, 15 Aug 2022 09:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D408246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjvuMrfKGxAf; Mon, 15 Aug 2022 09:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C9382425;
	Mon, 15 Aug 2022 09:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C9382425
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84C9C1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B55C409F7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B55C409F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8U8q-YHs5uru for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:36:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0929D409EB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0929D409EB
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:36:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1E1960002;
 Mon, 15 Aug 2022 09:36:44 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:36:43 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220815113643.06fef483@windsurf>
In-Reply-To: <2ba3394abf87c940fe036b2e18e1afc2a2d37ad0.1660320356.git.stefan@agner.ch>
References: <2ba3394abf87c940fe036b2e18e1afc2a2d37ad0.1660320356.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660556205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGlfpMAw7eihvSdb/oV+CT2zh4vnf7wryVQqMvBCT9k=;
 b=itz0hV8cUaEuB0I0LQp+T1nANp7K7bNIHl9CXNmZoggiyXaSC56inmJF59JTC9FyhDoO+1
 uj6FeB3HCizjNdcTKVJeLb/tnQkwzRIfm+iaRwE7OC2X+sVeiKaU5Cv/zURIXwHrtUyKv2
 I28tQdW0b296xEnKwXeVD+xRQ0k8DjbPdrfs+KaIMNliBY9yNmGgjfuJNqA1H9qPBRFwSF
 xvK3SLramoFhoWia/uKSj69G2Oids5SxDJJgPOvyaTwUjcNwDWegyLuR+zHuQidZ97IrXo
 mmf3vRKeZHmQjzetTKnWgtrdD20JvvKS16wCeYp7FWoGB7+OLWyallB5JtmVyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=itz0hV8c
Subject: Re: [Buildroot] [PATCH] package/docker-engine: use kernel modules
 for extra network drivers
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 18:07:01 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Docker network driver "overlay", "macvlan" and "ipvlan" are not used
> by default. Make them a module.
> 
> The main aim here is to get rid of the dummy0 network interface which
> is generated by the dummy driver by default. For consistency, make
> all kernel drivers required for Docker network drivers a module. Also
> add the currently missing CONFIG_BRIDGE_VLAN_FILTERING (mandatory
> for the Docker network driver "overlay").
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/docker-engine/docker-engine.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Based on the feedback from Yann and Arnout, I have marked this patch as
Changes Requested in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
