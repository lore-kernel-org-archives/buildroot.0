From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Mon, 13 Feb 2012 15:41:12 +0100
Subject: [Buildroot] pandaboard MLO/u-boot not working
In-Reply-To: <CAPEB33znr0s2Zka5xjmDfVT4iJTn0rFYCySoj_sWF9n3=_8Uow@mail.gmail.com>
References: <CAPEB33znr0s2Zka5xjmDfVT4iJTn0rFYCySoj_sWF9n3=_8Uow@mail.gmail.com>
Message-ID: <CALB96Nna+HV5ZvqsqpNa5-vew_eaNdK1=SRTU4YEGWU2wVZg7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 13, 2012 at 3:01 PM, MERCADIER Johann <
johann.mercadier@imerir.com> wrote:

>    using buildroot I create a 1st basic rootfs, toolchain, bootloader
> using ucLibc.
>    All of this targeted to a Pandaboard Rev A4.
>    Everything works fine and generate all things needed.
>    Trouble are when booting the card with it.  Trying some other
> MLO/u-boot.bin bootloader help me going a bit further and then stuck once
> again.
>    Could someone help me?  by giving me some clue like where to look
> after, or some methods to fix such a problem?
>

i had found a bug in OMAP4 SPL in latest u-boot, that was fixed with this:

http://git.denx.de/?p=u-boot.git;a=commit;h=f59021791b5a09b22c886aa6c1115cd49b730d6c

it was just merged very recently, so make sure you have this patch when
rebuilding your bootloaders.

if you use uboot 2011.12 then it should be fine, this is what I had been
using in the past.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120213/e67d52b7/attachment.html>
