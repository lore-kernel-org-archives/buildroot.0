From: Jeff Horn <jeff@everlook.net>
Date: Thu, 5 Jun 2014 09:41:48 -0700
Subject: [Buildroot] Error building imx-lib for the i.MX6
In-Reply-To: <CAM7q1L=M=Xzw3SMASE8H0q1ueEBO+ZZHtqO+P=+Z6xPz0YV7dw@mail.gmail.com>
References: <CAM7q1L=M=Xzw3SMASE8H0q1ueEBO+ZZHtqO+P=+Z6xPz0YV7dw@mail.gmail.com>
Message-ID: <CAM7q1LkG=E1p6iHLrGHhQpuNvYGu9ggFWkdnhPZqWLc0eN=04A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The issue appears to be with the 3.10 kernel. I rolled back to my 3.0.35
kernel and the build is successful. In the 3.10 kernel there is an
include/uapi directory that contains header files. I just pulled the 3.10
kernel from FSL so I am not familiar with the new structure. I'll look at
modifying the include paths for imx-lib to see if I can get it to compile
with the newer kernel.

Sorry I missed this.

Jeff


On Thu, Jun 5, 2014 at 9:02 AM, Jeff Horn <jeff@everlook.net> wrote:

> Hi all,
>
> First off I am new to buildroot. We have a custom MX6 board and using
> buildroot  (2014.05) I was able to build a basic image with our kernel
> (3.10.17) and u-boot. So, that is nice.
>
> I added imx-lib and the FSL codec packages and imx-lib fails to build.
>
> /home/reach/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
> -DIMX6Q
> -I/home/reach/projects/buildroot/output/build/linux-7fd46d723cb3e4cd6fe5a512fbb4b365bf87f312/drivers/mxc/security/rng/include
> -I/home/reach/projects/buildroot/output/build/linux-7fd46d723cb3e4cd6fe5a512fbb4b365bf87f312/drivers/mxc/security/sahara2/include
> -idirafter
> /home/reach/projects/buildroot/output/build/linux-7fd46d723cb3e4cd6fe5a512fbb4b365bf87f312/include
> -Wall -O2 -fPIC -c mxc_ipu_hl_lib_dummy.c -o mxc_ipu_hl_lib_dummy.o
> In file included from mxc_ipu_hl_lib.h:104:0,
>                  from mxc_ipu_hl_lib_dummy.c:41:
> /home/reach/projects/buildroot/output/build/linux-7fd46d723cb3e4cd6fe5a512fbb4b365bf87f312/include/linux/mxcfb.h:26:28:
> error: array type has incomplete element type
>  extern struct fb_videomode mxcfb_modedb[];
>                             ^
> make[2]: *** [mxc_ipu_hl_lib_dummy.o] Error 1
>
> Has anyone else encountered this issue?
>
> I am using the Sourcery toolchain - gcc version 4.8.1 (Sourcery CodeBench
> Lite 2013.11-33)
>
> Any advice is much appreciated.
>
> Thanks,
> Jeff
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/1033c1f2/attachment.html>
