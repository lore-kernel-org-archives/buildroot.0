From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Sat, 25 Feb 2012 14:00:13 +0100
Subject: [Buildroot] [U-Boot] Craneboard with Uboot and xloader
In-Reply-To: <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
References: <CABMxt4ic6cZ_xfrtkouKkw2OWSbOiL95tXrz9XgKyqUAd4U-6A@mail.gmail.com>
 <20120224150232.GA2346@bill-the-cat>
 <CABMxt4hMc3CjnjFEQNTjzsfxyXgBoyO8uMg1xsmaTeZ2pWXRRQ@mail.gmail.com>
 <CA+M6bXk7yKi8VFQRbYT-SQZMwM9eneBzjx2NB9KpHeicxkDb9Q@mail.gmail.com>
 <CABMxt4ja3EmjER5ywn5R+OLxkXy-Ho-cZ89LLuML4qX50ews=w@mail.gmail.com>
 <CA+M6bX=A1Mie8Q093Sa3bp_hSxSRFR6z4-sNBvJP3982e_HPqQ@mail.gmail.com>
Message-ID: <CABMxt4gYMf_JjfYi_2YttUL2NDNYC4974Kq_--++B2yPgf0xUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi M Tom,
I checked the file am3517_crane.h and it well use "rescan" instead of "init"
 but the problem is that after compilation, when I check the bootcmd I find
another one with init and not with rescan !
When i tried to change the variable with the setenv command, the system boot
 correctly from the SD card.
Can you tell me how I can fix that and why the compilation or the MLO,
u-boot.img files not have the correct bootcmd ?
PS: I use a defconfig file for the kernel that I found on the Internet,
it's that the source of problem ?
Excuse me for my english and thank you.

On Sat, Feb 25, 2012 at 1:29 AM, Tom Rini <trini@ti.com> wrote:

> On Fri, Feb 24, 2012 at 5:01 PM, Mohamed HAMZAOUI <requinham@gmail.com>
> wrote:
> > I tried following your instruction and i have been found the file MLO and
> > u-boot.img in the build/uboot directory but when i use them with the
> > generated rootfs th craneboard boot from the nand and not from my SD
> > although it's configured to booting from SD card and i tested it whith a
> > openembedded distribution.
>
> It looks like the bootcmd for mmc needs to be updated to call 'mmc
> rescan' not 'mmc init'  Please look at include/configs/am3517_crane.h
> and google up n hoto submit a patch to U-Boot once you've tested
> things.  The am3517_evm.h file in that directory, along with
> omap3_beagle.h should help (look for 'mmc init' and 'mmc rescan'.
>
> --
> Tom
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120225/714bc2df/attachment.html>
