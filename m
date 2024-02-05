Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F3C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535E84177C;
	Mon,  5 Feb 2024 09:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535E84177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d76V47M9l_p; Mon,  5 Feb 2024 09:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 369F041691;
	Mon,  5 Feb 2024 09:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369F041691
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0201BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6648160E83
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6648160E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIE_dOnFukrX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:54:34 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1DA3607F5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1DA3607F5
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so2323022f8f.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 01:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707126872; x=1707731672;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=joWFGdlNvSXzf178TdVvRBbbM9VSf1RVZfCfAO6u0iI=;
 b=Dg8bINJ1weCmNws2vl9jV18UI9VZ2JkFGFPLivr3bgnvpk/qU1SRDVLzky/Yadol7Y
 PB/HxVyPGC/guAOVvZIzuUnhh56XcDQrVAq+qcOH+oNu9HzUj0u3zpMLbNPHNZj2pwF3
 169eRQyxQeqMYFEGwN32CSJS8Wu69PFVVvYnb4ALgazOfLZjAnuLHXiR81qqCCiuZRGF
 oVpdmIvXL9LCirp5cW0ZwlZIAL0Zud5IDBteVEHfe7fIHAqOhPlsrVLF4nOR32Bncx7Z
 b2Xo6XKFi9uJ5ydjHDGnU7gW6MnEH6q2OR5HfsjZA3QdVgLI96pUfFzRJ9xMf3tFOWk8
 z/rQ==
X-Gm-Message-State: AOJu0Yx5qFpubitYrAnb97ZSnHUekKpDsdVzsTnWE/fRdhhjaKhfeUJQ
 nDSx49IZAo15HjpSHezuUKBO/GoJ/UQzCKx+AeHrGOvukaFlXPvDPypmNFKC3yHGVszUDzb1yPG
 L
X-Google-Smtp-Source: AGHT+IEID1JzarDw8f4vLO9K8xIF6MFV8LTMhbbXj9ZfjLguzR467Dg+sERmB2pDUt2f9R8jMQJ/sA==
X-Received: by 2002:adf:ed10:0:b0:33a:e9dd:5b6b with SMTP id
 a16-20020adfed10000000b0033ae9dd5b6bmr6578330wro.9.1707126871638; 
 Mon, 05 Feb 2024 01:54:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVfJK7VMYdXmUK5XYy9TLvoS3oG0lDad3FGea76TaxIDrR9BnqXViubgvWy77OmJb5f7oAQemrUJqk7aapk+6RLGutNY+LpZw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056000018800b0033b3bb05e19sm2421089wrx.32.2024.02.05.01.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:54:31 -0800 (PST)
Message-ID: <bb86e02f-1b6e-43b4-9188-f84930f7e226@mind.be>
Date: Mon, 5 Feb 2024 10:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240122160949.4052959-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240122160949.4052959-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707126872; x=1707731672; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=joWFGdlNvSXzf178TdVvRBbbM9VSf1RVZfCfAO6u0iI=;
 b=cny07myPCfv06h5jq5Ffu+0ZtpYxEF5XlMPu0LxGYkaVnGGc25OVH12PSV310zRfr/
 9kcuNmM1Vxkp0C0L/hLp9cgCEkqHJjqypsqu823QuHh2px3QmH/iEQPoTm35EEwHBh9h
 a3D98Wp35oCVLw4hv0rgQLZuAusFdnnVHEX3QMkuVciidoLrogzXehTvwgfHCU0rMArT
 2DrBfAJ7DouU3r6YFZThdgtui6Xan7jnU/zvgzOLb4+j7FZGDe0pHV3KqcevhjzC2rd3
 mpunxdTk37W2PLYGgOE1YAFU99cQ7sDJQH+60OwTwbSF3A/B3E9pTJhqtZdbj6y/3Uit
 uzGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cny07myP
Subject: Re: [Buildroot] [PATCH v2] package/libblockdev: bump to version
 3.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/01/2024 17:09, Giulio Benetti wrote:
> * Rework strerror_l() patch by declaring it only in utils.h as a macro
> * select BR2_PACKAGE_UTIL_LINUX_LIBUUID since it's now mandatory
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * reworked local strerror_l() patch as a macro to avoid adding a second patch
> * selected BR2_PACKAGE_UTIL_LINUX_LIBUUID by default
> ---
>   ...-replacement-function-for-strerror_l.patch | 160 ++++--------------
>   package/libblockdev/Config.in                 |   5 +-
>   package/libblockdev/libblockdev.hash          |   2 +-
>   package/libblockdev/libblockdev.mk            |   2 +-
>   4 files changed, 35 insertions(+), 134 deletions(-)
> 
> diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> index 987d28f82e..e5819a4e9c 100644
> --- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> +++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> @@ -1,29 +1,25 @@
> -From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sat, 29 Aug 2020 16:04:15 +0200
> +From 01883cc14904e55d90955ad7cd9fc55bc18364ac Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>

  You really should have kept Thomas as the author.

