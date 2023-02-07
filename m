Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED6EC636D6
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06678418B0;
	Tue,  7 Feb 2023 16:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06678418B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w67HOECUI-9; Tue,  7 Feb 2023 16:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072E0418AE;
	Tue,  7 Feb 2023 16:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072E0418AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 714741BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DAC9418AE
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DAC9418AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6_gDAG0qPdm for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:14:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E001C418AD
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E001C418AD
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:14:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A620C100018;
 Tue,  7 Feb 2023 16:14:01 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:14:01 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207171401.54d75d16@windsurf>
In-Reply-To: <20221128123418.2197-4-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
 <20221128123418.2197-4-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675786445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRdmbNC7RmsttSdNzkuPlPyPW4Rr50v0ScaHfvLdZas=;
 b=WmKAnvD7whSBPimb1B9BdnVooXOP3s/6wkZORZYUaD67tZxSa53LTSVh1v2rNaD6+Qa5PA
 V36NW2X2vHBHD/QQYXU+vUoZXOQUUV6FURMwUnQ3LpW4F4y2rsmWJ7a/tvlYqmdaVkuST4
 6FIASy9RxPS79aKC/rVc16X3nVPljXYkLPNPZppKScmNwhpnYolPFA9rl+6BBhpmXTH2Yx
 6NTPdBGvZNRhm489DtqrkSnRBD6NqsiM4XcMeqI5gVVea/ary0Nv+C/+UCZCffFqkWAsY1
 XBP/s/DYO9quAookiy3RqLZbNN2UfhvgUDkjOMVv/jxqtU6/akV1pDpiP1n5Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WmKAnvD7
Subject: Re: [Buildroot] [PATCH/next 4/6] package/libsolv: new package
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

Hello,

On Mon, 28 Nov 2022 12:34:16 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
> +endif

Changed to:

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
else
LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
endif

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
else
LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
endif

To explicitly handle all cases.

> +ifeq ($(BR2_PACKAGE_MICROMAMBA),y)
> +LIBSOLV_CONF_OPTS += -DENABLE_CONDA=ON
> +endif

This isn't really nice, as we generally don't want packages to look at
their reverse dependencies to decide which features should be enabled
or not.

So here, I would prefer to have a BR2_PACKAGE_LIBSOLV_CONDA option,
which the micromamba package can select if it needs this feature from
libsolv. For now, I've dropped this part, so if we need it for
micromamba, could you send a patch just adding this new option,
together with the new iteration of the micromamba package?

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
