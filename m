From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 4 Aug 2011 10:40:20 +0200
Subject: [Buildroot] Adding package that builds Kernel Module (*.ko) to
 Buildroot environment
In-Reply-To: <20110804094557.4464b69b@skate>
References: <4E3A3C7D.8030801@rt-rk.com>
	<20110804094557.4464b69b@skate>
Message-ID: <CAAXf6LV1OHUhn3h2YcacqrkV9uABg1PumTYjr+KkqQ3BTBheGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 4, 2011 at 9:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Thu, 04 Aug 2011 08:30:21 +0200,
> Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com> a ?crit :
>
>> I would like to add additional package to Buildroot that will build
>> Linux kernel driver.
>> For that I need:
>> - dependency: build of this package mustn't be started before kernel
>> source is available
>> - kernel source directory: currently, the best I know is:
>> $(BASE_DIR)/build/linux-$(BR2_LINUX_KERNEL_VERSION)
>>
>> I started with package approach but bumped to stated dependency
>> problem. Next what I tried is to edit linux/linux.mk to include my
>> driver source download, extract. build and install but not so
>> familiar with Buildroot scripting...
>>
>> Did somebody already done something similar? What is best approach?
>> Examples are welcomed...
>
> Attached, you will find :
>
> ?* mykmod-1.0.tar.bz2, the source code of an hello world like kernel
> ? module ;
>
> ?* kmod-example.patch, which adds support for compiling this kernel
> ? module into the Buildroot package infrastructure

Given the fact that we had similar questions before, I think it is
worth adding this example (mainly the package .mk file) to the
buildroot documentation, don't you think?
Moreover, the linux-fusion package could apparently be simplified by
using LINUX_MAKE_FLAGS as in your example.

Best regards,
Thomas