> +Date: Sat, 20 Jan 2024 13:29:28 +0100
>   Subject: [PATCH] Provide replacement function for strerror_l()
>   
>   strerror_l() is not implemented in some C libraries, such as uClibc,
> -so let's provide a simple replacement function that falls back on
> -strerror().
> +so let's provide a simple replacement define that falls back on
> +strerror() in utils.h header and include it where missing.
>   
> -Upstream status: Not Applicable since it's due uclibc only
> +Upstream: N/A since it's due uclibc only

  This fixes check-package, so it must be removed from .checkpackageignore.


  Applied to master with those two fixed, thanks.

  Regards,
  Arnout

>   
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>   Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -[Giulio: ported to version 3.0+]
> +[Giulio: ported to version 3.0 and 3.1]
>   ---
> - configure.ac                    | 2 ++
> - src/plugins/crypto.c            | 7 +++++++
> - src/plugins/nvme/nvme-error.c   | 8 ++++++++
> - src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
> - src/plugins/nvme/nvme-op.c      | 8 ++++++++
> - src/plugins/part.c              | 9 +++++++++
> - src/utils/module.c              | 8 +++++++-
> - 7 files changed, 49 insertions(+), 1 deletion(-)
> + configure.ac       | 2 ++
> + src/utils/module.c | 1 +
> + src/utils/utils.h  | 4 ++++
> + 3 files changed, 7 insertions(+)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 0a8ce4a7..dfbddb39 100644
> +index 02b26e3e..67341134 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
> @@ -35,127 +31,33 @@ index 0a8ce4a7..dfbddb39 100644
>    AC_ARG_WITH([escrow],
>        AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
>        [],
> -diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
> -index c5f719ca..b2ae3f56 100644
> ---- a/src/plugins/crypto.c
> -+++ b/src/plugins/crypto.c
> -@@ -62,6 +62,13 @@
> -
> - #define UNUSED __attribute__((unused))
> -
> -+#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+	return strerror(errnum);
> -+}
> -+#endif
> -+
> - /**
> -  * SECTION: crypto
> -  * @short_description: plugin for operations with encrypted devices
> -diff --git a/src/plugins/nvme/nvme-error.c b/src/plugins/nvme/nvme-error.c
> -index 4bd4d771..618b6aef 100644
> ---- a/src/plugins/nvme/nvme-error.c
> -+++ b/src/plugins/nvme/nvme-error.c
> -@@ -34,6 +34,14 @@
> - #include "nvme.h"
> - #include "nvme-private.h"
> -
> -+#define UNUSED __attribute__((unused))
> -+
> -+#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+    return strerror(errnum);
> -+}
> -+#endif
> -
> - /**
> -  * bd_nvme_error_quark: (skip)
> -diff --git a/src/plugins/nvme/nvme-fabrics.c b/src/plugins/nvme/nvme-fabrics.c
> -index 1877845f..5fcbeddc 100644
> ---- a/src/plugins/nvme/nvme-fabrics.c
> -+++ b/src/plugins/nvme/nvme-fabrics.c
> -@@ -36,6 +36,14 @@
> - #include "nvme.h"
> - #include "nvme-private.h"
> -
> -+#define UNUSED __attribute__((unused))
> -+
> -+#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+    return strerror(errnum);
> -+}
> -+#endif
> -
> - /* nvme-cli defaults */
> - #define PATH_NVMF_CONFIG  "/etc/nvme/config.json"
> -diff --git a/src/plugins/nvme/nvme-op.c b/src/plugins/nvme/nvme-op.c
> -index dbef4f3a..7bafd7a3 100644
> ---- a/src/plugins/nvme/nvme-op.c
> -+++ b/src/plugins/nvme/nvme-op.c
> -@@ -35,6 +35,14 @@
> - #include "nvme.h"
> - #include "nvme-private.h"
> -
> -+#define UNUSED __attribute__((unused))
> -+
> -+#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+    return strerror(errnum);
> -+}
> -+#endif
> -
> - /**
> -  * bd_nvme_device_self_test:
> -diff --git a/src/plugins/part.c b/src/plugins/part.c
> -index 46d31137..6234e013 100644
> ---- a/src/plugins/part.c
> -+++ b/src/plugins/part.c
> -@@ -26,6 +26,15 @@
> -
> - #include "part.h"
> -
> -+#define UNUSED __attribute__((unused))
> -+
> -+#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+	return strerror(errnum);
> -+}
> -+#endif
> -+
> - /**
> -  * SECTION: part
> -  * @short_description: plugin for operations with partition tables
>   diff --git a/src/utils/module.c b/src/utils/module.c
> -index 6557c3ab..69dd4731 100644
> +index 6557c3ab..5893f0ac 100644
>   --- a/src/utils/module.c
>   +++ b/src/utils/module.c
> -@@ -74,6 +74,13 @@ static void set_kmod_logging (struct kmod_ctx *ctx) {
> -     kmod_set_log_fn (ctx, utils_kmod_log_redirect, NULL);
> - }
> +@@ -28,6 +28,7 @@
> + #include "module.h"
> + #include "exec.h"
> + #include "logging.h"
> ++#include "utils.h"
> +
> + #define UNUSED __attribute__((unused))
> +
> +diff --git a/src/utils/utils.h b/src/utils/utils.h
> +index 801a8b6e..b2bdf0d0 100644
> +--- a/src/utils/utils.h
> ++++ b/src/utils/utils.h
> +@@ -9,6 +9,10 @@
> + #include "dbus.h"
> + #include "logging.h"
>    
>   +#if !defined(HAVE_STRERROR_L)
> -+static char *strerror_l(int errnum, locale_t locale UNUSED)
> -+{
> -+	return strerror(errnum);
> -+}
> ++#define strerror_l(errnum, locale)      strerror(errnum)
>   +#endif
>   +
>    /**
> -  * bd_utils_have_kernel_module:
> -  * @module_name: name of the kernel module to check
> -@@ -259,7 +266,6 @@ gboolean bd_utils_unload_kernel_module (const gchar *module_name, GError **error
> -     return TRUE;
> - }
> -
> --
> - static BDUtilsLinuxVersion detected_linux_ver;
> - static gboolean have_linux_ver = FALSE;
> -
> +  * SECTION: utils
> +  * @short_description: library providing utility functions used by the blockdev library and its plugins
>   --
>   2.34.1
>   
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index 527ba79e4e..e0449628b4 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBBLOCKDEV
>   	depends on BR2_ENABLE_LOCALE
>   	select BR2_PACKAGE_KMOD
>   	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   	help
>   	  libblockdev is a C library supporting GObject introspection
>   	  for manipulation of block devices. It has a plugin-based
> @@ -30,7 +32,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
>   config BR2_PACKAGE_LIBBLOCKDEV_FS
>   	bool "filesystem"
>   	depends on BR2_ENABLE_LOCALE # parted
> -	select BR2_PACKAGE_UTIL_LINUX
>   	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>   	select BR2_PACKAGE_PARTED
>   	select BR2_PACKAGE_E2FSPROGS
> @@ -62,7 +63,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
>   	bool "part"
>   	depends on BR2_ENABLE_LOCALE # parted
>   	select BR2_PACKAGE_PARTED
> -	select BR2_PACKAGE_UTIL_LINUX
>   	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
>   
>   comment "part plugin needs a toolchain w/ locale"
> @@ -70,7 +70,6 @@ comment "part plugin needs a toolchain w/ locale"
>   
>   config BR2_PACKAGE_LIBBLOCKDEV_SWAP
>   	bool "swap"
> -	select BR2_PACKAGE_UTIL_LINUX
>   	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>   
>   endif
> diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
> index 5f9a8a7e6c..79700a4996 100644
> --- a/package/libblockdev/libblockdev.hash
> +++ b/package/libblockdev/libblockdev.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  49841ff92db0ab032931e6f2b5eab63e5969b0ddc14b067b60e46a6eb6c60e47  libblockdev-3.0.4.tar.gz
> +sha256  41e4af66c9d78e795302d37825dfd88a4970f82da7b4ebe6487feba2afae44fb  libblockdev-3.1.0.tar.gz
>   sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index e0fca2b95c..ebf01acfb5 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBBLOCKDEV_VERSION = 3.0.4
> +LIBBLOCKDEV_VERSION = 3.1.0
>   LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
>   LIBBLOCKDEV_LICENSE = LGPL-2.1
>   LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
