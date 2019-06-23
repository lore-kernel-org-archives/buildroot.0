From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:00:37 +0200
Subject: [Buildroot] [PATCH 2/3] package/imagemagick: add prompt for
 host variant
In-Reply-To: <3833_1550582141_5C6C017D_3833_428_1_8b3762a4-694a-45cd-8cac-301fd3ba7526@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
References: <20190219131530.16364-1-yann.morin@orange.com>
 <3833_1550582141_5C6C017D_3833_428_1_8b3762a4-694a-45cd-8cac-301fd3ba7526@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
Message-ID: <20190623180037.1b7a3cc3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Feb 2019 14:15:29 +0100
<yann.morin@orange.com> wrote:

> diff --git a/linux/Config.in b/linux/Config.in
> index 323ba38d72..8466332dfe 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -2,6 +2,7 @@ menu "Kernel"
>  
>  config BR2_LINUX_KERNEL
>  	bool "Linux Kernel"
> +	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""

We don't really consistently select the option of host packages. For
example, pkgconf has a host option, and we clearly don't select from
all the packages that have a dependency on host-pkgconf.

But well, it doesn't hurt to do so, especially in this case where
there's only one location which selects host-imagemagick.

> +	bool "host-imagemagick"

We use "host foo" as the prompt for host packages and not "host-foo",
so I tweaked this.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
