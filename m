From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2016 21:03:16 +0100
Subject: [Buildroot] [PATCH] libedit: fix build error with musl toolchain
References: <1452127277-9538-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <49kqmcxaun.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 06 Jan 2016 22:41:17 -0200 schrieb Sergio Prado:

> +# musl is ISO 10646 compliant but doesn't define __STDC_ISO_10646__,
> +# so let's define it manually +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +LIBEDIT_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS)
> -D__STDC_ISO_10646__=201103L" +endif +

Hi,

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

compile-tested using this defconfig:
http://autobuild.buildroot.net/toolchains/configs/br-arm-cortex-a9-musl.config

Regards, Bernd
