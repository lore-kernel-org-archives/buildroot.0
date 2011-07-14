From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 16:29:23 +0200
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
	versions
In-Reply-To: <87ipr5cg14.fsf@macbook.be.48ers.dk>
References: <20110711214654.9E4738A482@busybox.osuosl.org>
 <1310632596.2068.3.camel@sven>  <87ipr5cg14.fsf@macbook.be.48ers.dk>
Message-ID: <1310653763.10990.1.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-07-14 at 12:28 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  Sven> I've updated to latest git today and ran into this error:
> 
>  Sven> linux/linux.mk:26: *** Recursive variable `LINUX_SITE' references itself
>  Sven> (eventually).  Stop.
> 
> Interesting, I haven't seen that here. What make version are you using?

GNU Make 3.81

> I just built qemu_arm_versatile_defconfig with make 3.81 without any
> problems. Could you post your config, please?

Here's the kernel part, in the hope that this is sufficient:

# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_2_6_39 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0-rc7"
BR2_LINUX_KERNEL_VERSION="3.0-rc7"
BR2_LINUX_KERNEL_PATCH="raumfeld/kernel-arm.patch"
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="raumfeld/kernel-arm.config"
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
BR2_LINUX_KERNEL_INSTALL_TARGET=y


Sven
