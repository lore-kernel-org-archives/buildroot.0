From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:38:12 +0100
Subject: [Buildroot] [RFC PATCH 2/3] Add package cbootimage
In-Reply-To: <1455203110-16759-3-git-send-email-julian@jusst.de>
References: <1455203110-16759-1-git-send-email-julian@jusst.de>
 <1455203110-16759-3-git-send-email-julian@jusst.de>
Message-ID: <20160302213812.36ab0fe9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian Scheel,

On Thu, 11 Feb 2016 10:05:09 -0500, Julian Scheel wrote:

> diff --git a/package/cbootimage/Config.in.host b/package/cbootimage/Config.in.host
> new file mode 100644
> index 0000000..4cdde38
> --- /dev/null
> +++ b/package/cbootimage/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_CBOOTIMAGE
> +	bool "host cbootimage"

Same thing: please add a "depends on BR2_arm || BR2_armeb" here.

> diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
> new file mode 100644
> index 0000000..3efef36
> --- /dev/null
> +++ b/package/cbootimage/cbootimage.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# cbootimage
> +#
> +################################################################################
> +
> +# Stick with git snapshot as latest release misses bugfixes for signing
> +CBOOTIMAGE_VERSION = e7d840c
> +CBOOTIMAGE_SITE = https://github.com/NVIDIA/cbootimage.git
> +CBOOTIMAGE_SITE_METHOD = git

Please use the github helper function.

> +CBOOTIMAGE_LICENSE = GPLv2

You can add CBOOTIMAGE_LICENSE_FILES = COPYING

Other than that, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
