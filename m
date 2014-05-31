From: William Welch <bvwelch@gmail.com>
Date: Sat, 31 May 2014 17:12:45 -0500
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <20140531234315.3cc32e4e@free-electrons.com>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
 <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
 <20140531234315.3cc32e4e@free-electrons.com>
Message-ID: <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

Recall this is for 2014.05-rc3.  I just ran through the process again.

All I did was make simple selection choices in menuconfig.

I did not manually enter any specifics about where/how to download the
toolchain.

When I asked for an external toolchain, Musl was the only external
toolchain listed.


The resulting 'savedefconfig' looked like this (note: there is no mention
of musl...)

BR2_microblazeel=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_TARGET_OPTIMIZATION="-pipe -mno-xl-soft-mul -mxl-barrel-shift
-mcpu=v8.20.a"
BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_PATCH="board/plus/reader3/linux.patch"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/plus/reader3/rdr3k_defconfig"
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/plus/reader3/rdr3.dts"
BR2_PACKAGE_MTD=y
BR2_TARGET_ROOTFS_INITRAMFS=y

I noticed in the log this toolchain was downloaded:

https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/crossx86-microblaze-linux-musl-1.0.0.tar.xz

thank you,

William



On Sat, May 31, 2014 at 4:43 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear William Welch,
>
> On Sat, 31 May 2014 15:56:01 -0500, William Welch wrote:
>
> > What I know is, that the resulting images built by musl toolchain did not
> > work, and readelf says the images are big-endian.
> >
> > I selected microblaze little endian target and then chose 3 different
> > toolchains and made 3 separate builds.  -- musl, buildroot internal, and
> > the old Xilinx. Musl was the only one that did not run.
>
> You did use the musl external toolchain, right?
>
> > QEMU is nice but does not necessarily prove that a toolchain will work on
> > my spartan6 microblazeel design, which I have been using with builroot,
> > successfully, for some time now.
>
> Absolutely. Do not hesitate to report back to us any issue that you
> might see on Microblaze. We're definitely interested in growing the
> user base of Buildroot users on this architecture.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140531/e87dda4a/attachment.html>
