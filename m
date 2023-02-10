Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2734C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A8E60AF1;
	Fri, 10 Feb 2023 22:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A8E60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uracfG-oQudN; Fri, 10 Feb 2023 22:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B2AF607F9;
	Fri, 10 Feb 2023 22:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B2AF607F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED1B1BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7531D415AC
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7531D415AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ow5nrHvi4gke for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1934740AF7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1934740AF7
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:13:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78EF5240004;
 Fri, 10 Feb 2023 22:13:16 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:13:15 +0100
To: Akshay Bhat <nodeax@gmail.com>
Message-ID: <20230210231315.17b367e6@windsurf>
In-Reply-To: <20230210180222.88328-1-nodeax@gmail.com>
References: <20230210180222.88328-1-nodeax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676067197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SffaVLzTJ+QQfqVaHUGuNGePlEP57VDnBcIcmfVxW2Q=;
 b=Zgfir5LliNiSwj5QKp6MjVFNxGvja7dXLM8W6oDMVqThw/7Hlldblf0n9bEGmyUA5Xb/y+
 hdXMLWW46bLZjbe8QDTJqvCeiAn1/U5dB5MQwSuzT9r4kCISbJl69YGWFLQvefClLtnVo5
 OqWx08FguYyzF37sq9ELpXYUDzw55KoT/JSoq0eaR3ZrCHSDnXtzyEbx/cW2DmayrsOyYJ
 0AN4JmVDtU5NJcwov6z57T5yswBag/Ujue0yNlxNK4rS0iUyJ8zE8W3/RtEWVwwsN/237K
 bnESfPPHwqYX/9Yu/jpD2dOaOIdVGe+FpjzFpBjZx9bgSvhGNk48y2aAa8c1Fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zgfir5Ll
Subject: Re: [Buildroot] [PATCH 1/1] package/libiberty: bump version to 2.38
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 10 Feb 2023 10:02:22 -0800
Akshay Bhat <nodeax@gmail.com> wrote:

> If the libiberty package is not the same version as the one packaged
> with binutils AND if libiberty is installed before binutils, then the
> below error is observed. Hence for now let us keep the versions in sync.
> 
> /usr/bin/ld: ../libiberty/libiberty.a(hashtab.o):(.data.rel.local+0x0): multiple definition of `htab_eq_pointer'
> 
> Signed-off-by: Akshay Bhat <nodeax@gmail.com>

Thanks a lot for the fix. Is this fixing
http://autobuild.buildroot.net/results/eaf/eaf23ea0c8d7803e3768da40b7070d04801cd36f/build-end.log
perhaps?

One issue that I see is that the binutils version is configurable: we
support 2.37, 2.38, 2.39 and the special ARC version. Do we need to
make the libiberty version match with that?

Also, see the conversation starting at:

  https://lore.kernel.org/buildroot/3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr/

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
