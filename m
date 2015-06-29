From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 29 Jun 2015 06:19:48 +0300
Subject: [Buildroot] [PATCH 03/11] package/rpi-firmware: add option to
 install vcdbg
In-Reply-To: <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
 <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <20150629031948.GS3250@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jun 29, 2015 at 12:25:12AM +0200, Yann E. MORIN wrote:
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> +	bool "vcdbg"
> +	depends on BR2_PACKAGE_RPI_USERLAND

There must be a good reason for doing 'depends' instead of 'select' here. Can 
you add a comment explaining that?

> +	help
> +	  Install vcdbg, to help debug communication with the GPU.
> +
> +comment "vcdbg needs rpi-userland"
> +	depends on !BR2_PACKAGE_RPI_USERLAND

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
