From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:11:50 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/ti-sgx-demos: new package
In-Reply-To: <1468497888-6464-3-git-send-email-lothar.felten@gmail.com>
References: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
 <1468497888-6464-3-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160724161150.44c72a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 14:04:47 +0200, Lothar Felten wrote:

> diff --git a/package/ti-sgx-demos/Config.in b/package/ti-sgx-demos/Config.in
> new file mode 100644
> index 0000000..52c58e5
> --- /dev/null
> +++ b/package/ti-sgx-demos/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_TI_SGX_DEMOS
> +	bool "ti-sgx-demos"
> +	select BR2_PACKAGE_TI_SGX_KM
> +	select BR2_PACKAGE_TI_SGX_UM

I've replaced that with:

	depends on BR2_PACKAGE_TI_SGX_UM

otherwise with a "select" you would have to replicate all the depends
on from ti-sgx-um and ti-sgx-km. Also, it's pretty obvious that the
demos for SGX will be only available if SGX is enabled.


> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
> +TI_SGX_DEMOS_SITE = http://git.ti.com/graphics/img-pvr-sdk.git

Moved back to git://, which actually works.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
