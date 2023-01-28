Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA25C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA9260E41;
	Sat, 28 Jan 2023 21:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BA9260E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LlSqcH0BoGk; Sat, 28 Jan 2023 21:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5283B60A8B;
	Sat, 28 Jan 2023 21:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5283B60A8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 852F21BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5679340883
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5679340883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAUaBrW3M2oV for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:51:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D243E40570
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D243E40570
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:51:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB2F7FF803;
 Sat, 28 Jan 2023 21:51:22 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:51:22 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230128225122.7477de9e@windsurf>
In-Reply-To: <20230127192108.341891-1-bernd.kuhls@t-online.de>
References: <20230127192108.341891-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GB+oBbsBWCfAk3n1yOufU4QLLBpjaI/9MAjsG5d4il8=;
 b=f2UV2ueveQ19cr2ckJyfRJ6H6miBQkdRgSVxclYNtWutFyfDCcRbHeIOe7rAkRLXUqa6nF
 eEO3CKgfgW8SeAclLNGuOEfIFWjyhMbxdrUkmb2K7L7nbv1lhLyOWevc7Ne4LZVA2juD6J
 uHw/msFFhXfuTYaDvaZ5pUtxfc7yydLFWr803JAOfDWOQdxbfPBZOqgpXFWjsP9crGR4f3
 2BNGPlOdHAfz3ATEC7YwrrN+DvCMsYDJCEF0pch/y5wjOjAD3K+p0FTa213HNXIsqGnSbN
 CaVhebjiIGIaG4FreCAnbR2Bwydc0TJ8TKF4OB9/eGcH/k/YkFMmxRoisUR6YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f2UV2uev
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-qxl:
 bump version to 0.1.6
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

On Fri, 27 Jan 2023 20:21:07 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-January/003316.html
> 
> Removed patch which was applied upstream.
> 
> Switched tarball to xz and _SITE to https, added sha512 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...1-Fix-a-build-error-with-Xorg-master.patch | 106 ------------------
>  .../xdriver_xf86-video-qxl.hash               |   5 +-
>  .../xdriver_xf86-video-qxl.mk                 |   6 +-
>  3 files changed, 6 insertions(+), 111 deletions(-)
>  delete mode 100644 package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch

Thanks, both applied. Please note that the link in the QXL driver
Config.in help text is broken, it would be good to fix it.

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
