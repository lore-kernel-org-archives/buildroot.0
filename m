From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 13 Mar 2017 20:35:52 +0100
Subject: [Buildroot] [5/8] package/rpi-firmware: bump version
In-Reply-To: <CAFGQKxdCuk3pb0bKYCSfusGe=PMcYz=3FfzDZfR59qoWemZY8g@mail.gmail.com>
References: <1488729976-7116-5-git-send-email-martin@barkynet.com>
 <f12fff71-bfbe-87cf-077a-52e2019dcc0e@je-eigen-domein.nl>
 <87mvct9sl9.fsf@dell.be.48ers.dk>
 <aad8e9df-86d4-cd00-4f77-da10624193b5@je-eigen-domein.nl>
 <CAFGQKxdCuk3pb0bKYCSfusGe=PMcYz=3FfzDZfR59qoWemZY8g@mail.gmail.com>
Message-ID: <5912a623-2999-77ab-30e3-0ee34e8313a7@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2017 06:26 PM, Martin Bark wrote:
> Floris Bos,
>
> On 10 March 2017 at 20:05, Floris Bos <bos@je-eigen-domein.nl 
> <mailto:bos@je-eigen-domein.nl>> wrote:
>
>     On 03/10/2017 02:20 PM, Peter Korsgaard wrote:
>
>           > On 03/05/2017 05:06 PM, Martin Bark wrote:
>           >> -RPI_FIRMWARE_VERSION =
>         7f8ac8dac0b80291cbf5e56580139034a0a42070
>           >> +RPI_FIRMWARE_VERSION =
>         78c4983379de0537f49a97fb37ceaaf42632b28c
>
>           > New firmware version does not get along with projects that
>         still use
>           > 4.4.x kernel.
>           > It seems that projects that still use 4.4.x are now
>         supposed to use
>           > the firmware branch called "stable"
>
>           > Perhaps we should introduce a config option for firmware
>         version, like
>           > we have for kernel version?
>
>         Gaah :/ Have you brought this up with rpi upstream? What is their
>         feedback?
>
>
>     Ok, turns out the new firmware can still boot 4.4.x, as long as
>     you compile the device tree files from kernel source.
>     The bundled binary ones only work for 4.9.
>
>
>     Should have known that, as I had already been burned by that before...
>
>     BTW is it possible to let buildroot compile dt overlays nowadays?
>     As the overlays are now also starting to show changes between
>     versions.
>
>
> You can build individual overlays by adding them 
> to BR2_LINUX_KERNEL_INTREE_DTS_NAME.  For example adding 
> overlays/gpio-poweroff-overlay to BR2_LINUX_KERNEL_INTREE_DTS_NAME 
> will build gpio-poweroff-overlay.dtb into the output/images directory.

The firmware would expect that file to be called 
"overlays/gpio-poweroff.dtbo" though.
So would require a post-installation script to fix up the file names. 
Not the most ideal solution.


Yours sincerely,

Floris Bos

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170313/f738f596/attachment.html>
