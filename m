From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:39:14 +0100
Subject: [Buildroot] [PATCH v1 4/4] package/wireshark: add missing qt5
 dependencies
In-Reply-To: <20200310081902.3488-4-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
 <20200310081902.3488-4-ps.report@gmx.net>
Message-ID: <20200315233914.0f52a989@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 09:19:02 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> -comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
> +comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_arc

Same problem as for pinentry in how the arch dependency is taken into
account.

Fixed to:

comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
        depends on !BR2_arc
        depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
                !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

And applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
