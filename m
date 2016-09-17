From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:35:27 +0200
Subject: [Buildroot] [PATCH V2 2/2] xvisor: new package
In-Reply-To: <1473795934-27033-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1473795934-27033-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1473795934-27033-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917153527.417148df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 21:45:34 +0200, Eric Le Bihan wrote:
> This new package provides Xvisor, an open-source type-1 hypervisor,
> which aims at providing a monolithic, light-weight, portable, and
> flexible virtualization solution.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I've applied, after doing a few changes, see below.

> diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
> new file mode 100644
> index 0000000..0e7b995
> --- /dev/null
> +++ b/package/xvisor/xvisor.mk
> @@ -0,0 +1,72 @@
> +################################################################################
> +#
> +# xvisor
> +#
> +################################################################################
> +
> +XVISOR_VERSION = 0.2.8
> +XVISOR_SITE = http://www.xhypervisor.org/tarball
> +XVISOR_LICENSE = GPLv2

Licensing is GPLv2+, all files that I checked say "GPLv2 or later".


> +define XVISOR_CREATE_UBOOT_IMAGE
> +	$(HOST_DIR)/usr/bin/mkimage -A $(BR2_ARCH) -O linux -T kernel -C none \

I've used $(MKIMAGE) instead of $(HOST_DIR)/usr/bin/mkimage, and
$(MKIMAGE_ARCH) instead of $(BR2_ARCH).

Applied with those changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
