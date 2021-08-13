Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF767C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771AE60F36
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 771AE60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB45606B8;
	Fri, 13 Aug 2021 13:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-fw8Sg8tQPB; Fri, 13 Aug 2021 13:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF8860BB2;
	Fri, 13 Aug 2021 13:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 164F11BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0698680EA4
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Toya7pCnNoCe for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:18:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D2B083AF0
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:18:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 68E58FF807;
 Fri, 13 Aug 2021 13:18:40 +0000 (UTC)
Date: Fri, 13 Aug 2021 15:18:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20210813151839.4ed41911@windsurf>
In-Reply-To: <20210811111158.2577789-3-aperez@igalia.com>
References: <20210811111158.2577789-1-aperez@igalia.com>
 <20210811111158.2577789-3-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/wlroots: bump to version 0.14.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 11 Aug 2021 14:11:57 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update to version 0.14.1, and adapt to upstream changes:
> 
> - seatd/libseat is now used unconditionally, the logind/elogind build
>   options have been removed (which can be used through seatd, no
>   functionality is lost).
> - Now wlroots includes a software-based renderer (which uses pixman),
>   and the OpenGL ES one is optional. For now it is left always enabled
>   (as it was before) but this could be changed in the future.

I think it would be nice to support the pixman-based software rendered,
as there are quite a few embedded platforms that don't have a GPU.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
