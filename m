From: chris warth <cswarth@gmail.com>
Date: Wed, 15 Feb 2017 15:58:46 -0800
Subject: [Buildroot] uImage support for aarch64
In-Reply-To: <20170214191756.s6huaepb46ocxni5@tarshish>
References: <CAJJmP9D0JFq8Wjbp2MX+mXdca6Up+3z0XJ1Xs3ojc8UcU2p11Q@mail.gmail.com>
 <20170214191756.s6huaepb46ocxni5@tarshish>
Message-ID: <CAJJmP9DDR4B6miuUmJZC-ApNxbmwTUvUXUQFVBX11wYA99E36w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the explanation of why uImage is deprecated for aarch64.

Does buildroot have support for building any compressed linux image
format for aarch64?

It seems surprising, but the only available image format listed in
linux/Config.in for aarch64 is BR2_LINUX_KERNEL_IMAGE.  uImage is not
available and neither is zImage.  Am I missing some trick to creating
compressed images?

Thanks in advance,

- Chris

On Tue, Feb 14, 2017 at 11:17 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Cris,
>>
> uImage is deprecated on ARM 32bit as well. U-Boot added support for native
> zImage a few years back.
>
> The problem with uImage is that kernel load address is hard codes in the
> uImage header. This prevents multi-platform compatibility, since RAM physical
> location and size varies on different platforms. zImage is much more flexible
> in this regard.
>
> As for BR2_LINUX_KERNEL_APPENDED_UIMAGE, this is only useful when the
> bootloader is too old to support device tree. Being a relatively new
> architecture, and DT based from the start, I'm pretty sure there is no such
> bootloader for ARM64. Besides, ARM64 does not support the appended DTB trick
> to begin with.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
