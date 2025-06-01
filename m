Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECC8C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 20:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4254F80F66;
	Sun,  1 Jun 2025 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2CvDWocUfs1; Sun,  1 Jun 2025 20:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B28980D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B28980D4E;
	Sun,  1 Jun 2025 20:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA95222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E6B680D4E
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSkPrsyP2WcO for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 20:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 044A080D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 044A080D3D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 044A080D3D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:30:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2E35E6012F;
 Sun,  1 Jun 2025 22:30:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 22:30:08 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 22:30:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250601080217.2514549-2-dario.binacchi@amarulasolutions.com>
References: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
 <20250601080217.2514549-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cf512465744653820fcfe0b5454443da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748809810;
 bh=l6BK1S6k/YOpQmO34A23/ga0pALsAak5wUAfvPoufSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tXoWfE36Xp2k3LrHP21ukB7iy6qLniuPiwO9FWUnpzpP/Ffe/ZVOkPrlZTWrORfr9
 rGcdkrR3h2UoiKmfMUaRRM9mMfQ3Ug4fCHiyV5ZHFniZviQ9ZLnBxfcWPVLfmK6Xoa
 XI3ReV8D6HOObgEnJug3X9SQHlHwYpHTBQkfCggZViYUQUW5HZEqEXE78oBFjUaQcz
 tXMGYB2y/7sqMnqF7G8uxPwyeLFf7ROwi5VfybR+hol8nW67UQ9zLz+P00rIiXQdgz
 +5VDQwh0njJzLYqJkKsn1f1R7LvF71Q21v3NS8BG8Vjt3sLUs9JnNHMAo+4wrYqzzB
 C4H4WeRu6bixg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tXoWfE36
Subject: Re: [Buildroot] [PATCH v2 2/2] package/canopenterm: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thanks for the patch.

On 01/06/2025 10:02, Dario Binacchi wrote:
> CANopenTerm is an open-source tool for developing, testing, and
> analyzing CANopen CC networks and devices. It provides a technical,
> no-nonsense solution for professionals working with CAN CC-based
> networks. Additionally, it supports SAE J1939 and OBD-II protocols,
> making it versatile for various applications.
> 
> Version v1.0.10 was chosen because it is the last one requiring SDL2.
> Indeed version v1.0.11 depends on SDL3.
> 
> Tested on STM32MP257F-EV1
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

[...]

> diff --git a/package/canopenterm/Config.in 
> b/package/canopenterm/Config.in
> new file mode 100644
> index 000000000000..2a7a3be29ba5
> --- /dev/null
> +++ b/package/canopenterm/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CANOPENTERM
> +	bool "canopenterm"
> +	depends on BR2_PACKAGE_CJSON
> +	depends on BR2_PACKAGE_INIH
> +	depends on BR2_PACKAGE_LIBSOCKETCAN
> +	depends on BR2_PACKAGE_LUA
> +	depends on BR2_PACKAGE_POCKETPY
> +	depends on BR2_PACKAGE_READLINE
> +	depends on BR2_PACKAGE_SDL2

It is a bit unusual in Buildroot for a package to have "depends on"
on all its package dependencies. It makes selection in kconfig harder.
See: 
https://buildroot.org/downloads/manual/manual.html#depends-on-vs-select

Could you change those to "select BR2_PACKAGE_..." instead?

Also, please make sure to bring all the "depends on" dependencies for 
all
those packages. For example, SDL2 has a "depends on !BR2_STATIC_LIBS".
It should be propagated here in the form:

     depends on !BR2_STATIC_LIBS # sdl2

> +	help
> +	  CANopenTerm is an open-source tool for developing,
> +	  testing, and analyzing CANopen CC networks and
> +	  devices.
> +
> +	  https://github.com/CANopenTerm/CANopenTerm

[...]

> diff --git a/package/canopenterm/canopenterm.mk 
> b/package/canopenterm/canopenterm.mk
> new file mode 100644
> index 000000000000..115b032d57b0
> --- /dev/null
> +++ b/package/canopenterm/canopenterm.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# canopenterm
> +#
> +################################################################################
> +
> +CANOPENTERM_VERSION = 1.0.10
> +CANOPENTERM_SITE = $(call 
> github,CANopenTerm,CANopenTerm,v$(CANOPENTERM_VERSION))
> +CANOPENTERM_LICENSE = MIT
> +CANOPENTERM_LICENSE_FILES = LICENSE.md
> +CANOPENTERM_DEPENDENCIES = cjson inih libsocketcan lua pocketpy 
> readline sdl2
> +
> +CANOPENTERM_CONF_OPTS = -DBUILD_YOCTO=ON -DCMAKE_VERBOSE_MAKEFILE=ON 
> -DCMAKE_FIND_DEBUG_MODE=ON

Is CMAKE_VERBOSE_MAKEFILE and CMAKE_FIND_DEBUG_MODE really needed here?

In Buildroot, Cmake packages can be made verbose using "make V=1 ...",
which is useful for debugging.

If those variables are not needed, could you remove those, please?

> +
> +$(eval $(cmake-package))
> --
> 2.43.0

Can you send an updated patch with those changes?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
