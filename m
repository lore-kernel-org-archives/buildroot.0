Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C84C2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E22460621;
	Sun,  4 Jan 2026 11:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go6CrPXys_Ei; Sun,  4 Jan 2026 11:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9A96062E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767525124;
	bh=GrPWT6ERWHPheK13x0v9DD+ULiTO498O/hG5bbwYYss=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WnRcoDgwV5hnSOTUT8bcShak5pvd+zPFIvlva1j5esALPdeIBfFiIvEux6LGLAsSi
	 RjeyDonEwNezR3vnHVIHk7/WIHXXB472mlRzyOYt7PbGACRsluL4d7hu4DudTrLVRj
	 oMD9cfMe6A2ZbWrayNuAfI5lENElLfJGSYVgHsd/ratIzzXaWI3nRcQmJxvrQn1hWG
	 45yc/jW/XmuZK0RfKg67WnrQg4xMomQjzBX7eKVcA+uPTE9ugL5M/pyI4qWKeW9cvC
	 es5MitcyLUelGHBF0ML+q6cghLdeIwX93ozMvYE6uWRZio4/amnwDrcL3z0ImAbYSO
	 3m1bYKtT1k3vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9A96062E;
	Sun,  4 Jan 2026 11:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1887B229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0029F80DD6
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WvT7N7Vmbef for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 11:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC7D680DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7D680DD3
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC7D680DD3
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:12:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 674F91A261B;
 Sun,  4 Jan 2026 11:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 275FE6072B;
 Sun,  4 Jan 2026 11:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1F36113B0449; Sun,  4 Jan 2026 12:11:57 +0100 (CET)
Date: Sun, 4 Jan 2026 12:11:56 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20260104121156.55338f61@windsurf>
In-Reply-To: <20250707055824.49575-1-dario.binacchi@amarulasolutions.com>
References: <20250707055824.49575-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767525118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/Th6M/I9lQnWq4fwu4nQ7PusoeQJtUzBZ8nRQgLTKN0=;
 b=OHRK4PdIRKDlSSzI0nJSkQJ7O5HEmqwA+TouDEwVi3dLP3oGKicrp56qL4mKsm3azhvDZz
 iJnKeWRpS325oib0GVCziDq5/qReytiQpPnS2+LShXJCAp7dda8LdnYcE2kwWpyjalyRYN
 jjAuqXN46H3xr81gBFoRQ/irI2dZP6LCCI1C/c05Kwh7MeqdsQFIhB67psVFAgtL7DxRJF
 WRSjCY3nRF3w1M70DyelnhpcjDLfuSzCfE6lapcU80jl1FRM+7KK4jcPAC5j+xyHcu83hM
 f0h6srEbZ3i1fNwKURrBUXxssnhJzPAfHrian8erf7wGGO5/m9OPIGaWTTboeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OHRK4PdI
Subject: Re: [Buildroot] [PATCH v5] package/canopenterm: new package
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

Hello Dario,

Sorry for the very long delay in getting back to you.

On Mon,  7 Jul 2025 07:58:24 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> CANopenTerm is an open-source tool for developing, testing, and
> analyzing CANopen CC networks and devices. It provides a technical,
> no-nonsense solution for professionals working with CAN CC-based
> networks. Additionally, it supports SAE J1939 and OBD-II protocols,
> making it versatile for various applications.
> 
> Version v1.0.10 was chosen because it is the last one requiring SDL2.
> Indeed version v1.0.11 depends on SDL3.

This is unfortunately already a red flag. Merging a brand new package
for which we from the start can't use the latest version because we're
missing some dependencies to build the latest releases really isn't
good. So we need to package SDL3.

BTW, it's weird that it *must* use SDL. This thing is a graphical
application? Cannot be built as a command line tool?

> diff --git a/package/canopenterm/Config.in b/package/canopenterm/Config.in
> new file mode 100644
> index 000000000000..62dbecb37cd3
> --- /dev/null
> +++ b/package/canopenterm/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_CANOPENTERM
> +	bool "canopenterm"
> +	depends on BR2_INSTALL_LIBSTDCPP # pocketpy
> +	depends on BR2_PACKAGE_LUA

Can you try using BR2_PACKAGE_HAS_LUAINTERPRETER instead, and check if
it builds fine when luajit is selected as a Lua interpret?

> +	depends on !BR2_STATIC_LIBS # pocketpy and SDL2

				# pocketpy, sdl2

> +	select BR2_PACKAGE_CJSON
> +	select BR2_PACKAGE_INIH
> +	select BR2_PACKAGE_LIBSOCKETCAN
> +	select BR2_PACKAGE_POCKETPY
> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_SDL2
> +	help
> +	  CANopenTerm is an open-source tool for developing,
> +	  testing, and analyzing CANopen CC networks and
> +	  devices.
> +
> +	  https://github.com/CANopenTerm/CANopenTerm

Missing Config.in comment about the C++, dynamic library and lua
dependencies.

> +CANOPENTERM_VERSION = 1.0.10
> +CANOPENTERM_SITE = $(call github,CANopenTerm,CANopenTerm,v$(CANOPENTERM_VERSION))
> +CANOPENTERM_LICENSE = MIT
> +CANOPENTERM_LICENSE_FILES = LICENSE.md
> +CANOPENTERM_DEPENDENCIES = cjson inih libsocketcan lua pocketpy readline sdl2
> +
> +CANOPENTERM_CONF_OPTS = -DBUILD_YOCTO=ON

If I understand correctly this BUILD_YOCTO=ON option is about asking
the build system to use external libraries instead of bundled ones? If
my understanding is correct, then a small comment about this line would
be useful, as it's not quite obvious why it's called BUILD_YOCTO=ON.

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
