Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C5DECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2048E40A99;
	Fri, 23 Sep 2022 12:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2048E40A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcjRXsy14kAU; Fri, 23 Sep 2022 12:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F9540A8F;
	Fri, 23 Sep 2022 12:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F9540A8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 717F81BF349
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42513417DE
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42513417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql9Mn29_bbOP for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D690E41712
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D690E41712
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:19:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 056EB1BF20A;
 Fri, 23 Sep 2022 12:19:25 +0000 (UTC)
Date: Fri, 23 Sep 2022 14:19:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220923141925.58ce3654@windsurf>
In-Reply-To: <20220922200041.4982-1-james.hilliard1@gmail.com>
References: <20220922200041.4982-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663935566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/HcfLAjt1A+bvpoEa1HVZ+4pJoaKqewXDN1FDsO5gY=;
 b=pktuHJpK3JsCp+R6ifGkGdEq/MNrYqWqX6+WbMG0yXzK3Mu6Ww6ycHX2yG5PfNmjVGkR8E
 r9/FDGV5TxgSgo4UV1pXH3uyuct05+tk0gjtyD6HYMQWGioaPY/bBs6pJ/d8R6oGtAKtgk
 fBz+1wyPp3ByZlb1gOW7foVw6EK4AKQySBb7xD2Amin0c6HK8GXhFFX+T6K5LkAzb3XzRd
 x6fNxjbVG5pqLzKt3DRLxW+Iz6q29dnsgOEsnY7jEIGIdwyuPno640dVg4mYYCqLDvkZDm
 /x/I9dMPR24/LoxJY7TSkPl6SZvJTAJEy61lPXwwLWvyH2++wTrVqDxgWynlog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pktuHJpK
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-utils: fix build
 without libdrm
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Sep 2022 14:00:41 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add upstream patch fixing build without libdrm.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a13/a13e5bc4893a2057097aad268152212858c8e966
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ayland-info-Fix-build-without-libdrm.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch

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
