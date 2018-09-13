From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 17:34:47 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
In-Reply-To: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <20180913173447.7edae0a2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Einar,

On Thu,  5 Jul 2018 08:57:53 +0200, Einar Jon Gunnarsson wrote:
> ti-sgx-libgbm is a required package for ti-sgx-um in SDK 4.00
> 
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>

I tested this package, and it didn't build because it depends on libdrm
and udev, and those dependencies are not taken into account.

> diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
> new file mode 100644
> index 0000000..07536d9
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +	bool "ti-sgx-libgbm"
> +	depends on BR2_PACKAGE_TI_SGX_KM

Is there a reason for having this dependency ? It does not require
having the kernel or the kernel modules built in order to build
ti-sgx-libgbm.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
