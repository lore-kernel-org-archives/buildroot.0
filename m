Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD7C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C6041884;
	Sat, 23 Jul 2022 16:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C6041884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqE25MkJdcab; Sat, 23 Jul 2022 16:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9931E41798;
	Sat, 23 Jul 2022 16:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9931E41798
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEE7E1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77384018E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C77384018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14AFEacSED9V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:42:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 878D8404DF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 878D8404DF
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:42:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 378761C0003;
 Sat, 23 Jul 2022 16:42:02 +0000 (UTC)
Date: Sat, 23 Jul 2022 18:42:01 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220723184201.1902adac@windsurf>
In-Reply-To: <20220606162538.14868-1-ju.o@free.fr>
References: <20220606162538.14868-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658594522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rzw2hcYy66KDb1i5NQ66vEqDmnczddCUcTpbRQGnhWM=;
 b=YXns/x4KJ+Z8fPfpqne9DAjd7zaF4HUsswfqc2l3VMnJhWnNlGgLJptUkVoqr7NClBNVdU
 Ou7bo5PVTRt98JloyOE3DHSLCrBvxZTIaJ4M1UN83gdcrJsPmhs+4Xj7d5tDIgluDvqLB5
 DPqc0FOg7BlhUBEMm3qQINXgjgh0Km4TLegWoQnSDB1qTxvxnzoeT0IrukkbQs6RpT6hKU
 3MBiFkVkSAzhWVxYJI73/m2VBHEKJ5JfORNVsVG/ZEu+DHJV6UVEOkWoI0iohXNvCFNjZL
 WRdV57N1KTfgBqDZHUYzUcxKrB3hFterjB9H+mZx8XfXPrqOcl4N+wzfD1Elpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YXns/x4K
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version
 1.2.7
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Jun 2022 18:25:38 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.2.6, see:
> - https://github.com/alsa-project/alsa-python/releases/tag/v1.2.7
> 
> This commit also changes the download protocol from FTP to HTTPS,
> following the upstream project download page. See:
> - https://www.alsa-project.org/wiki/Download
> - https://www.alsa-project.org/main/index.php?title=Download&diff=7455&oldid=7386
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested with:

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
