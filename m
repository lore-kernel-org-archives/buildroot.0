Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D98C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8F1740141;
	Fri,  5 Jan 2024 08:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8F1740141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSBMmDr414iM; Fri,  5 Jan 2024 08:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5358D43553;
	Fri,  5 Jan 2024 08:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5358D43553
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13D241BF859
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCB6F60745
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB6F60745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fk-lBtWrf1zd for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:28:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A4A600CD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A4A600CD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26F04E0002;
 Fri,  5 Jan 2024 08:28:17 +0000 (UTC)
Date: Fri, 5 Jan 2024 09:28:16 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240105092816.4ea102f3@windsurf>
In-Reply-To: <20231128113635.3712892-1-buildroot@heine.tech>
References: <20231128113635.3712892-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704443297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgQOjf3NlFzo0/X06zTi69R+ueVPd682xw09XPEChec=;
 b=KoAty3WDmvXwUAxLSL+PvXUPAaM9pw/eXyJBtqHhceWT09VB3kb1i8xq9YyBCqBZJQkGpm
 8M9ncbzIbIKbafoTKIogvqMxSkeFyhbclXjLRsAkEn+3b74WHQm2GvYz0Z9ywavI8qy0TG
 roqcDZvrRrCtB7/IrpZ5IhNC2VNt9BGtGAyy6xTfus9KEPkyiMQWCY1E0QlhOUSGYCBO7F
 FpBHyZdktCHUvbPDi26tmAroX9dmxA0X6R9MW5irGA0KNWO+SRFWrtws7Z1qB0GhhgCMzK
 0NwePyY6oN/9/6lPkEWwvrKR3PQN55yYcJyfRC8yHL6CPv+2X95VI2XBYnBmdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KoAty3WD
Subject: Re: [Buildroot] [PATCH] package/protobuf-c: bump to version 1.5.0
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

Sorry for the delay in looking at your patch, and thanks for your
patch. A few questions below.

On Tue, 28 Nov 2023 12:36:34 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - drops support for proto2
> - fixes compatibility with protobuf >= 22.0

Is this fixing some build issues? We currently don't have protobuf >=
22.0 as far as I can see.

> - to be compatible with new protobuf versions c++17 is now required
>   when building with protoc (which we do for host) [0]
> - require host gcc >= 7 for c++17 support, propagate to depending packets

Why does this requirement of gcc >= 7 only applies to the host variant
of protobuf-c, not the target variant ?

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
>  	help
> @@ -772,6 +773,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
>  	bool "write_prometheus"
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
>  	select BR2_PACKAGE_LIBMICROHTTPD
>  	select BR2_PACKAGE_PROTOBUF_C
>  	help

We normally add a comment about Config.in dependencies, but admittedly
collectd/Config.in has none of these, so OK for this one.

> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index ff3bf30229..c36569f0b1 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -14,6 +14,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	# BE/LE endian issues.
>  	depends on BR2_USE_MMU # libcap
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c

This dependency is not an architecture, so it should be on
BR2_PACKAGE_CRIU, and the Config.in comment should be updated as well:

comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
        depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
        depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
                || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
                || BR2_TOOLCHAIN_USES_UCLIBC \
                || BR2_STATIC_LIBS || !BR2_USE_WCHAR

This package uses both the target and host variants of protobuf-c, so
the question is whether the target variant needs target gcc >= 7 or not
(as stated above).

> diff --git a/package/kismet/Config.in b/package/kismet/Config.in
> index 7bde6c92af..0ba6637ef7 100644
> --- a/package/kismet/Config.in
> +++ b/package/kismet/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_KISMET
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
>  	select BR2_PACKAGE_LIBPCAP
>  	select BR2_PACKAGE_PROTOBUF_C

Need an update of the Config.in comment.

> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
> index d96cd7b382..aa2f640658 100644
> --- a/package/protobuf-c/Config.in
> +++ b/package/protobuf-c/Config.in
> @@ -4,12 +4,13 @@ config BR2_PACKAGE_PROTOBUF_C
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# host-protobuf only builds on certain architectures
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # c++17
>  	help
>  	  Code generator and runtime libraries to use Protocol Buffers
>  	  from pure C (not C++).
>  
>  	  https://github.com/protobuf-c/protobuf-c
>  
> -comment "protobuf-c needs a toolchain w/ C++, threads"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "protobuf-c needs a toolchain w/ C++, threads and host gcc >= 7"

Instead of "and host gcc >= 7", just ", host gcc >= 7"

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_7
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
> index 6c3c35caf8..5508fd7a6d 100644
> --- a/package/riemann-c-client/Config.in
> +++ b/package/riemann-c-client/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
>  	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
>  	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c

Needs an updated of the Config.in comment.

I was going to fix these myself, but then I wondered about the
target/host question above, and I preferred to get back to you on this.
Could you clarify this point, and submit a v2 that fixes the Config.in
comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
