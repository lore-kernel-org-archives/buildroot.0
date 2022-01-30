Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F67C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 13:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6220600B4;
	Sun, 30 Jan 2022 13:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFJdAycc43BU; Sun, 30 Jan 2022 13:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2987C60E73;
	Sun, 30 Jan 2022 13:54:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5544B1BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41A6640296
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBKVm9a1MdWO for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 13:53:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5313408A1
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:53:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AD8FE0007;
 Sun, 30 Jan 2022 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643550812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80hjkw+B0ocHWmvy3zwqZniRIbpcMHLhRG9IDUzY3sE=;
 b=pPeNGYHy6aoz0ITnG9JM2brky2guF91hIggoDuDCRt5N2TC7rZzwXRCD91/JVeOlqvzJE6
 11wmIdC85p1OyWovvy2mK1vNJqvSMXULWYAInKbSPjG+BH0DthQ0l7cp2UlH9MgqXM++ZE
 /0idQqVJLo243piDpG8HGQrRyga2Ux7mmA4C4w4AwiFJQ47LWHsseBVuRB1+dVUgBhAnho
 LRoQ/MFiS005T6cTDYka9GMkpRCu1MQ9rvbCsZ6TAWuP+9Il8t6k1fsMLKEEY09yaOARAu
 dCFXORV6TRA4L2qeLHUOMpvsmNIsKJFuHNOkBZPAy7erFn1XHtcjdc9b3NN9sw==
Date: Sun, 30 Jan 2022 14:53:31 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220130145331.5474ffa9@windsurf>
In-Reply-To: <20220130123435.13149-1-bernd.kuhls@t-online.de>
References: <20220130123435.13149-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.16.3
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

On Sun, 30 Jan 2022 13:34:35 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
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
