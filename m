From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:01:37 +0200
Subject: [Buildroot] [PATCH 2/2] host-dtc: Install libftd and associated
 header files.
In-Reply-To: <20160725195227.21112-2-draeman@bbn.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160725195227.21112-2-draeman@bbn.com>
Message-ID: <20160725220137.663c9c03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 15:52:27 -0400, David Raeman wrote:
> The dtc package currently does not install libfdt for the host install.
> It can be useful to have libfdt on the host, such as for building QEMU
> with the --enable-fdt configure switch.
> 
> Signed-off-by: David Raeman <draeman@bbn.com>

We already have the support for --enable-fdt for the host qemu:

ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu
HOST_QEMU_OPTS += --enable-system --enable-fdt
HOST_QEMU_DEPENDENCIES += host-dtc
else
HOST_QEMU_OPTS += --disable-system
endif

Do you mean that it doesn't work?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
