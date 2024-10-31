Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B1AD767F6
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D327060B1D;
	Thu, 31 Oct 2024 18:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0Pt93YwsnT3; Thu, 31 Oct 2024 18:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E26EB60AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E26EB60AFD;
	Thu, 31 Oct 2024 18:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 670AF494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43EC780D1F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suvZPoX-D_v2 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33C4F80CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C4F80CE9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C4F80CE9
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:22:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6A4D40002;
 Thu, 31 Oct 2024 18:22:34 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:22:33 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Marcus Hoffmann
 <marcus.hoffmann@othermo.de>, Sen Hastings <sen@hastings.org>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, Norbert Lange <nolange79@gmail.com>
Message-ID: <20241031192233.65bb353e@windsurf>
In-Reply-To: <20241030114547.555006-1-buildroot@bubu1.eu>
References: <20241030114547.555006-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr9G8H/y1lHPW81H7ga7rPEa7HUeSdcC3FVTFv8JETE=;
 b=VJ+4UjoPn/xIHTnTVGjAUO722yJwZxuI/nt5K7AALfN3cU06SF+/v3yhy/i6C1oDLjwb6T
 LrcegXqDOR4KQuqmDi3wrFNAMtWtw1LC0Cu0qFyGC93FoW0z/3enjTAC8UPi/Vedab0xap
 FMSNcyXjTsIa+kXxjWItSsEVgpFFrkYTQmDR8nZsGoUl1UwXhBUtx99UjCunZYYpTgeJf3
 xGTHmpkeEAMvA2XKvfhoTKw9nHzJOJ/wLWyKtp291qg2UvrbZ4x1HUa7MfOW/RrmTNAuPd
 7dc08XanPOmcghiIVFx1Mb3a8C7d8vDaolyCOonCSOGL+pnO5cOBa6eaUhmlkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VJ+4UjoP
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to 256.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Oct 2024 12:45:38 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> 
> Remove patch that was applied upstream.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  ...g_loop.h-fix-missing-LOOP_SET_BLOCK_.patch | 38 -------------------
>  package/systemd/systemd.hash                  |  2 +-
>  package/systemd/systemd.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch

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
