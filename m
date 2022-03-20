Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C301C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30AF5405B0;
	Sun, 20 Mar 2022 17:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zz2DfBRV-gy4; Sun, 20 Mar 2022 17:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EDC1402F6;
	Sun, 20 Mar 2022 17:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7961BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094414087A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3vCO9Zm3GVG for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F301C4027B
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE3E7FF806;
 Sun, 20 Mar 2022 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6FA8zFuL2jr98jiceO9zj6F/WPgVrNd69qyhjFvcB4=;
 b=BY6KEKyRqrY4QsWf16WPuShQBdT4orFqj7dwmfB8sfIZKtZ2rFPkE4n41B5iX7rIpu85bp
 CNfyAl6w9BGQNEqyZc4ggeG6kEhm96g7tSG+BKogX5dQwcMJb8Pc6tfyME8vlWtCVxG3If
 3gkhBJuilgZrqfN3oisX15AeCQqmY1UTqPe/mF+hAcHkptsjO4IVvZm+s4tInVYH/y7oRT
 pwF19HOfmESHlaAUlvQd6hzpmzXn+Nrhu+iuiIDwK36QdBkJMr2c/6vJmHE+d5Cdxq0nz2
 m5hyTlMn5OgzXeeTuwOOv6AlxuTht7IRRCWpAue8RRYJUHRzqNuD6XFDv9kvvw==
Date: Sun, 20 Mar 2022 18:03:57 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180357.361e12f5@windsurf>
In-Reply-To: <20220320123816.556069-1-bernd.kuhls@t-online.de>
References: <20220320123816.556069-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libks: bump version to 1.8.0
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

On Sun, 20 Mar 2022 13:38:16 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libks/libks.hash | 2 +-
>  package/libks/libks.mk   | 2 +-
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
