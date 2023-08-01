Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11317C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBEC61179;
	Tue,  1 Aug 2023 21:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBEC61179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdcAWanVPNEd; Tue,  1 Aug 2023 21:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB0761160;
	Tue,  1 Aug 2023 21:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB0761160
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74A7D1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C7A60DFC
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C7A60DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrL3rn979c7A for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:09:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6009C606A0
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6009C606A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CAA1BF205;
 Tue,  1 Aug 2023 21:09:32 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:09:31 +0200
To: carrier.nicolas0@gmail.com
Message-ID: <20230801230931.296eeb62@windsurf>
In-Reply-To: <20230119132856.1801425-3-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
 <20230119132856.1801425-3-carrier.nicolas0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eAYyLTM5HGdustk33KF/8lukXm221+kjqtq9hFhenc=;
 b=XL3PcarCcYVwB31FyGGDjWxdvHM+fGrX7086TjXdPaqqVvPiol275P0QpRMgFaDyFgNz1x
 sBaf6s/xvglET67//ex/nzeuSBdw78rOPD38iaMg5QfRdoW0YZg/O4Epw7PG8eES3j8wN6
 N4oHh57nkHj8eTDTsZzmADBF+hSpvefMdkj6y7E0DPCxlv3RN3X3I60v+/5HdVIT9WnzAM
 ThZRqgAFx3pMRsEAMI2d0YUef8GcjlSu0JweDrT+JNSnzVsS0nVXhRnQ9MoMBsLZywMpHd
 32iByN77kjRKX1tauXd/ErMiyvDi0pp2MTh0uzXpgwze5RHtrWzXyL4a7Ye8pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XL3PcarC
Subject: Re: [Buildroot] [PATCH 2/3] package/php/php.mk: add host-php
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 19 Jan 2023 14:28:55 +0100
carrier.nicolas0@gmail.com wrote:

> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> having a working PHP with the correct version, is mandatory for executing
> some PHP tools, such as composer, when building packages.
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>

Tweaked commit title as:

	package/php/php: add a host variant

and it should have been:

	package/php: add a host variant

but I messed up.

> diff --git a/package/php/php.mk b/package/php/php.mk
> index 23dd4ba96f..bd301254d4 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -14,6 +14,24 @@ PHP_DEPENDENCIES = host-pkgconf pcre2
>  PHP_LICENSE = PHP-3.01
>  PHP_LICENSE_FILES = LICENSE
>  PHP_CPE_ID_VENDOR = php
> +
> +# This host php is installed in $(HOST_DIR), as it is needed
> +# to use composer.

This comment was not really useful: all host packages are installed in
$(HOST_DIR). So I dropped this comment.

> +
> +HOST_PHP_CONF_OPTS += \
> +	--disable-all \
> +	--without-pear \
> +	--with-config-file-path=/etc \
> +	--disable-phpdbg \
> +	--enable-phar \
> +	--enable-json \
> +	--enable-filter \
> +	--enable-mbstring \
> +	--enable-tokenizer \
> +	--with-openssl=$(HOST_DIR)/usr
> +
> +HOST_PHP_DEPENDENCIES += host-oniguruma host-openssl host-pkgconf

I moved both of these to the bottom of the file, to have first all the
stuff related to target PHP, and the all the stuff related to host PHP.

I replaced the += by = signs, since these assignments are not within
conditions.

I was also puzzled by the discrepancy in dependencies between target
and host PHP:

- target PHP depends on host-pkgconf and pcre2
- your host PHP proposal depends on host-onigurama host-openssl and host-pkgconf

So I added host-pcre2 in the dependencies, and added the option
--with-external-pcre to be on par with what we're doing for the target
PHP. host-onigurama is needed for --enable-mbstring, and host-openssl
for --with-openssl.

--with-openssl=$(HOST_DIR)/usr had to be changed to
--with-openssl=$(HOST_DIR) (we no longer used a usr/ subdir, and this
line was causing a check-package warning).

--with-config-file-path=/etc was changed to
--with-config-file-path=$(HOST_DIR)/etc.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
