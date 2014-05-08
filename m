From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 May 2014 20:56:27 +0200
Subject: [Buildroot] [PATCH v2] protobuf: fix build for some unsupported
 architectures
In-Reply-To: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
References: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
Message-ID: <20140508205627.3b6c61d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu,  8 May 2014 15:28:11 +0300, Baruch Siach wrote:

> @@ -2,6 +2,8 @@ config BR2_PACKAGE_PROTOBUF
>  	bool "protobuf"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
> +	    BR2_mipsel || BR2_powerpc

Unless there's a good reason to not support it, maybe we could keep
BR2_armeb here in the list of supported architectures?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
