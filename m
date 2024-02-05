Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADBFC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1523B40556;
	Mon,  5 Feb 2024 18:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1523B40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEb2bHQf5Kb2; Mon,  5 Feb 2024 18:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F8340494;
	Mon,  5 Feb 2024 18:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F8340494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCD91BF379
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620494194A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 620494194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGvun9-mfafW for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:14:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C72F441903
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72F441903
Received: by mail.gandi.net (Postfix) with ESMTPSA id B26C51BF208;
 Mon,  5 Feb 2024 18:14:25 +0000 (UTC)
Date: Mon, 5 Feb 2024 19:14:25 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240205191425.311409b0@windsurf>
In-Reply-To: <20240119072933.25453-1-buildroot@heine.tech>
References: <20240119072933.25453-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707156865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNmFzhyMKsyb5ajS/jEpLNitJVTybVwM9Ht7BhnlCFM=;
 b=ink7IxQZGaWxAasPgiUTxVkWEOu70LDlxHKSK9QIeZPJOte1sqq+UCjUzV6C2F1QP45Sa6
 iasqn4uxth1DB0U7rOrpw6amG9+ioiagG4AkjaQfshOHy6OiwoygOGbHuFaTzaxVb9Wciq
 6EHdprA5faERnY9gbuYrvqJRNPLD6aLogAQ8UwOP8pxQCxehSC/GADpsYMw1hafQFlmqXW
 h9sHn98thd2KiH106SOwCw7ECqP/frcoW5npYudK8z/SxXLMH1T4euk/P6O5fPN1yXajlA
 dB3X9sqfwEk6ILKTFWnctAiXniaKpkcMv8WJhax3Fq7QWOBrgMLy+7Rar6RkhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ink7IxQZ
Subject: Re: [Buildroot] [PATCH v2] package/protobuf-c: bump to version 1.5.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Fri, 19 Jan 2024 08:29:27 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - drops support for proto2
> - fixes compatibility with protobuf >= 22.0 (which we did not yet bump)
> - to be compatible with new protobuf versions c++17 is now required
>   when building with protoc (which we only do for the host package) [0]
>   hence require host gcc >= 7 for c++17 support, propagate to depending packets
> 
> [0] https://github.com/protobuf-c/protobuf-c/pull/673
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks, I've applied your patch, but after doing a few more changes.
See below.

First, you changed the hash of the license file, and that needs to be
explained in the commit log so that we have the visibility that you did
check why the license file has changed. Indeed, the sole reason for
having hashes for the license file is to detect changes in the
licensing terms. If we 'blindly' update the hash, we miss the point :-)

> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index d3b686771d..145b9a2a3a 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -738,6 +738,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
>  	# riemann-c-client -> protobuf-c
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
>  	select BR2_PACKAGE_RIEMANN_C_CLIENT
>  	select BR2_PACKAGE_LIBTOOL

Needed a Config.in comment (which indeed didn't exist until now for
existing dependencies).

>  	help
> @@ -772,6 +773,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
>  	bool "write_prometheus"
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c

Needed an update to the existing Config.in comment.

> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index 4c295acf4f..d223524eee 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	# BE/LE endian issues.
>  	depends on BR2_USE_MMU # libcap
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c

This shouldn't be in BR2_PACKAGE_CRIU_ARCH_SUPPORTS, because it's not
an architecture dependency. It should be on BR2_PACKAGE_CRIU, with the
appropriate Config.in comment update.

> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 7bde6c92af..ea2b33fca7 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -1,8 +1,9 @@
> -comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
> +comment "kismet needs a toolchain w/ threads, C++, gcc >= 5, host-gcc >= 7"

                                                                ^^^^^ we use "host gcc" everywhere, without the dash

> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
> index d96cd7b382..56b58afe99 100644
> --- a/package/protobuf-c/Config.in
> +++ b/package/protobuf-c/Config.in
> @@ -4,12 +4,13 @@ config BR2_PACKAGE_PROTOBUF_C
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# host-protobuf only builds on certain architectures
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # c++17

I've extended the comment to indicate that it is for the host package.
Otherwise, the next person coming will wonder why for C++17 we depends
on host gcc >= 7, and not target gcc >= 7.

Applied with those fixes. Thanks a lot for your contribution!

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
