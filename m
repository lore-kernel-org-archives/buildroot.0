Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C3BEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D61FA40B9E;
	Mon, 10 Jul 2023 20:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D61FA40B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj7ZmydEQyxX; Mon, 10 Jul 2023 20:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 254BD40A65;
	Mon, 10 Jul 2023 20:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254BD40A65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE3641BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4E2782040
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E2782040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7PR3aD76k8P for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F3E8203E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F3E8203E
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:00:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A37A4000A;
 Mon, 10 Jul 2023 20:00:21 +0000 (UTC)
Date: Mon, 10 Jul 2023 22:00:19 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230710220019.3ef0feae@windsurf>
In-Reply-To: <20230620172305.4176-1-ckhardin@gmail.com>
References: <20230620172305.4176-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689019222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjZwJuMh1q2KUvfNrZE9r50nh8OXvYr22T0X6wwaqDw=;
 b=JlNSU8nYZ1Y+DX2+aH4w1reGHauS2D9Cvh1/iBDbyMkUkXv82GgRVOEZkpeRs9J9dCK1HD
 BEYkAd39bTiug3H7KmppqTZcXhYwVqajQJDqD2N6vNQnaC/IotPF4nu3Ev1d/Lna+qBeZ+
 0Hd4YW4lJ5ObLLH7dCvy49j54wzQNE7biugsyHvZ3V5lzzxxOOuscYFBoJUCfmCSBpT/sV
 u/bvVN9c4Rrjd0ekgyju8lDRyxjlkYm7R8EAWv91P4DzhdA3ora2ZO9931LG8vP2NQmNpr
 ibFXCotppTvY8Cnw2GiHwNlXEwjmu2qflHupKnyjFe34d8//bIv99QXwMHJ9cQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JlNSU8nY
Subject: Re: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Jun 2023 10:23:05 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Buildroot always enable largefile support in the toolchains, and
> thus the associated definitions are always on. This leads to a
> problem in the unzip that on a 32-bit arch with these flags being
> passed in
> 
>    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> 
> But, the LARGE_FILE_SUPPORT not being defined will cause a size
> mismatch on the comparison of the zipfiles.
> 
>     $ unzip test.zip
>     Archive: test.zip
>     error: invalid zip file with overlapped components (possible zip bomb)
> 
> Simple solution is just enable LARGE_FILE_SUPPORT in cmake to get
> an expected extraction.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/unzip/unzip.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

I slightly improved the commit log and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
