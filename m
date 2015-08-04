From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 4 Aug 2015 14:12:12 +0000
Subject: [Buildroot] [PATCH] board: add support for ARC AXS101 and
 AXS103 Software Development Platforms
In-Reply-To: <20150804155525.58062d6e@free-electrons.com>
References: <1438689614-31408-1-git-send-email-abrodkin@synopsys.com>
 <20150804145738.44ad2bd3@free-electrons.com>
 <1438694226.22313.12.camel@synopsys.com>
 <20150804152428.0c0d4de7@free-electrons.com>
 <1438695423.22313.22.camel@synopsys.com>
 <20150804155525.58062d6e@free-electrons.com>
Message-ID: <1438697532.22313.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-08-04 at 15:55 +0200, Thomas Petazzoni wrote:
> Alexey,
> 
> On Tue, 4 Aug 2015 13:37:04 +0000, Alexey Brodkin wrote:
> 
> > Hw, I do understand your concern with implicitly specified version of
> > kernel/headers but what I meant if I use "make savedefconfig" it eliminates
> > versions if they match today's defaults.
> 
> Not if you explicitly specify "custom version", i.e if you do:
> 
> 	Kernel Headers (Manually specified Linux version)  ---> 
> 	(4.1) linux version
> 
> Then you get:
> 
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="4.1"
> 
> which is what we want.
> 
> 
> > So now if I understood you correctly you propose to insert:
> > --------->8---------
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
> 
> Yes for kernel version.
> 
> > BR2_DEFAULT_KERNEL_HEADERS="4.1.3"
> 
> But no for kernel headers: see above what you should do.
> 
> Again, please look at qemu_*_defconfig, they do the right thing:
> 
> # Lock to 4.1 headers to avoid breaking with newer kernels
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="4.1"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> 
> # Kernel
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
> BR2_LINUX_KERNEL_DEFCONFIG="vexpress"

Ok I understood and already modified my defconfigs so they look
similar to qemu ones. Lesson learned.

Re-spin is on its way.

Thanks,
Alexey
