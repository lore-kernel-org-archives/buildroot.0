Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF9FC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B16B40181;
	Sat, 29 Jul 2023 21:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B16B40181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XX88ETAJVoe8; Sat, 29 Jul 2023 21:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5216E404E2;
	Sat, 29 Jul 2023 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5216E404E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC8151BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7224340111
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7224340111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tm7Fs9vv08nh for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:13:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9174010D
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9174010D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4295560002;
 Sat, 29 Jul 2023 21:13:09 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:13:08 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230729231308.1d795ee8@windsurf>
In-Reply-To: <20230522202346.209785-1-christian@aperture.us>
References: <20230522202346.209785-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690665190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4bVg9LvTRxhnOxEl6ZiisblkhYNOk6wgz7uNZ5FLy0=;
 b=lbqX3Z15bEE7Vy8XuTUzmLfxelnMh5aQWEShPOzR49L0yutkKl4rRDeFu+3QN7En2qwSHX
 OGT+K/U3UhY5MAfZwzZ+3HdOAT0AemuV0z7eVBAu5GJGxz9yGCjlmJ/Yv2c3XBoYXQZ8/R
 qucjYLzIV9JW7bDwDFKpzriSHA8vm/JjthW+tfLcL8TG0OWHq67Ux02v9Ur5Eb2COYSway
 mkocu3u4s6A9RYKpaK+jdZ9WjU3NypqjLInYrxlwaAbg+di9u6CKIFe/RswXlUH6LAwQga
 SHHkiEESsBBLN05uyoHlMxJ4zOGWh1ggqcr3H5nX+Vl05ImZ7z5ataoqTG4qDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lbqX3Z15
Subject: Re: [Buildroot] [PATCH v3 1/2] package/conmon: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon, 22 May 2023 13:23:45 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Conmon is an OCI container runtime monitor.
> 
> https://github.com/containers/conmon
> 
> Dependency of podman.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

I've applied with a few changes, see below. I also have a request.

> diff --git a/package/conmon/Config.in b/package/conmon/Config.in
> new file mode 100644
> index 0000000000..65f693a29e
> --- /dev/null
> +++ b/package/conmon/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CONMON
> +	bool "conmon"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

This is incorrect: uClibc has fexecve() since its commit
858ffad217076227089cc17eb832db0bd1497792, merged in uClibc 1.0.33, so
quite a while ago. I think all the packages that have this:

package/balena-engine/Config.in:        depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
package/cni-plugins/Config.in:  depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
package/crun/Config.in: depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
package/embiggen-disk/Config.in:        depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
package/lxc/Config.in:  depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
package/runc/Config.in: depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

should be revisited, because uClibc now has fexecve(). Maybe they still
don't build with uClibc for some other reason, but it's no longer the
lack of fexecve().

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  Conmon is an OCI container runtime monitor.
> +
> +	  https://github.com/containers/conmon
> +
> +comment "conmon needs a glibc or musl toolchain w/ threads, wchar"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_TOOLCHAIN_USES_UCLIBC

Tweaked that accordingly.

> +	depends on BR2_USE_MMU
> diff --git a/package/conmon/conmon.hash b/package/conmon/conmon.hash
> new file mode 100644
> index 0000000000..82d1d14ba3
> --- /dev/null
> +++ b/package/conmon/conmon.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  7d0f9a2f7cb8a76c51990128ac837aaf0cc89950b6ef9972e94417aa9cf901fe  conmon-2.1.7.tar.gz
> +sha256  9c9d771d4004725237a31ada889fe06c85a24fd0a29e41825181ab4cde54f016  LICENSE
> diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
> new file mode 100644
> index 0000000000..dfac23189f
> --- /dev/null
> +++ b/package/conmon/conmon.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# conmon
> +#
> +################################################################################
> +
> +CONMON_VERSION = 2.1.7
> +CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
> +CONMON_LICENSE = Apache-2.0
> +CONMON_LICENSE_FILES = LICENSE
> +
> +CONMON_DEPENDENCIES += host-pkgconf libglib2

Changed += to =, as its unconditional.

> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +CONMON_DISABLE_SECCOMP = 0
> +CONMON_DEPENDENCIES += libseccomp
> +else
> +CONMON_DISABLE_SECCOMP = 1
> +endif
> +
> +define CONMON_CONFIGURE_CMDS
> +	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
> +		$(@D)/hack/seccomp-notify.sh
> +	chmod +x $(@D)/hack/seccomp-notify.sh
> +endef

I merged as-is, but I really think a better solution would be to fix
the upstream script. The original script goes like this:

#! /usr/bin/env bash
if $(printf '#include <linux/seccomp.h>\nvoid main(){struct seccomp_notif_sizes s;}' | cc -x c - -o /dev/null 2> /dev/null && pkg-config --atleast-version 2.5.0 libseccomp); then
        echo "0"
fi

I believe the only thing that is needed is to replace the hardcoded
"cc" by ${CC} and have the Makefile invoking this script pass
CC=<value> in the environment when calling the script. Then the script
would work as-is with Buildroot, and we would no longer need to hack.

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
