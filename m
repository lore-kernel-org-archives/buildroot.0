Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA464E748E5
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65681410B0;
	Sat, 30 Sep 2023 19:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65681410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEpPvMOsZYU3; Sat, 30 Sep 2023 19:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9814221C;
	Sat, 30 Sep 2023 19:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9814221C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045251BF3B9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C390282C38
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C390282C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3UWvkQgMhhU for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:49:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 146C08212D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146C08212D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A6FCFF806;
 Sat, 30 Sep 2023 19:49:08 +0000 (UTC)
Date: Sat, 30 Sep 2023 21:49:08 +0200
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20230930214908.43fe7898@windsurf>
In-Reply-To: <20230930191455.757426-1-takumiiinn@gmail.com>
References: <20230930191455.757426-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696103350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vbZaky4m7XX2a33XYYazJ1fBGHKVdAHJAuDX+9Nhnk=;
 b=SvWJE3jrUxQQZG0GBGtEEqFzIeGPdJOKdTl7uyn4F1z+piiVajANn5dJJRf60chqBVZh1o
 14Iv79wUz1URxc1pf3Vjd0RahQTve0KqJa/LwOeT6HopgQwkfSbNKxwRZodjdrqwrmQ0Z7
 B8w+I64+RjUgxzX2ja8I4gLhkeJTNjeFb+7usiZNOjNsGOveeysLbKIyShfBHMhA0Xr0GD
 lCJngEn+DG28vJ9SGtiG4EyMzSSsmo7zTh+XGqsGookVskofMKxOb9vzJSY7swKONwSNfi
 LCPqR9FivJgHmwx89a6uy5tWDYro8ejoQQ2a7Nj3o0tCRJYjmnTa/v+a3sLNkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SvWJE3jr
Subject: Re: [Buildroot] [PATCH] package/itstool: new host package
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

Hello,

Thanks also for this patch. See below some comments.

On Sun,  1 Oct 2023 04:14:54 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> Translate XML with PO files using W3C Internationalization Tag Set rules

We need your Signed-off-by: line here.

Also, it would be useful to have some details in the commit log on the
why it makes sense to have this package as a host package, like how it
gets used by you.

> ---
>  package/itstool/itstool.hash |  4 ++++
>  package/itstool/itstool.mk   | 15 +++++++++++++++
>  2 files changed, 19 insertions(+)

Please add an entry in the DEVELOPERS file for this package.

As it seems to be a "user-facing" tool, it probably needs a
Config.in.host file, included from package/Config.in.host.

> +ITSTOOL_VERSION = 2.0.7
> +ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
> +ITSTOOL_LICENSE = GPL-3.0+
> +ITSTOOL_LICENSE_FILES = COPYING COPYING.GPL3

> +HOST_ITSTOOL_DEPENDENCIES = host-python3 host-libxml2

I don't think host-libxml2 is going to be sufficient here, as we don't
build the Python bindings:

HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python

So it looks like a new option in package/libxml2/Config.in.host would
be needed, to request building the Python bindings.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
