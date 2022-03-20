Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA85FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5FE5405A2;
	Sun, 20 Mar 2022 17:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uo2wBrsiWYCW; Sun, 20 Mar 2022 17:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41CE6405BB;
	Sun, 20 Mar 2022 17:08:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7341BF97A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BFE4088A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwnR33CicDo5 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 935D74087A
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA811FF808;
 Sun, 20 Mar 2022 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbW7PiW1cf8GN3ZaQxP8QZF5K55bf/4I5uq1IYz2nEU=;
 b=p1enX1v+UXcPTs+ESgsue+By1nRpWW3MNo49wLV+hM9NSRfgpHBWfeV1rXlU5IkTM+ZgGs
 2vS33u+6uKqpwanuBel9XBYWgKnVe1W9NGb1keiMVaqVSsUwkJUUH8Q7tdJ7a+7jqY7BAX
 u+mFmuDb/KXDgueQ4HMh4+8LDxqfXE29Gf7cc69uEXWQ8V68kcXS2HZbIZfGOiJB+iArSW
 wK7CW9d6DmqKgtH335SNOH6EO4/+KXeKTz0haKio8r7PZrHEZw18nfy+oB4Xk1/+/s98FJ
 L0VAepwPcUa5kvR5O71oNiTaZgPNNZyXHZTNa5xKypT7Cmm4VwvU2gTxZnkOtQ==
Date: Sun, 20 Mar 2022 18:04:04 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180404.4e2f3ceb@windsurf>
In-Reply-To: <20220320124846.664904-1-bernd.kuhls@t-online.de>
References: <20220320124846.664904-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump to version 3.38.1
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

On Sun, 20 Mar 2022 13:48:46 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://sqlite.org/releaselog/3_38_1.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
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
