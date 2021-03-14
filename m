From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 22:36:16 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/zeromq: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210305161211.4396-4-giulio.benetti@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-4-giulio.benetti@benettiengineering.com>
Message-ID: <20210314223616.5bfcc62f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Mar 2021 17:12:11 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>  config BR2_PACKAGE_ZEROMQ
>  	bool "zeromq"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464

This is not sufficient: there are numerous packages that "select
BR2_PACKAGE_ZEROMQ", so this "depends on" would have to be propagated.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
