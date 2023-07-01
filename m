Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BA6EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98EE404AF;
	Sat,  1 Jul 2023 20:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98EE404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rLJ1Fijo-Mo; Sat,  1 Jul 2023 20:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3916403BF;
	Sat,  1 Jul 2023 20:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3916403BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348851BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0054681FF8
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0054681FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ajKG3IRlOwC for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:08:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4B081DEF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE4B081DEF
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:08:23 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABCC060004;
 Sat,  1 Jul 2023 20:07:40 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:07:39 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20230701220739.18af2c24@windsurf>
In-Reply-To: <20230619195637.595586-1-festevam@gmail.com>
References: <20230619195637.595586-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688242101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dIATo36h69PYp8KAPPedvrLF5qrXP7RYsxB55g0NZA=;
 b=ONCpATRNkiCvPb9kSTaHOaq+nSsyh/wzZtj3vAPwupExb/hDRf/kG3moyXxzDH2Js3cKpu
 CXjURjYZyiJfLljM3+J8nBlXEhLPiYcJzcCkN7lI1N7hxqSHcRwkUhSUI21PFyhoVUFQlt
 QW1Z3VBgxJXMbD/2Fm/sfseV/bpPMY+rx5THeDES7jxl3Xq4crou4FrXuSuVa+Sg7lxcZ6
 FFnOKPS3fHWpA9/TG//MILyMBsIn1Phbglv2xRTMgCzK8ujkAoBNvJ2sJZZDxS7x1nUD5c
 LHKrMFwX3DAxBuf/3Sjgm4IlWqbt0B1Dg3m/76DUemAGsuAVOfugWjoCBWGk/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ONCpATRN
Subject: Re: [Buildroot] [PATCH] package/crucible: bump to version 2023.04.12
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Jun 2023 16:56:37 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump to version 2023.04.12.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/crucible/crucible.hash | 2 +-
>  package/crucible/crucible.mk   | 2 +-
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
