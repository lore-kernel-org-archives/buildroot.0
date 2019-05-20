From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:59:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: add new package
In-Reply-To: <1557085947-25842-1-git-send-email-pjtexier@koncepto.io>
References: <1557085947-25842-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190520225940.5caa9424@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have applied your new package to next, after doing a few minor
changes, see below.

First, the canonical title for patches adding a new package is:

	package/libubootenv: new package

On Sun,  5 May 2019 21:52:27 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Libubootenv is a library that provides a hardware independent
> way to access to U-Boot environment.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/Config.in                                  |  1 +
>  ...w_printenv-remove-declaration-in-for-loop.patch | 53 ++++++++++++++++++++++
>  package/libubootenv/Config.in                      | 11 +++++
>  package/libubootenv/libubootenv.hash               |  2 +
>  package/libubootenv/libubootenv.mk                 | 14 ++++++
>  5 files changed, 81 insertions(+)

You forgot to update the DEVELOPERS file with this new package, so I've
done that.

> diff --git a/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
> new file mode 100644
> index 0000000..1ec908a
> --- /dev/null
> +++ b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
> @@ -0,0 +1,53 @@
> +From ffca94e6f84956838a2d88824b37fcd3b0d0694b Mon Sep 17 00:00:00 2001
> +From: Pierre-Jean Texier <pjtexier@koncepto.io>
> +Date: Sun, 5 May 2019 21:42:48 +0200
> +Subject: [PATCH] fw_printenv: remove declaration in for loop
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This commit fixes :
> +
> +src/fw_printenv.c:142:4: error: ?for? loop initial declarations are only allowed in C99 or C11 mode
> +    for (int i = 0; i < argc; i++) {
> +
> +Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> +[Upstream status: http://patchwork.ozlabs.org/patch/1092851/]

I've replaced this with the actual upstream commit, now that your patch
has been merged upstream.

> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> new file mode 100644
> index 0000000..79aaac7
> --- /dev/null
> +++ b/package/libubootenv/libubootenv.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 82c6966af5feae8726bd78a2cde4c4c2f69e81f8fdc548098063f8a35eaad090 libubootenv-8a7d4030bcb106de11632e85b6a0e7b7d4cb47af.tar.gz
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> new file mode 100644
> index 0000000..d74e823
> --- /dev/null
> +++ b/package/libubootenv/libubootenv.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libubootenv
> +#
> +################################################################################
> +
> +LIBUBOOTENV_VERSION = 8a7d4030bcb106de11632e85b6a0e7b7d4cb47af
> +LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
> +LIBUBOOTENV_LICENSE = LGPL-2.1

It would be nice to ask Stefano Babic if he could add a license file.

> +LIBUBOOTENV_INSTALL_STAGING = YES
> +
> +LIBUBOOTENV_DEPENDENCIES += zlib

= was sufficient, no need for += here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
