Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE5AEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 09:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082E660AC9;
	Fri, 14 Jul 2023 09:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082E660AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1A7eswbHjDHi; Fri, 14 Jul 2023 09:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4862360A94;
	Fri, 14 Jul 2023 09:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4862360A94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA9D1BF97C
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 09:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1184179F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 09:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B1184179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pGJNi2mQcwj for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 09:58:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7034173B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E7034173B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 09:58:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB1F260005;
 Fri, 14 Jul 2023 09:58:36 +0000 (UTC)
Date: Fri, 14 Jul 2023 11:58:35 +0200
To: prabhu sannachi via buildroot <buildroot@buildroot.org>
Message-ID: <20230714115835.3d1f1b02@windsurf>
In-Reply-To: <20221007211932.481-1-prabhu.sannachi@collins.com>
References: <20221007211932.481-1-prabhu.sannachi@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689328717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Wk4JhdGjnpSUomfl/L5Juyboucoh5sJa+A457Cq7U8=;
 b=TzWTFIj/MSGxHX4pK3LRYBcKizt/T4+AO9s1c2GqyK3VkGq07nZTZrfwd/dCPxlj+zkloc
 m0wd/mzQtDdIuQ+ZzK15PHT+Lte4nn1S46D9jwNkGUcfuOGt7cqtJTkIJZrYov/RkBHXaI
 TD0NSvQXouvzuL/GYoEGVzc2heX5hMpQoHKh7us24XaedNuJiqvNaUK2J56BlcJaQH2t3W
 QR/2h47Tcb/gUg7RyzPCQIF0OTQn25+d6TPyEBJX28aTYx088mvT7BLOWATIxNG87bgk9A
 hwBZG8uqRCe1HV9ygAeR5xTEls6tc7pPcrmyw/VXoCdZo9JeaCCx3zNJy4UIqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TzWTFIj/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/redis-plus-plus: new package
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
Cc: prabhu sannachi <prabhu.sannachi@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Prabhu,

After many months, I finally took the time to look at your patch and
apply it. A number of changes where needed, see below.

On Fri,  7 Oct 2022 16:19:32 -0500
prabhu sannachi via buildroot <buildroot@buildroot.org> wrote:

> From: prabhusannachi <prabhu.sannachi@collins.com>

The "From:" should match the Signed-off-by line, so I fixed that up.

> +N:      Prabhu Sannachi <prabhu.sannachi@collins.com>
> +F:      package/redis-plus-plus/

Indentation between N:/F: and the value is one tab.

> diff --git a/package/redis-plus-plus/Config.in b/package/redis-plus-plus/Config.in
> new file mode 100644
> index 0000000..3c23dc5
> --- /dev/null
> +++ b/package/redis-plus-plus/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_REDIS_PLUS_PLUS
> +	bool "redis-plus-plus"
> +	select BR2_PACKAGE_HIREDIS

Missing depends on BR2_INSTALL_LIBSTDCPP, since this software is
written in C++. And also the corresponding Config.in comment.

> +REDIS_PLUS_PLUS_VERSION =  1.3.5

Only one space after =

> +REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
> +REDIS_PLUS_PLUS_LICENSE =  Apache-2.0 license

Only one space after =, just "Apache-2.0", without "license"
afterwards. We use SPDX license codes.

> +REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
> +REDIS_PLUS_PLUS_INSTALL_STAGING = YES
> +REDIS_PLUS_PLUS_DEPENDENCIES += hiredis

Just = instead of +=.

> +# since version 1.3.0, by default, redis-plus-plus is built with the -std=c++17 standard
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),)

is more commonly used in Buildroot.

> +  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
> +    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=14
> +  else
> +    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=11
> +  endif
> +endif

We don't typically indent such code blocks.

> +
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
> +  REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_BUILD_TEST=OFF
> +endif

We disable tests unconditionally usually, so I've done that as well.

Final commit at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c46df9de21e718a9ed6a2df2bb945c386695d3bf

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
