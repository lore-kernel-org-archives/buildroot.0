Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39BEC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 11:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E28A80C1F;
	Sun, 12 Mar 2023 11:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E28A80C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-bWrnPGsC2X; Sun, 12 Mar 2023 11:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F7B80C28;
	Sun, 12 Mar 2023 11:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F7B80C28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B79CC1BF5A1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 11:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9102141936
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 11:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9102141936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXxHZG0sHB85 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 11:21:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053A3402C1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 053A3402C1
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 11:21:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 97D3FE0005;
 Sun, 12 Mar 2023 11:21:43 +0000 (UTC)
Date: Sun, 12 Mar 2023 12:21:42 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230312122142.37a5a72b@windsurf>
In-Reply-To: <20230306134528.1198076-1-vfazio@xes-inc.com>
References: <20230306134528.1198076-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678620104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzilIfAeKFGn54qRNWz9UlKgqmx9p4OzTSyOX9eFj9w=;
 b=IrZ1X6s4LQ4g6BfWw8TXXz25dCCrLxXDNeg0bdfh7ySRrYP17/sKqeF4N9/ajg7I5X57MV
 MCU0j2c0ER33IQuS9TshrHV6dcbceRKJg2+C7MrhdBqWE6GkRkxrx5UOwWdl0m+nsAxLo5
 8YndfMywvky9u95go8DoElVG/yevLoJEKDz8W9C13kmIP6AvD1DwKB3WwZLoOM5mRRF9Gn
 nl2VIoHIs1CxhOtunyrAkEsKrFc938k+hghEslulIVc0XHyWzcgpaJ1xOnpGANz4r07VhT
 yIrCAbkL1tmdxSDDYrevJe5iTBcNgGivvTKkLuXBOEdKf2eNm1WHUNMwaubUTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IrZ1X6s4
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.2
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Mar 2023 07:45:28 -0600
Vincent Fazio <vfazio@xes-inc.com> wrote:

> Drop our patches as they are included in the new version.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/ethtool/0001-uapi-Bring-in-if.h.patch | 483 ------------------
>  ...2-marvell.c-Fix-build-with-musl-libc.patch |  71 ---
>  package/ethtool/ethtool.hash                  |   2 +-
>  package/ethtool/ethtool.mk                    |   2 +-
>  4 files changed, 2 insertions(+), 556 deletions(-)
>  delete mode 100644 package/ethtool/0001-uapi-Bring-in-if.h.patch
>  delete mode 100644 package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
