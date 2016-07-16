From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:50:59 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/ti-sgx-km: new package
In-Reply-To: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
References: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160716155059.3eeb6d5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 14:04:45 +0200, Lothar Felten wrote:

> +config BR2_PACKAGE_TI_SGX_KM
> +	bool "ti-sgx-km"
> +	depends on BR2_LINUX_KERNEL && BR2_arm

When there is a dependency on BR2_LINUX_KERNEL, we normally add a
Config.in comment about this, so I've added that.

> +	select BR2_LINUX_NEEDS_MODULES
> +	help
> +	  Kernel modules for TI CPUs with SGX GPU.
> +	  This package supports AM335x, AM437x, AM4430 and AM5430.
> +	  It builds the kernel module and the user space binaries.
> +	  For older CPUs or kernels use the ti-gfx package.

I tried building with a vanilla Linux kernel, and it failed due to some
missing SGX specific headers. A TI specific kernel is needed, so I've
extended the help text with this information.


> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
> +TI_SGX_KM_SITE = http://git.ti.com/graphics/omap5-sgx-ddk-linux.git

Fetching over http:// doesn't work, it seems like you didn't test this
properly (you still add the tarball in your BR2_DL_DIR cache). So I've
reverted back to fetching from git://.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
