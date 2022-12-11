Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649EC8137E;
	Sun, 11 Dec 2022 13:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649EC8137E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtRnWPivqlOV; Sun, 11 Dec 2022 13:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9726B813F0;
	Sun, 11 Dec 2022 13:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9726B813F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 470361BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1841F40894
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1841F40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 845S1Ouh3w1u for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:14:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76EF40865
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E76EF40865
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:14:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 375DF100002;
 Sun, 11 Dec 2022 13:14:13 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:14:12 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211141412.16eee47c@windsurf>
In-Reply-To: <20221210132240.10559-1-fontaine.fabrice@gmail.com>
References: <20221210132240.10559-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8isGeR8VF5vXvLoADEQjUg/zUqpuvlVMWvU/hrGJ4d4=;
 b=PAn2MiziuzHdbKPGA7dbMGY253V7aCi8lk/gus1+oDTd++DFBAjY2WIcLSe7tptYskkDeE
 XZKZ4ITGt/WvwGCQUwM8ZkwofWSuUH2IXAZuGAAkap1GJ2dVzBmx1Xc2drkgrYykicJcGl
 uCVAbD2rKzzwd522ok/2ppCywIIm8NokuKXe4cTjtuHDHLq6ptRstSDSCiqMwHmWzmoOvN
 dcwFoGwj/KDUbRa2+srIpD5ZxYgWvgvjiDhE5GCjUTv/10NInxz2LqyAr0GpU3kPFs+oz5
 U63ohWeFUWRXK70ODwUMvpUQHXCC2BxIGhZZKmOCWyuFa6ZHVrirwBfmzdsc7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PAn2Mizi
Subject: Re: [Buildroot] [PATCH 1/1] package/neon: bump to version 0.32.4
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

On Sat, 10 Dec 2022 14:22:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/notroj/neon/blob/0.32.4/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/neon/neon.hash | 2 +-
>  package/neon/neon.mk   | 2 +-
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
