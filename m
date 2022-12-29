Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02753C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF8240881;
	Thu, 29 Dec 2022 09:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CF8240881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkKBhgRIoc7x; Thu, 29 Dec 2022 09:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875164085B;
	Thu, 29 Dec 2022 09:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875164085B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2432D1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F422660C31
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F422660C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UYjgi-x8V9F for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:02:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C406605B7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C406605B7
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:02:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39068240007;
 Thu, 29 Dec 2022 09:02:50 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:02:49 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229100249.373ee881@windsurf>
In-Reply-To: <20221228221522.280696-1-fontaine.fabrice@gmail.com>
References: <20221228221522.280696-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRn3KShxRlhFFkeJmdeJFGXzyAHvusD5l1EePMWduPM=;
 b=lK5HqMjY2ShTiD9A+1nk2zxD4Le1zfNPKFOdxAK/kqKaPkH+GB2qisvTUMz+N33wA0L6Oj
 NY3ePUBZ24gRtoZQ8yyjWK6S2CpfSbzN8Nc/RFHqGPlBYccfMdjKs6Y07s9pq+pk29Pn7A
 UOelVd9KwGPiYNeJfk+xKVFYfqo5bkF6iT9dBdHTKcSGXGWbo0pWp+N0TlQGFQ0g6lj03C
 UgbJwpEfd+TnQ1vYISUBLwQR0FAoih0VF3aPA92ittxk4wd9uKVASY5GAENVaKeYqS807+
 G0tJrylt50PV/fgWirIxwEpxr4UXU9KNQPve8NQp+un8LFeNDj98fQSOEq3h2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lK5HqMjY
Subject: Re: [Buildroot] [PATCH 1/2] package/xxhash: fix static library
 install
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Dec 2022 23:15:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Install headers when building statically
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied thanks. One suggestion below.

>  ifeq ($(BR2_STATIC_LIBS),y)
>  XXHASH_TARGETS += libxxhash.a libxxhash.pc
> -XXHASH_INSTALL_TARGETS += install_libxxhash.a install_libxxhash.pc
> +XXHASH_INSTALL_TARGETS += \
> +	install_libxxhash.a \
> +	install_libxxhash.includes \
> +	install_libxxhash.pc
>  else ifeq ($(BR2_SHARED_LIBS),y)
>  XXHASH_TARGETS += libxxhash libxxhash.pc
> -XXHASH_INSTALL_TARGETS += install_libxxhash install_libxxhash.pc
> +XXHASH_INSTALL_TARGETS += \
> +	install_libxxhash \
> +	install_libxxhash.includes \
> +	install_libxxhash.pc
>  else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
>  XXHASH_INSTALL_TARGETS += \
> -	install_libxxhash.a install_libxxhash install_libxxhash.pc
> +	install_libxxhash.a \
> +	install_libxxhash \
> +	install_libxxhash.includes \
> +	install_libxxhash.pc
>  endif

This could be slightly "optimized", to reduce a bit the duplication:

XXHASH_INSTALL_TARGETS = \
	install_libxxhash.includes \
	install_libxxhash.pc

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
XXHASH_INSTALL_TARGETS += install_libxxhash.a
endif

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
XXHASH_INSTALL_TARGETS += install_libxxhash
endif

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
