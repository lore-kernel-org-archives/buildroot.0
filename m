Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABC2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E7F8610A0;
	Thu,  6 Oct 2022 19:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7F8610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_MhFUQnNk4Q; Thu,  6 Oct 2022 19:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E502C60F6F;
	Thu,  6 Oct 2022 19:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E502C60F6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52C1B1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E6BE40D33
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6BE40D33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE71H0VU8hgM for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5694015E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C5694015E
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 637F81BF208;
 Thu,  6 Oct 2022 19:04:27 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:04:26 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221006210426.1fc44cf9@windsurf>
In-Reply-To: <20221003203104.3384703-1-angelo@amarulasolutions.com>
References: <20221003203104.3384703-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665083067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WwjovtlzzeOfvOYo+m/gkqgfVFSk0EaJZwFSgswoUY=;
 b=HKCCNFABfPo7QU9f63GB0v3IkWR82VSm6+SLEiuzdMHlCeZRURNYZcQJYn6wk0UkVNMAYw
 3Nww5ZM9U7w89iAqp3dWLneZjkbvJQUX50FL0CKl2O5+PLPGU9FoeSkSqOSxqO45wsmaza
 rdnIGsZl/UyN6fvYdoyvAnbQcz7Dkl12AfTDwG26/lxUsUeEAtrG97vMojSy1JXI49kbry
 4ztF/u1Zobd9uYEQEbrNBaOp2C5Y2iyOdi6vi9a/Cys1nVm0csOkdUaL+HBx6fJNnissb+
 pgOwzqj3Hn5NFN1axkbBDlPeuqmduOImspOR0BmiKMQGH7jKRzf88T3dLBJgyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HKCCNFAB
Subject: Re: [Buildroot] [PATCH] package/sysdig: bump to version 0.29.3
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

On Mon,  3 Oct 2022 22:31:04 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/sysdig/sysdig.hash | 2 +-
>  package/sysdig/sysdig.mk   | 2 +-
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
