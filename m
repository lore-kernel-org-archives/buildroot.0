Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A669E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 11:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CCF60A64;
	Mon, 30 Dec 2024 11:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA_peVWdHHCT; Mon, 30 Dec 2024 11:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA89606E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA89606E3;
	Mon, 30 Dec 2024 11:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E39D2CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C21A240193
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn12I-pi6TW2 for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 11:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5ECF1400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ECF1400D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ECF1400D0
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 11:00:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC1612000A;
 Mon, 30 Dec 2024 11:00:04 +0000 (UTC)
Date: Mon, 30 Dec 2024 12:00:03 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?=
 <jan.kundrat@cesnet.cz>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241230120003.68630295@windsurf>
In-Reply-To: <20241230103534.671602-5-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
 <20241230103534.671602-5-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735556405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMFIVh3fVWnJ13LazaCn1R5mExfrJQFYxWmiB6Cesxc=;
 b=nUw7H8A1bdNd8o4YbX0Cs6S9jRivMuc8e6IpNCPzYqkslIoF47jXs1deioIEtx7RwC9Uv4
 EWn3IXnP3Uu070POr4M0BH1SY+tPZajnqyqOmQidvAl0nWP4YN7FyCO4A/nV+iFW/Gd4Se
 KR1VY2mMGLqL52tOhmcjfhmybQIQmIYRduZ/MJCVkRnVmh2+N1cQbrpnTRDbVZNJo0vimZ
 iddDmzlyEpWPQl4+GAoyRTplxLf2ieKIULysjJTa7aGLVeZYSg7wCZKp5mONhdIi6k17NS
 /FKS9woDcqeUHaqzpbCyg5FMknpqonAs7WDjs3/0UA9iLjapCeXIbUAe4VHmsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nUw7H8A1
Subject: Re: [Buildroot] [PATCH v2 4/6] package/netopeer2: bump to version
 2.2.31
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

(Thanks for the v2 with all those improvements!)

On Mon, 30 Dec 2024 11:35:36 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:


> diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
> index db31a786a1..5adff14ac7 100644
> --- a/package/netopeer2/Config.in
> +++ b/package/netopeer2/Config.in
> @@ -14,9 +14,10 @@ config BR2_PACKAGE_NETOPEER2
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sysrepo
>  	select BR2_PACKAGE_LIBNETCONF2
>  	select BR2_PACKAGE_LIBSSH
> -	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH
> +	select BR2_PACKAGE_LIBSSH_SERVER # For libnetconf2 to have SSH/TLS support
> +	select BR2_PACKAGE_LIBCURL # For libnetconf2 to have SSH/TLS support
> +	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have SSH/TLS support

This is not needed, and the comment is not true: libnetconf2 now
requires openssl unconditionally, so this select is not needed.

>  	select BR2_PACKAGE_LIBYANG
> -	select BR2_PACKAGE_OPENSSL # For libnetconf2 to have TLS
>  	select BR2_PACKAGE_SYSREPO
>  	help
>  	  Netopeer2 is a set of tools implementing network configuration
> @@ -33,4 +34,19 @@ config BR2_PACKAGE_NETOPEER2_CLI
>  	help
>  	  Enable netopeer2 CLI.
>  
> +config BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT
> +	string "ssh authorized keys format"
> +	help
> +	  Enable netopeer2 CLI.

Hu, how is this option related to enabling the CLI ?


> +ifneq ($(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT)),)
> +NETOPEER2_CONF_OPTS += \
> +	-DSSH_AUTHORIZED_KEYS_FORMAT=$(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT))
> +endif

Perhaps:

NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT = $(call qstrip,$(BR2_PACKAGE_NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT))
ifneq ($(NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT),)
NETOPEER2_CONF_OPTS += \
	-DSSH_AUTHORIZED_KEYS_FORMAT="$(NETOPEER2_SSH_AUTHORIZED_KEYS_FORMAT)"
endif

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
