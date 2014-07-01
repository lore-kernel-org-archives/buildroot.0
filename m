From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 23:26:48 +0200
Subject: [Buildroot] [PATCH] libv4l: Bump version to 1.0.1
In-Reply-To: <1404076714-1174-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1404076714-1174-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140701232648.33bc4483@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sun, 29 Jun 2014 18:18:34 -0300, Ezequiel Garcia wrote:

> -config BR2_PACKAGE_LIBV4L_V4L2_CTL
> -	bool "v4l2-ctl"
> -	depends on BR2_INSTALL_LIBSTDCPP
> +config BR2_PACKAGE_LIBV4L_JPEG
> +	bool "JPEG support"

I think there needs to be a justification as to why we want a
sub-option to enable jpeg support, as opposed to have it directly
handled as an optional dependency in the .mk file by testing
BR2_PACKAGE_JPEG.

> -comment "libv4l needs a toolchain w/ largefile, threads"
> +comment "libv4l needs a toolchain w/ largefile, threads and C++"
>  	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_INSTALL_LIBSTDCPP

The main problem is here, you should use:

	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP

Otherwise, the comment will not get displayed in the proper situations.

Can you fix that up and resend?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
