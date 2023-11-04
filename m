Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6999C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E89E8231F;
	Sat,  4 Nov 2023 14:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E89E8231F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMCvsXISwfvn; Sat,  4 Nov 2023 14:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EC182309;
	Sat,  4 Nov 2023 14:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EC182309
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57C1C1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D5182321
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D5182321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8svF-mSPXD1K for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:02:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A07D08231D
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A07D08231D
Received: by mail.gandi.net (Postfix) with ESMTPSA id E842760005;
 Sat,  4 Nov 2023 14:02:21 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:02:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231104150221.07670044@windsurf>
In-Reply-To: <20231015210548.36882-1-bernd@kuhls.net>
References: <20231015210548.36882-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699106542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0XBGoTg+W8hW+uTuDVPz0Jx8XVaB3/dYuYr1vWQfFc=;
 b=bOq+La33p4v559wLkblvfKVhN0m0BnkUO+PzaPin+7XDbuXSha5XfjpsZkeKO7Fu+3h6Jz
 15j4bjonh9k32NihOO6q3xiAdYDAWY2na7T12KX0xlmhMNPYth2hkoFVh8lJBigUXKx9xb
 JzOA0L3WMiSLa4iLOrTX302Zd7bbFfRV9fI9WhMSAjBCed3XfEo98BtEe98XwD0nRMckMv
 70C/j+lg27J9xYeb17nL0kt0L1I7AWOcDU6qw6OE3nE2otNqsAunK+9j/Y1d4xJyEoWL56
 4vvHQ7P0upUFTvdgvjsEChHll3HNyCh599zIFGrBo/A9LV2eiBY3dpyrq7DWrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bOq+La33
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: switch to git snapshot
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

On Sun, 15 Oct 2023 23:05:48 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream tarball does not include several header files leading to build
> errors with older kernels. For details see:
> https://patchwork.kernel.org/project/netdevbpf/patch/20231005163053.1800218-1-florian.fainelli@broadcom.com/
> 
> Switch _SITE to git snapshot and add _AUTORECONF = YES which needs
> host-pkgconf to fix subsequent configure error:
> 
> ./configure: line 4723: PKG_PROG_PKG_CONFIG: command not found
> 
> ./configure: line 5055: syntax error near unexpected token `MNL,'
> ./configure: line 5055: `    PKG_CHECK_MODULES(MNL, libmnl)'
> 
> Fixes:
> http://autobuild.buildroot.net/results/69e/69e01b7f370920630d132fc43a40104fa5b3959f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ethtool/ethtool.hash | 3 +--
>  package/ethtool/ethtool.mk   | 7 +++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
