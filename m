From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Nov 2018 14:29:05 -0600
Subject: [Buildroot] glibc link fails on x86_64 with fPIC error
In-Reply-To: <A800D6A5-EA42-4289-9ADB-B7ABAF44BB3F@gmail.com>
References: <1541520575003-0.post@n4.nabble.com>
 <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
 <A800D6A5-EA42-4289-9ADB-B7ABAF44BB3F@gmail.com>
Message-ID: <CANQCQpZsw2w=ok==PzbUk=eC3P=vbtjX25xe22vDtoBg83XWog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Tue, Nov 6, 2018 at 10:48 AM Mike Shapiro <mike.w.shapiro@gmail.com> wrote:
>
>
> $ cat defconfig
> BR2_x86_64=y
> BR2_x86_core_avx2=y
> BR2_JLEVEL=1
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_KERNEL_HEADERS_4_9=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_PCIUTILS=y
> BR2_PACKAGE_LIBXML2=y
> BR2_PACKAGE_ELFUTILS=y
> BR2_PACKAGE_LIBCAP=y
> BR2_PACKAGE_BASH=y
>

I was able to checkout 2018.08.2, use your defconfig but with
BR2_JLEVEL set to 0 and the build was successful.  I had the following
host machine:
gcc version 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.4)

Matt
