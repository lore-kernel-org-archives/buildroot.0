Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C84C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207324086A;
	Mon, 14 Nov 2022 22:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207324086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmsL2F_WbLxB; Mon, 14 Nov 2022 22:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2144740860;
	Mon, 14 Nov 2022 22:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2144740860
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EE1B1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69765812B1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69765812B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Z5NmxQ3RkOp for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:07:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DFD280E3B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DFD280E3B
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:07:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE79E20007;
 Mon, 14 Nov 2022 22:07:05 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:07:04 +0100
To: John Keeping <john@metanate.com>
Message-ID: <20221114230704.2dda05d4@windsurf>
In-Reply-To: <20221020121521.2041129-1-john@metanate.com>
References: <20221020121521.2041129-1-john@metanate.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668463626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxMiax6/ZjSuU4nHkhVpIwJKbHdIdzaJxpH25pwbSwU=;
 b=RKGRF5LbEb9JwZcBQVkLFIvdPcg52U+lgMQ0Fwb+K6Bjgw8UI3zo1MMD4tZDW97GREjies
 3TOb5lDo0WHrMl6KiJ5PCv2nDjNw/xLs3u3JJpLrmPOIBDzema7RD6P1LHP21rWEZk61eJ
 +uDQqDVhsfpk6viaiEjgIic7alPuw/axvsXwcYnfYZfKde3q9EZK40maGYNVG8P3Lrnba6
 cKVGNzCXVcZc4GJzBVy9TrOSrmVOqMPA/WhsNw3RCeAyQmVEor4C0VOhNW0IMNhRY1gq2N
 4adaXmNSRh/tv8kzZCiHB8x2TvvOOhxPphdGYG6SSGD0y66u8XBoIi3xvlIqCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RKGRF5Lb
Subject: Re: [Buildroot] [PATCH v2] package/sbc: add config option to
 control tools build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Oct 2022 13:15:21 +0100
John Keeping <john@metanate.com> wrote:

> libsndfile is only needed by the sbctester utility and the library can
> be built without this dependency.
> 
> Add a config option to cover not just sbctester but the command-line
> utilities as well.  While the utilities may be useful for debugging,
> normal usage will only need libsbc and these applications can be
> omitted.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> v2:
> - Fix autocomplete error in select BR2_PACKAGE_LIBSNDFILE

I've applied to next after:

 - Moving the option inside a if BR2_PACKAGE_SBC..endif block instead
   of using a depends on BR2_PACKAGE_SBC

 - Adjusting SBC_LICENSE so that it only contains LGPL-2.1+ by default,
   and then has GPL-2.0+ in addition when the tools are built.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
