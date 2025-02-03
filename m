Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB37C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D974360887;
	Mon,  3 Feb 2025 22:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzH5OPLbVYlq; Mon,  3 Feb 2025 22:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38DE60EDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38DE60EDC;
	Mon,  3 Feb 2025 22:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9531A4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A71C81C19
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtDKV7PYZe8w for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4820D817E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4820D817E4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4820D817E4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:41:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1A4C43203;
 Mon,  3 Feb 2025 22:41:01 +0000 (UTC)
Date: Mon, 3 Feb 2025 23:41:00 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20250203234100.6c0a6835@windsurf>
In-Reply-To: <20250114072947.284965-3-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
 <20250114072947.284965-3-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudelgedrjeekrddvuddurddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelgedrjeekrddvuddurddvvddtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohephhgvihhkohdrthhhihgvrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopehjrghnrdhkuhhnughrrghtsegtvghsnhgvthdrtgii
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738622462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsQA+a//2j9wLgmvfAZDpkV5m/WJH3S4cnFIm6OSqDo=;
 b=LM2Qe9j1Iw5we+oEThGOP8iDDJjxn2yjeWLarEjYR4xKK9wfzbuzLErhAINY0l4Lk6fo+7
 3DVr4G4p1/CTdkoyB18P+jfuGSiwNnjwo5kTwHW52lYrfre1yrnbmPIDs5dmNeKF9AqoH8
 MBGhHiNxtNPrioFBhQUmQGO4yWTkwB4uQ7MEoKTtqtmZKc/0jrZJcGxYq/oCeBBaDNH688
 bjr3fz8iMmBuznOuGeywgoOwD5yJzDQh6OykZ6OxNPgfzcG/juRKUUKf2s0xWmH7b8XGJ4
 M4rzkiYdnt72199aJZbK7NAKspURi9xLt4KuAcs6WOCKF+dmFGgU8205iFln1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LM2Qe9j1
Subject: Re: [Buildroot] [PATCH v5 2/9] package/libnetconf2: bump version to
 3.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Tue, 14 Jan 2025 08:29:44 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I wanted to finally apply this, but unfortunately it's still not good :/

First of all, your commit log is entirely empty, with zero explanations
about the changes, even though there are non-trivial changes. Previous
iterations had some explanations, but this iteration has none.

> -LIBNETCONF2_VERSION = 2.1.28
> +LIBNETCONF2_VERSION = 3.5.5
>  LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
>  LIBNETCONF2_INSTALL_STAGING = YES
>  LIBNETCONF2_LICENSE = BSD-3-Clause
>  LIBNETCONF2_LICENSE_FILES = LICENSE
> -LIBNETCONF2_DEPENDENCIES = libyang
> +LIBNETCONF2_DEPENDENCIES = libyang openssl

In fact openssl is NOT a mandatory dependency of libnetconf2. If you
look at the CMakeLists.txt, OpenSSL is only needed when
ENABLE_SSH_TLS=ON (and still, when mbedtls is not available).

Yes, it fails to build without OpenSSL when ENABLE_SSH_TLS=OFF, but
that's a libnetconf2 that should be reported/fixed.

>  HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
> 
>  LIBNETCONF2_CONF_OPTS = \
>  	-DENABLE_TESTS=OFF \
>  	-DENABLE_VALGRIND_TESTS=OFF
> 
> -ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
> -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
> -LIBNETCONF2_DEPENDENCIES += libssh
> +ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBCURL),yy)
> +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
> +LIBNETCONF2_DEPENDENCIES += libssh libcurl
>  else
> -LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
> -LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
> -LIBNETCONF2_DEPENDENCIES += openssl
> -else
> -LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
> +LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
>  endif

The proper logic that matches what's in the CMakeLists.txt is more like this:

ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_PACKAGE_MBEDTLS):$(BR2_PACKAGE_LIBSSH)$(BR2_PACKAGE_LIBCURL),y:yy)
LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
LIBNETCONF2_DEPENDENCIES += libssh libcurl
ifeq ($(BR2_PACKAGE_MBEDTLS),y)
LIBNETCONF2_DEPENDENCIES += mbedtls
else
LIBNETCONF2_DEPENDENCIES += openssl
endif
else
LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
endif

However, as that's tricky, I think we could also accept a sub-option in
libnetconf2/Config.in:

config BR2_PACKAGE_LIBNETCONF2_SSH_TLS
	bool "SSH/TLS support"
	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
	select BR2_PACKAGE_LIBCURL
	select BR2_PACKAGE_LIBSSH


>  ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> @@ -37,8 +30,7 @@ endif
>  HOST_LIBNETCONF2_CONF_OPTS = \
>  	-DENABLE_TESTS=OFF \
>  	-DENABLE_VALGRIND_TESTS=OFF \
> -	-DENABLE_SSH=OFF \
> -	-DENABLE_TLS=OFF
> +	-DENABLE_TLS_SSH=OFF

This option doesn't exist, did you mean ENABLE_SSH_TLS=OFF ?

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
