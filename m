Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A375CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EB8607C1;
	Sat,  2 Sep 2023 10:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EB8607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3mugv9izXD3; Sat,  2 Sep 2023 10:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 889C5608D8;
	Sat,  2 Sep 2023 10:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 889C5608D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0631BF419
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3628381E6C
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3628381E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWREPU_w596Q for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:01:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EE7281E69
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE7281E69
Received: by mail.gandi.net (Postfix) with ESMTPSA id E732E60005;
 Sat,  2 Sep 2023 10:01:34 +0000 (UTC)
Date: Sat, 2 Sep 2023 12:01:33 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902120133.71a0809c@windsurf>
In-Reply-To: <20230830195446.3958486-2-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
 <20230830195446.3958486-2-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693648897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYcGaamkgH4pdMNzkOsd4tx/YZTPDiHzfdD3onJ60fk=;
 b=bk8Q8Kh8bQUqrVTrSKhoO5Om1GtAKUnGGH60zUfVT+mEKfILn20SYkKk78eWYzZRKTcXtV
 3lJu/5RsHyBqpx9B9XPjUoDZktUhzdxhNGtMz2+/YetsPN+DGpbhRCNGTYSkSbGQBuF2NY
 krwdM7y3gWXNbqZ5hVeT4zc247jhKqz27fD5QvW46YzvtBUsqjMWegTq1ORVIfDJpp6Db9
 jXh/lMMvlHeJ3mNY3V3smIv+3++6lpfJGKaelv5Pv8I0GUKYntlhNIIm+JXgtU2dVf8kKM
 u9ej0FIseSKLk2kFhNynb2jaKQZWbfJ8WMu9fYc2oBRB2+hO+D8UmBQV8G0+Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bk8Q8Kh8
Subject: Re: [Buildroot] [PATCH/next 2/7] package/vulkan-loader: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Wed, 30 Aug 2023 13:54:41 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
> new file mode 100644
> index 0000000000..e09ecda8a9
> --- /dev/null
> +++ b/package/vulkan-loader/vulkan-loader.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  3bbaa5ee64058a89949eb777de66ce94bfe3141892514172cfc9451c756802d5  vulkan-loader-1.3.262.tar.gz
> +sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
> diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
> new file mode 100644
> index 0000000000..d87e57ebd4
> --- /dev/null
> +++ b/package/vulkan-loader/vulkan-loader.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# vulkan-loader
> +#
> +################################################################################
> +
> +VULKAN_LOADER_VERSION = $(VULKAN_HEADERS_VERSION)
> +VULKAN_LOADER_SITE = $(call github,KhronosGroup,Vulkan-Loader,v$(VULKAN_LOADER_VERSION))
> +VULKAN_LOADER_LICENSE = Apache-2.0
> +VULKAN_LOADER_LICENSE_FILES = LICENSE.txt
> ++VULKAN_LOADER_INSTALL_STAGING = YES

  ^^^ typo here, there was a "+" at the beginning of the line. Funnily,
  make did not complain about this, and just ignored this line, so
  vulkan-loader was not installed into staging.

I fixed that and applied to next. However, could you have a look at
whether we need to keep /usr/share/vulkan/registry/? It contains
JSON/Python stuff, I don't think it's useful at runtime?

Also, what is /usr/share/vulkan/icd.d/ ? I see there's an ICD tool in
vulkan-tools. Is that related? Needed on the target?

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
