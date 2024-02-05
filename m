Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76DA417C9;
	Mon,  5 Feb 2024 10:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76DA417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sctMQTaRnUu; Mon,  5 Feb 2024 10:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2876341568;
	Mon,  5 Feb 2024 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2876341568
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F422C1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE206417B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE206417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EufYAB4OcGeF for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:14:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8623D40978
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8623D40978
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A6A2E000A;
 Mon,  5 Feb 2024 10:14:34 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:14:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205111433.1a82d7e2@windsurf>
In-Reply-To: <20240131213512.2261698-1-fontaine.fabrice@gmail.com>
References: <20240131213512.2261698-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707128074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzCr5AgO5DALXbtNjd6ycKp7QXSnWFg2lFboD/kXnhU=;
 b=oqwFKhxrHiQPnbXH6oaOVXsgZj+L4TzuPqLYAQyAnNC3XIbapY6/q6rFKAwPZTIy+bKKsQ
 EY99vu1A2548/27qOTIRljPhJ0Bft6NipWe5+5SXIlOv3uAg7W7Z/7Y0Egi7ZXmVaEzI0/
 NO5cHynZ/HxaWOdj4WakvaFp43+IcCs2s67Zv7jWGjWMWVyEWI4lBNaKBz0cWFcJOSWLEe
 1R6YqUw3kED4Snt9G2AlKBz+HhN/up2ERljyBOdmMXmRLTTeC0ATmbrWpyRWaeHW/A0eoB
 eaQJERBtmqV8uJoPS1u/4LsLTtIcxIFrf67ipNkR5LC/hIgGkSZf6JRH/95owA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oqwFKhxr
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version
 4.3.3
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

On Wed, 31 Jan 2024 22:35:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop first patch (already in version)
> 
> https://github.com/warmcat/libwebsockets/compare/v4.3.2...v4.3.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...Lists.txt-fix-build-with-pkg-config.patch} |  0
>  ...eLists.txt-fix-build-without-threads.patch | 47 -------------------
>  package/libwebsockets/libwebsockets.hash      |  2 +-
>  package/libwebsockets/libwebsockets.mk        |  2 +-
>  5 files changed, 2 insertions(+), 50 deletions(-)
>  rename package/libwebsockets/{0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch => 0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch} (100%)
>  delete mode 100644 package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch

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
