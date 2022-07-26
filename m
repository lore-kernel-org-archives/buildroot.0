Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0666BC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3244402F6;
	Tue, 26 Jul 2022 21:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3244402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTr1Anq5Jdul; Tue, 26 Jul 2022 21:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB6B402E7;
	Tue, 26 Jul 2022 21:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB6B402E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B08411BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C42081462
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C42081462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL4PZw3_3K6a for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:47:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4BC81461
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E4BC81461
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:47:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B0BF20008;
 Tue, 26 Jul 2022 21:47:44 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:47:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726234743.185ba6e5@windsurf>
In-Reply-To: <20220726201224.215268-1-fontaine.fabrice@gmail.com>
References: <20220726201224.215268-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658872065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iY71/9MGQzeWwX9Pbiw46btWcs1sHAgf4QtAQbOx+14=;
 b=bo2/jxaXUuU6DZFaxHeFoAXW0msIsOzwlxEot0ibNJPJKyvDNOj3E2hP1WR+ERCfC9VmP7
 C2kh37HCVDa/D24eexPpVIDNEutNiqi/HsR/LbaEmDjSRxXw1BKv1/s40vyqcH8GDc1yZa
 nBDCGUVxiold0oPs/qqNDVLVaYtgg1v8CoA1CVD8GubZDUzO54ZFWFrhY89GKWuN1+WE+c
 ZdeolcXpGJjPDIDQNQ0WGyoSc5LEObKJasrdA1wU+34wHpXir3l/C7BS5IdHR0k3Qi6nUg
 nV+MzIR0WqawqfE7IJcm6jcCNEqlCS2Y+SLjYSNlsmuGivpftxwD3oB3Qb1CoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bo2/jxaX
Subject: Re: [Buildroot] [PATCH 1/1] package/f2fs-tools: bump to version
 1.15.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 22:12:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update indention in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/f2fs-tools/f2fs-tools.hash | 4 ++--
>  package/f2fs-tools/f2fs-tools.mk   | 2 +-
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
