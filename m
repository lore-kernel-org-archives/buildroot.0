Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D683C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD96817FD;
	Thu, 29 Dec 2022 09:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD96817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMyPNKQXhwMM; Thu, 29 Dec 2022 09:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FD0817ED;
	Thu, 29 Dec 2022 09:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FD0817ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19E871BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A6C960D55
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6C960D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GudSQwc5BFWe for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:03:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339C260D4E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 339C260D4E
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:03:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE20D100002;
 Thu, 29 Dec 2022 09:03:28 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:03:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229100328.004c7cce@windsurf>
In-Reply-To: <20221228221710.281781-1-fontaine.fabrice@gmail.com>
References: <20221228221710.281781-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuMLP7yNB4eMN1zuAkCb9YsAbGJTnNP2nu9uC/kwu9M=;
 b=CmhY8Qwyfr+cBWiFF5BwfClg+VdBI327z9i/uC+ZVJOBrT67RkII1ndghHpCowc/HBvcsA
 tYcE9BTBjpgkmmKQ/0iDA4jhJnxQr5PqqQkS3GYfb0vOu14rNOQb0CRJ00saDGVbs9dbQC
 579aLzXrseB8S8sm4r0tMikhEBhwoq4AuUhuvwTSZyq2Ohv4va0N44m7TH4RQNQlSNxu7g
 gBjT/U4D5N8c1EYvIv3Cparh2SvZ+g3TY/t+gVXX1JgYEnNeAdOgWoW/2aJd9sU1CVDyVw
 jpjBu2RR4a4r05VWPNOUHh+KTh6mM2JHVaJF2GUFRebLbQyE79LzVkCDp/hheQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CmhY8Qwy
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.14
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

On Wed, 28 Dec 2022 23:17:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://littlecms.com/blog/2022/11/02/lcms2-2.14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lcms2/lcms2.hash | 6 +++---
>  package/lcms2/lcms2.mk   | 5 ++---
>  2 files changed, 5 insertions(+), 6 deletions(-)

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
