From: Ron Schmitt <rs2015@caa.columbia.edu>
Date: Thu, 9 Jul 2015 19:05:24 -0400
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
	Buildroot environment
Message-ID: <CAGiqocXLc13enqMF9dZhtMVx0Q=3dp4620aGKG3TrvQXvcuK-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I am embarking on my first embedded driver development project.
Could someone possibly give the explicit commands for how to do this, i..e.
how to add a package that builds Kernel Module (*.ko) to Buildroot
environmentLet's assume the following:
- I have installed buildroot at

/path/buildroot

- I have executed "make menuconfig" and set up my build.
- I have not yet run the build, i.e. I have not executed "make"
- I have copied your "*hello world" kernel module *c file to

/path/buildroot/mykmod.c

- I have copied your patch file to

/path/buildroot/kmod-example.patch


Thank you very much for your time and assistance.
Ron
[Buildroot] Adding package that builds Kernel Module (*.ko) to Buildroot
environment*Thomas Petazzoni* thomas.petazzoni at free-electrons.com
<buildroot%40busybox.net?Subject=Re%3A%20%5BBuildroot%5D%20Adding%20package%20that%20builds%20Kernel%20Module%20%28%2A.ko%29%20to%0A%20Buildroot%20environment&In-Reply-To=%3C20110804094557.4464b69b%40skate%3E>
*Thu Aug 4 07:45:57 UTC 2011*


   - Previous message: [Buildroot] Adding package that builds Kernel Module
   (*.ko) to Buildroot environment
   <http://lists.busybox.net/pipermail/buildroot/2011-August/044805.html>
   - Next message: [Buildroot] Adding package that builds Kernel Module
   (*.ko) to Buildroot environment
   <http://lists.busybox.net/pipermail/buildroot/2011-August/044808.html>
   - *Messages sorted by:* [ date ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/date.html#44807>
    [ thread ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/thread.html#44807>
    [ subject ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/subject.html#44807>
    [ author ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/author.html#44807>

------------------------------

Hello,

Le Thu, 04 Aug 2011 08:30:21 +0200,
Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com
<http://lists.busybox.net/mailman/listinfo/buildroot>> a ?crit :

>* I would like to add additional package to Buildroot that will build
*>* Linux kernel driver.
*>* For that I need:
*>* - dependency: build of this package mustn't be started before kernel
*>* source is available
*>* - kernel source directory: currently, the best I know is:
*>* $(BASE_DIR)/build/linux-$(BR2_LINUX_KERNEL_VERSION)
*> >* I started with package approach but bumped to stated dependency
*>* problem. Next what I tried is to edit linux/linux.mk
<http://linux.mk> to include my
*>* driver source download, extract. build and install but not so
*>* familiar with Buildroot scripting...
*> >* Did somebody already done something similar? What is best approach?
*>* Examples are welcomed...
*
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
development, consulting, training and support.http://free-electrons.com
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

------------------------------


   - Previous message: [Buildroot] Adding package that builds Kernel Module
   (*.ko) to Buildroot environment
   <http://lists.busybox.net/pipermail/buildroot/2011-August/044805.html>
   - Next message: [Buildroot] Adding package that builds Kernel Module
   (*.ko) to Buildroot environment
   <http://lists.busybox.net/pipermail/buildroot/2011-August/044808.html>
   - *Messages sorted by:* [ date ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/date.html#44807>
    [ thread ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/thread.html#44807>
    [ subject ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/subject.html#44807>
    [ author ]
   <http://lists.busybox.net/pipermail/buildroot/2011-August/author.html#44807>

------------------------------
More information about the buildroot mailing list
<http://lists.busybox.net/mailman/listinfo/buildroot>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150709/8d7ea288/attachment-0001.html>
