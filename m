Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F6DC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47FF60A65;
	Mon, 13 May 2024 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRzwrD_aqdFZ; Mon, 13 May 2024 19:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54F360A87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54F360A87;
	Mon, 13 May 2024 19:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB9391BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40DF8228C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EVrAIF2SorR for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD2368227C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2368227C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD2368227C
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:37:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6EE1C0002;
 Mon, 13 May 2024 19:37:34 +0000 (UTC)
Date: Mon, 13 May 2024 21:37:34 +0200
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20240513213734.38e900ba@windsurf>
In-Reply-To: <AS1P250MB06088D7843BC7CD2E15833E0A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088D7843BC7CD2E15833E0A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715629055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnzJUIvh4iVI//Kk4nVIs3kjbHNAK5CoHHyQloiKvLg=;
 b=eCNSSztDg6aKq7hZl3VwFvisbYm2xmjHML97co/TRgMVy28dlxd51waxwqewAEsjWzG0Cv
 IVtY0P3QCOBS1x6uo7x1exO4djGFWSlF2RAzAzJO9HaSFiy+HuakCHmf14zgX3z0JecPPa
 IqJtIWSo3fgehSq7AfeyM/nSrA+nyfT9lbz0PqipnH3GdZa6vK9grgVtmLLu2zltnLDqDe
 UqyQYd6qes/8/EDT1L4gXwKeyqf2zsox+Tl5YphUWAMfxiQAM6Wnue4fiROsjGgSfgNPlE
 OKHFWGIitM3EPKVeAJn04FPvZpuGW6L38srx8MTWvLwwll8gIT5vqcfp3fgtuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eCNSSztD
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: bump
 to version 1.11.0
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 12:42:52 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.news
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/network-manager-openvpn/network-manager-openvpn.hash | 4 ++--
>  package/network-manager-openvpn/network-manager-openvpn.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
