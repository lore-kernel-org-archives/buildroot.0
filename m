Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A23CC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB824161F;
	Tue,  1 Nov 2022 22:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB824161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jx6krgm9_ocd; Tue,  1 Nov 2022 22:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42FE410B0;
	Tue,  1 Nov 2022 22:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42FE410B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94D5D1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7068960E2F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7068960E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKFSArmg8enn for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:24:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B99760BF4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B99760BF4
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:24:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 87F89240007;
 Tue,  1 Nov 2022 22:24:09 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:24:08 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101232408.264a05e4@windsurf>
In-Reply-To: <20221031220020.44199-1-fontaine.fabrice@gmail.com>
References: <20221031220020.44199-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRl7+mW5Q0wA4g4v6AL4Nhkcy/OsrOXOoEYr2ZmSKgI=;
 b=UZP7yDd2InGHtmjIx64oHaVFBwGDlsId9OOum0BS2mOjPZl+76QAS30EdmwovnjO0Vo3Mj
 nSxv4tofyD8yxKu4L2A6+hobgbrZJ71TL+hUDHiho75u+OSMf1MA9mva/IohtIoJN904XL
 38fKiYxLCdlA3Vrchsr6N9B7syuZ7AY3GLG5e672o63+7BxZe5tFRXOKwhUov0TXEF2dat
 JZVZ29PFr4XZ3J/b0mr0KxMSR4QKE4tMOHGUur1VOT/AGRo7dzQQuhkI6GzkkuKcUY+wva
 mKtRWPt0F4e2r4UHAPrg6tGXXr8w7tTAdcTfO5a5C0UR+qHrRacDXFe+l2N0rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UZP7yDd2
Subject: Re: [Buildroot] [PATCH 1/1] package/uftrace: bump to version 0.12
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 23:00:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop second patch (already in version)
> 
> https://github.com/namhyung/uftrace/blob/v0.12/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...support.c-define-EF_ARM_VFP_FLOAT-wh.patch | 31 -------------------
>  package/uftrace/uftrace.hash                  |  2 +-
>  package/uftrace/uftrace.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch

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
