From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 21 Apr 2016 16:58:08 +0200
Subject: [Buildroot] [RPi 3B] ttyAMA0 serial port device doesn't exist
	on raspberry pi 3B
In-Reply-To: <87ega1e3g5.fsf@dell.be.48ers.dk>
References: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
 <87ega1e3g5.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQbWTred7-+vv=mozXqws5Z5vLtu0MpC9kW1RYfCecT2nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Peter,

Only you have to add this line in the config.txt file:

device_tree=bcm2710-rpi-3-b.dtb
+dtoverlay=pi3-disable-bt

And copy the file pi3-disable-bt-overlay.dtb to /boot/overlays folder.

This disabled the Bluetooth module.

Best regards.

Oscar Gomez Fuente

On 19 April 2016 at 22:41, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi everyone,
>  > I'm using buildroot-2016.02 and I'm trying to make a rootfs for the
>  > raspberry pi 3B. I've just used the raspberrypi2_defconfig. And
> everything
>  > works fine except the serial port /dev/ttyAMA0.... I can see characters
> on
>  > the serial port but they are garbage characters...
>
>  > This is my config.txt, I'm using the bcm2710-rpi-3-b.dtb file:
>
> I believe ttyAMA0 is connected to the bluetooth module on rpi3 and you
> instead
> need to use ttyS0:
>
> https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=138120
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160421/ea887439/attachment.html>
