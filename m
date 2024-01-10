Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B977DC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 663E04015F;
	Wed, 10 Jan 2024 19:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 663E04015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmQQqyxf-M5o; Wed, 10 Jan 2024 19:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D6F643677;
	Wed, 10 Jan 2024 19:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D6F643677
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68981BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F68682231
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F68682231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJCrkdUnryQv for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:21:57 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC8848215E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC8848215E
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EFC7A5FFA3;
 Wed, 10 Jan 2024 20:21:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59842])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Jan 2024 20:21:48 +0100
MIME-Version: 1.0
Date: Wed, 10 Jan 2024 20:21:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20231217230704.003200c7@windsurf>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
User-Agent: Webmail Free/1.6.5
Message-ID: <71f2b96c764d823974a09ac850c76d58@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704914514;
 bh=XrXvt7c/nbw/M914/J1XB4gTAyVYom0kHQd/JkgnJiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RtA1dks/VR4O/G03XoEiLzxABY+SZXdPe+xnnO87lRpvKyrPaxmYbBRGBtYka5P74
 KB4zvoniUXVHH+rHJgMQxvHOdgC01MRSxqh7GDAPIeabkUii4SNHj+qGs2dIKQSJIf
 TCq81HjGyP7heqlWpxVHCmxBHdAE+DLCz3hm0vtj+zQ/ZnHfSpkJjUVGJk4HMb2Mp6
 nFQg0IzSqaSyXsiL9+DGk+7UfgNFmotC0q90VjLj3uB/KmDj+Y9x3jIGDQa8njtmHd
 kP7HIKaCgb2upnEGKeVWuXbcDVojdGCaK7nAuYbp1Mi3awQqNeC36z4h2GXlcUE6DG
 IPE0qSjIAAQqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RtA1dks/
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Ralf, All,

On 17/12/2023 23:07, Thomas Petazzoni wrote:
> Hello Ralf,

[...]

> Also, it would very, very good to add a runtime test case in
> support/testing/ for this, as such Python issues are only visible at
> runtime. I have added Julien Olivain in Cc, who can probably help with
> this, as he is our resident expert in writing support/testing tests :-)

I was able to craft a full PyQt5 runtime test, using the Kernel
VKMS (as we used in some other graphical tests), and using the
Qt QPA eglfs, which runs application directly on kms/drm.

I'll post an early version soon, at least to get some early comments.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
