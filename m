From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2011 09:45:57 +0200
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
 Buildroot environment
In-Reply-To: <4E3A3C7D.8030801@rt-rk.com>
References: <4E3A3C7D.8030801@rt-rk.com>
Message-ID: <20110804094557.4464b69b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 04 Aug 2011 08:30:21 +0200,
Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com> a ?crit :

> I would like to add additional package to Buildroot that will build 
> Linux kernel driver.
> For that I need:
> - dependency: build of this package mustn't be started before kernel 
> source is available
> - kernel source directory: currently, the best I know is: 
> $(BASE_DIR)/build/linux-$(BR2_LINUX_KERNEL_VERSION)
> 
> I started with package approach but bumped to stated dependency
> problem. Next what I tried is to edit linux/linux.mk to include my
> driver source download, extract. build and install but not so
> familiar with Buildroot scripting...
> 
> Did somebody already done something similar? What is best approach? 
> Examples are welcomed...

Attached, you will find :

 * mykmod-1.0.tar.bz2, the source code of an hello world like kernel
   module ;

 * kmod-example.patch, which adds support for compiling this kernel
   module into the Buildroot package infrastructure

Do not hesitate to get back to the mailing list if you have any issues
getting this to work or need additional details.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mykmod-1.0.tar.bz2
Type: application/x-bzip
Size: 370 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110804/3a02ba98/attachment.bz>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kmod-example.patch
Type: text/x-patch
Size: 1372 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110804/3a02ba98/attachment.bin>
