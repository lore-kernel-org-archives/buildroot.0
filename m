Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC02C43219
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BD281460;
	Tue,  1 Nov 2022 20:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BD281460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPxzFDWCN9kP; Tue,  1 Nov 2022 20:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6C481409;
	Tue,  1 Nov 2022 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6C481409
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B99761BF297
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21FC4029B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A21FC4029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pmykqLny1iGv for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:59:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE5F400C4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CE5F400C4
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:59:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5216EE0009;
 Tue,  1 Nov 2022 20:59:51 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:59:49 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221101215949.7228088d@windsurf>
In-Reply-To: <20221101204732.2726292-1-bernd.kuhls@t-online.de>
References: <20221101204732.2726292-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667336391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQ8d60C7Bpr2DL1iPnj1ngsKy7BfNV6VKaFZYyIjsOk=;
 b=MF5wDKyrZuWBg/9shJYXv+JXx3b+Su2vUqDWSETmko36cmdQqYQ0/MNWDoIqyyE10SOaQI
 jIS+RZcPrWLNsFu0urL3jwjs1dCAcY9FVB5vilMvaeIc+tthb/awQ5M0X7cCEC5vJZnXmi
 bZ2RIUcTPb/O6l2QQnZX6m5nJdHLy0Q+vqWYvyyyXkjzOdpwFptVPxAYX7LLhyGStknnj7
 eq1gxwEm3KsKxYpB5W07TAPfcrTXVrIuroCj/AD3mfAwccpR9Uxjon6xRBL59AlDrgIe7c
 tFPiFMcX7LEnVTJu4SKKG0bxVOTu5xpJbtL+HxiBMjXxVuFw93aY7D6TONpp1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MF5wDKyr
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: add option
 to enable non-free features
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue,  1 Nov 2022 21:47:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediadriver/Config.in            | 5 +++++
>  package/intel-mediadriver/intel-mediadriver.mk | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
> index ad56590008..79511a8808 100644
> --- a/package/intel-mediadriver/Config.in
> +++ b/package/intel-mediadriver/Config.in
> @@ -20,6 +20,11 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
>  
>  if BR2_PACKAGE_INTEL_MEDIADRIVER
>  
> +config BR2_PACKAGE_INTEL_MEDIADRIVER_NONFREE
> +	bool "support non-free features"
> +	help
> +	  Enable support for non-free features

Could this be a bit more specific? What are these features, and what
"non-free" means? Not under the GPL? Not under an open-source license?
Not allowed to be redistributed? Does INTEL_MEDIADRIVER_LICENSE needs
to be adjusted based on BR2_PACKAGE_INTEL_MEDIADRIVER_NONFREE=y ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
