Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AF5C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED2E9414C2;
	Tue,  7 Feb 2023 10:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2E9414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-20b6hKxESz; Tue,  7 Feb 2023 10:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74F0410A8;
	Tue,  7 Feb 2023 10:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B74F0410A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4410B1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D0D405E8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D0D405E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hglCKmWPjcnV for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D346740528
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D346740528
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:43:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F29BC60008;
 Tue,  7 Feb 2023 10:43:21 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:43:21 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230207114321.2b5c2df6@windsurf>
In-Reply-To: <20230127105305.25877-1-neal.frager@amd.com>
References: <20230127105305.25877-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675766603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJSZAQs1vs8cQRXlITOn+bUbuB/W87ruk8NkxHf7WZE=;
 b=PhXT2sAj50+z/pHrFBnLqkTYCb/z5sfJ/hsaXZqHoVBIe3jnjqicukuzUltbv8arLVJT4S
 ZgUkaS3qz7RF0PT9fYJwwUVhAuFMqYSv3GcjCUKLZ6hK/7ljbnK3uWDShCFZiWYSbq7y/o
 2nSyn/4QC20hxeYh7KBO2qxnBdlpuaFGEeGo0qHiqT/wptbNR3j8yYGL7nZxfa6wIsxG4F
 CoXZah89XpiC4Q6+iFy32fMe3vOFuv0i2Cgq2C52AFWKeU+Kzv4juhidw4xwykWMJ4R6pq
 NX/epDYeHDOwkkIOqgnthbyJ8tzw765YaxK4m435cABN70bI2ru9Qbx+U1dTxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PhXT2sAj
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: use
 Xilinx github for versal-firmware
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
Cc: michal.simek@amd.com, kris.chaplin@amd.com, terry.oneal@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Jan 2023 10:53:05 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Migrate versal-firmware package from nealfrager github to Xilinx github.
> The images are identical, so this patch has zero impact on functionality.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal_vck190_defconfig            | 2 +-
>  package/versal-firmware/Config.in          | 2 +-
>  package/versal-firmware/versal-firmware.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

I've applied, but to be honest, it still looks a bit weird. The branch
on the repo is special for Buildroot, and its contents are completely
different than the master branch of the ubuntu-firmware repository. Why
are those firmware files specific to Ubuntu, or specific to Buildroot?
They should normally be distro/build-system agnostic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
