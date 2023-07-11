Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA55CC0015E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB55415AB;
	Tue, 11 Jul 2023 21:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AB55415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuM3rRFb8jp2; Tue, 11 Jul 2023 21:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FEF41E58;
	Tue, 11 Jul 2023 21:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FEF41E58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6D51BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE3740580
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE3740580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sh6QzMafhf34 for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:48:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E60B4056A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E60B4056A
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:48:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1025B60003;
 Tue, 11 Jul 2023 21:48:32 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:48:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230711234831.27f0b988@windsurf>
In-Reply-To: <20230706191912.3008144-1-bernd@kuhls.net>
References: <20230706191912.3008144-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689112113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7V/q7TF7vKgxLwKtp9SJn/fJEwn+uUxylp8LYWbdxMY=;
 b=ZYz6TcL3zwCW28yk71du3qKKk2Rp9MJhvEuGSRBBfjlx8OcOKgac/mU3O2XK+KgXpH08/v
 246Agfwc15FIKjJvd5CaN25tYwjMDVZxbldntFJRv43/B/HEj9xd3qyOdoWFfB9xOWXmKC
 +tNLX2xJ7vWxlNh0kq2OTCWN4l1/V51ymnJNGUn20Z+ekJ7hkIEulp5M/s8u+0r7lI9YkJ
 nDFodx7kMVP9rFKxQi9izVxzeYrtSWve2BvZLw9r2Hs9NOSTTd5XAR57DmR7+j2wHkAsHY
 7j5OszTJWCJOefd+v/8Swu2+/MjNwh/3oWGabg3vexsG+t3Rcx1zhb6aujmMOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZYz6TcL3
Subject: Re: [Buildroot] [PATCH 1/2] package/ocf-linux: remove package
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

On Thu,  6 Jul 2023 21:19:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/88b/88b5d14b315af1669fff04f8c11c321cc4c107c7/
> 
> The package seems to be unmainted, asking for support of kernels >= 5.6
> a year ago was unanswered:
> https://sourceforge.net/p/ocf-linux/mailman/message/37662698/
> 
> This patch follow Thomas' suggestion to remove the package:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/654688.html
> 
> Remove the virtual package cryptodev which is not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  Config.in.legacy                           | 14 ++++++
>  package/Config.in                          |  2 +-
>  package/cryptodev-linux/Config.in          | 14 ++++++
>  package/cryptodev-linux/cryptodev-linux.mk |  2 -
>  package/cryptodev/Config.in                | 50 ----------------------
>  package/cryptodev/cryptodev.mk             |  7 ---
>  package/libopenssl/libopenssl.mk           |  6 +--
>  package/ocf-linux/ocf-linux.hash           |  2 -
>  package/ocf-linux/ocf-linux.mk             | 26 -----------
>  package/openswan/openswan.mk               |  3 --
>  10 files changed, 32 insertions(+), 94 deletions(-)
>  create mode 100644 package/cryptodev-linux/Config.in
>  delete mode 100644 package/cryptodev/Config.in
>  delete mode 100644 package/cryptodev/cryptodev.mk
>  delete mode 100644 package/ocf-linux/ocf-linux.hash
>  delete mode 100644 package/ocf-linux/ocf-linux.mk

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
