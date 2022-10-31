Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC295C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 565AE40396;
	Mon, 31 Oct 2022 10:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 565AE40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQqFDADZJCCv; Mon, 31 Oct 2022 10:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91FE7401CA;
	Mon, 31 Oct 2022 10:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91FE7401CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431DD1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1493981330
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1493981330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akTojNmm7kHd for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:27:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB8C981323
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB8C981323
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:27:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD5E724000E;
 Mon, 31 Oct 2022 10:27:34 +0000 (UTC)
Date: Mon, 31 Oct 2022 11:27:33 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20221031112733.7113d46c@windsurf>
In-Reply-To: <20221011062647.741292-1-marcus.folkesson@gmail.com>
References: <20221011062647.741292-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667212055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ymar2II/9rQuhX8TvMmFGzrCa60jg8QeZhURiJhEk60=;
 b=oMHeSf+T2WfPtwAQSm2Qein2q3/tgW1f/mrzmMfBLKiypjLQrgz47yHuxVW7IoqXnwxLbl
 fBcjCvN9CDJLbKXmmKBYoXihvh//mxfizm2dMLgWrTk2MjmqVQuHIj5dpxYHyv36/y1GEX
 mc6rRFQM71yNHSxgl+qbbgs6qM4E3BFl+SerhPxULaIfFWXf09BLIuX8MmcDQ+oPd2E7JM
 pKlq91CLE64K8/38hetSFbkMlRJqoz1P4RS2aZXs9kuAmpPDfi7EH1s6nhaqK1EyVxmlDI
 TdL2+T9e/+rcD1RnZZk1/od0QyIRgz2cEFVcrrLU4aR1vY2iCCwcFERYIxHcyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oMHeSf+T
Subject: Re: [Buildroot] [PATCH] package/libostree: select libarchive for
 s390x architecture
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

Hello Marcus,

On Tue, 11 Oct 2022 08:26:47 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> libarchive is needed when building for s390x.
> 
> Introduced in this patch:
> c6a53ef6e8f9491633b0d494991f94c629791e1d s390x: use 'libarchive' to modify initrd in SE case
> 
> Fixes:
> http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b4bd914414e3acf0/
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libostree/Config.in b/package/libostree/Config.in
> index 14ae4da4c8..a36e12ddde 100644
> --- a/package/libostree/Config.in
> +++ b/package/libostree/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBOSTREE
>  	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_E2FSPROGS
> +    select BR2_PACKAGE_LIBARCHIVE if BR2_s390x

Thanks for the patch! The indentation was not correct here, so I fixed
that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
