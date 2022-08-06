Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D9AC25B0C
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C5E83E54;
	Sat,  6 Aug 2022 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C5E83E54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jh6i0lKtrJHh; Sat,  6 Aug 2022 21:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B20283E4B;
	Sat,  6 Aug 2022 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B20283E4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E07381BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6885608D8
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6885608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ZOdQJhI1E99 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:25:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA0560F6E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABA0560F6E
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:25:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57CFE240003;
 Sat,  6 Aug 2022 21:25:42 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:25:41 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220806232541.7cc9bf7c@windsurf>
In-Reply-To: <20220804054037.3040748-1-christian@paral.in>
References: <20220804054037.3040748-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659821142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbsavOvCIPFapQ2PTwVfvvE8uXciDm0+yi604Ff+A/Y=;
 b=KiwY3Em5AxuSO67wQ01g7UarVIcF87+75ojAMdhZ5nF/bS6tzUyPjzM2jJ14RClVnIJKGo
 gM7AusZImqPNX5HDyI2orTh2+SugiLtsXG6lh2GlCs3L/inRf0oEOekGAtZVIh6RrkGscn
 zV28z8kRBLYBaBvzB7FxSuIQNLLKS6NfbgjN6yAnmklO9gy+1i+WxOhT9YekOSy55lrjgJ
 x5NW3IBv0oqM8ClAn0wHMKQZgxLSWawJHWYLFa90lZug4ExQI+MUIsFJjHsQvJMEoOgspr
 NzikFtWirL7efx0YFITbVXxq1H41a2uiuGwFh+5z6Ka5HLqKrMvyZ14sh47xfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KiwY3Em5
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.1.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 22:40:37 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> This is the third release of the 1.1.z series of runc, and contains various
> minor improvements and bugfixes.
> 
> https://github.com/opencontainers/runc/releases/tag/v1.1.3
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 2 +-
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
