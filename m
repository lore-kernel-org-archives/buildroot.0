Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42464C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9D681325;
	Wed, 21 Sep 2022 18:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9D681325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiVJ45f6bICu; Wed, 21 Sep 2022 18:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02B2B812FA;
	Wed, 21 Sep 2022 18:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B2B812FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 543641BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29FE8408AC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29FE8408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k73o4Gf7ZFrP for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:19:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA964023F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BA964023F
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:18:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0957FF804;
 Wed, 21 Sep 2022 18:18:55 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:18:54 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220921201854.5b4913b2@windsurf>
In-Reply-To: <20220920230029.1680134-4-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20220920230029.1680134-4-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663784337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wFHtLYsFjFDStlIEbesCtPCTdqaI+v+az/28fvNKtE=;
 b=G/B0ripihnM3k2KyQiePNNYZ7rwsKp+S2pZ1XBo9SjNE3yRZci5aLFXUCtojx7yB+YfPYK
 X+uUqp+u1xDlAtTV8xDDD7mIWxXFrpv7gPgP6EGDgkN0RbAzPoSYWmFcLpPng+oggfM7gJ
 eidsG47Hwn4yC4mojt3QN0VGLsZrsEuhfq7TND8YeIhDvmNvGKqm+n2sir+bMFyVJtmu/1
 LSvQqvKmMtm6Rrjy3LSS4UkN0imjddSQQr//WatXG92qGq0EJI58g6uBsd3y/tf78Ink1d
 txRg/vajOStcCoxJDHlmNi+/gqVlU2QeCo1BgMRu3noCHfxwqsWCr58bY9YdBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G/B0ripi
Subject: Re: [Buildroot] [PATCH 3/3] package/wpewebkit: bump to version
 2.38.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Wed, 21 Sep 2022 02:00:29 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update to a new major release which brings in improvements and a few
> new features. Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.38.0.html
> 
> This release also includes security fixes for CVE-2022-32886,
> CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2022-0009.html

According to this page, CVE-2022-32891 only affects versions up 2.36.5,
and we're using 2.36.7 in Buildroot.

Also according to this page, the two other CVEs have been fixed in
2.36.8.

So, could you rework this patch series to:

 - Have a first patch "package/wpewebkit: security bump to version
   2.36.8", which does bump to 2.36.8

 - Has the patches updating libwpe, wpebackend-fdo.

 - Has the patch updating wpewebkit to 2.38.0

Indeed, we will want to backport the 2.36.8 bump to our stable branch,
as it contains security fixes.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
