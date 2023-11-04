Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF82C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C85A40164;
	Sat,  4 Nov 2023 18:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C85A40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyJp7xjpcVq8; Sat,  4 Nov 2023 18:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D09540223;
	Sat,  4 Nov 2023 18:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D09540223
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 160E91BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3B65418C1
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B65418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUvK5BBuD6eH for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:22:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B043417CA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B043417CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8711A1BF203;
 Sat,  4 Nov 2023 18:22:30 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:22:29 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231104192229.2f154b8a@windsurf>
In-Reply-To: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
References: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699122150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZHru40nxXTWG6E4QdFthtHQpudFcwplva9SSN3VTTE=;
 b=iKvrJCl1xa6sQcWFKjdzpkRxNzIO2GIoiWnq1eDYKKl8An0Lp+wMeWF4Kbug+KApX19ylM
 4Tnddhk5C9h1rIDp6mD1j3hpmArNullXVqUmJdCp00ghSpstVrVrdLy0isnXGGmXacdvM9
 fjmDaniz7A6MTsQ1DWqlpH5dOJ+ZZvKqu6gTDyhqH5K+0cSDTDGdZCUctrvVtsRU1R7aCV
 UJaenWwc1XE/qC0mN9TXDISp4BbPJxwCtbxaRwv3JGSgIeEu4bqVDEVHFvIuarWS5gX3UI
 UBIESIH88Kd/WP7vv1Dby9cmJW9fhdnPLOmFlJJgMvwMcvWSlLVYfZnVHz8xJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iKvrJCl1
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: select linux-pam if
 refpolicy upstream is selected
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

On Mon,  9 Oct 2023 16:34:40 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> linux-pam is required to login via OpenSSH if the upstream refpolicy for
> SELinux is enaabled, as linux-pam handles changing user contexts. If a
> user wants to make their own policy and use a refpolicy via git, we of course
> should let them do so. As such, only select linux-pam if the upstream version
> of refpolicy is selected.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/openssh/Config.in | 1 +
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
