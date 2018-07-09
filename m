From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 09 Jul 2018 19:53:51 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <f2kc1fxkra.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 05 Jul 2018 08:57:53 +0200 schrieb Einar Jon Gunnarsson:

> --- /dev/null
> +++ b/package/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +	bool "ti-sgx-libgbm"
> +	depends on BR2_PACKAGE_TI_SGX_KM
> +	select BR2_PACKAGE_WAYLAND
> +	help
> +	  This package provides libgbm.so.2 for the
> +	  TI SGX implementation
> +
> +	  https://git.ti.com/glsdk/libgbm

a similar patch was posted two years ago:
http://lists.busybox.net/pipermail/buildroot/2016-July/167443.html

Back then Thomas wrote:
"Is this libgbm a TI-specific implementation of the libgm available in
 Mesa ? If that's the case, then it's going to be complicated to
 package, as we would have two implementations of the same API."

Working on the next bump of Kodi to v18 I needed to build mesa3d with 
libgbm only, no x11, no wayland. To do so I created a virtual package for 
libgbm which could be used by your package as well to solve the problem 
Thomas noted:

https://github.com/bkuhls/buildroot/commit/
af585ebdd2627980eda0581f99aa844c7292d4de

https://github.com/bkuhls/buildroot/
commit/92a0e96c32aac50a7e28eb0941463c21b119a727

The whole code is still WIP and closely bound to my Kodi repo but you 
should get the idea ;)

Regards, Bernd
