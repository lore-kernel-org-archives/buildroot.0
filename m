From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 23:06:07 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <20160417205607.5861459.29884.3259@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
 <20160417213544.2960f7cf@free-electrons.com>
 <20160417205607.5861459.29884.3259@rehivetech.com>
Message-ID: <20160417230607.75d32331@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 22:56:07 +0200, Jan Viktorin wrote:

> Well, your config is for ARMv7 so no kmods are built because all
> current drivers require PCI which is hardly to see on this platform
> (I know just about Armada).

Indeed mvebu_v7 is for Marvell Armada. Is DPDK only for PCI NICs? Can't
it be used for the internal NICs of certain ARM SoCs ?

> Ok. I don't know what would be the use case for dropping dependency
> on the kernel. Building just the rootfs without the kernel?

For example, yes. Another benefit of not having the mandatory kernel
dependency is that the autobuilders would be able to test the DPDK
package.

> That means to check whether the kernel is enabled. And if it is then
> to enable building of the DPDK kernel modules. Right?

Correct.

> This can be done but I am afraid I have to disable certain modules by
> name from the current configuration. This is not very generic
> (consider adding a new out-of-tree kernel module or removing an
> obsolete one from the DPDK, custom DPDK tree with third party
> modules) but there are only few of them so it might be a working
> solution. I will check if there is a more generic way but I don't
> think so.

I'm not sure what you mean here. If the default configuration on a
given architecture builds kernel modules, then on this architecture,
DPDK should depend on the kernel to be built. If the default
configuration on another architecture does not build kernel modules,
then there is no need to depend on the kernel.

That being said, if only ARM does not build any kernel module, maybe we
can simply do as you do right now, and depend on the kernel
unconditionally, to keep things simple.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
