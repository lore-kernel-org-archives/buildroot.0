Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41690C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12F481443;
	Tue,  7 Feb 2023 22:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12F481443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiZ-n-RLCR2P; Tue,  7 Feb 2023 22:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2937B8138C;
	Tue,  7 Feb 2023 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2937B8138C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 534011BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC4140B26
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC4140B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNrVgzVxAoAE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:13:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D28840612
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D28840612
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:13:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A5561C0003;
 Tue,  7 Feb 2023 22:13:43 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:13:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230207231342.3a0663c0@windsurf>
In-Reply-To: <20230114002552.1427592-1-giulio.benetti@benettiengineering.com>
References: <20230114002552.1427592-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675808024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYKTyZ7LmFw25tKZShfrNMdNXjK40fyLC0RH688zcuY=;
 b=g8FwczjrRB3I8IIqkI1LDBZzheIbnc7zmg29safgYmk1oslfPVI7ZClO7njN7qkea4H/Jm
 SpvnLd4zhWpnLa57cDozNDThU19/lwsKMQyV9b7WB5oLPmzuxduvoxVd9V3ZELT+FprQXJ
 G1Wx7AryI2kWW01r1PGWuAorxC35MvbKEQi8ATmhm/qeeSeICcAQRhqo56Wgm4v3sGBgoK
 oM0KuwPKvc+XHzGELWSA4O0VPCxRILw+8tA8X87WDjhcZnX+wFDMRnfxcabgSckQs/gHb/
 S1c8L7S0Y/seHFDkbx8Ls/xCIoM4L9Qqbz4XZ/o/7/+XBj2BI7SI0oqHVHPE5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g8Fwczjr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 rtl8821cu
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

On Sat, 14 Jan 2023 01:25:52 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

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
