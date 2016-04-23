From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Sat, 23 Apr 2016 10:56:33 +0200
Subject: [Buildroot] [RPi 3B] ttyAMA0 serial port device doesn't exist
	on raspberry pi 3B
In-Reply-To: <87ziskracn.fsf@dell.be.48ers.dk>
References: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
 <87ega1e3g5.fsf@dell.be.48ers.dk>
 <CALtfCQbWTred7-+vv=mozXqws5Z5vLtu0MpC9kW1RYfCecT2nA@mail.gmail.com>
 <87ziskracn.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQYJTFuGWF1vSD7A3YvzH7TCWYq4+bpCc-3C0s7MHe-j+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes,

You are right. But with this overlay pi3-disable-bt-overlay.dtb, you only
disabled the BT module, because WiFi is over SDIO (I've found out the
solution to work properly the WiFi on buildroot, the next Monday I'll
report on the mailing list of buildroot). Right know I'm trying to check
everything on the RPi 3B, so the most important for me is the UART for
debugging. I don't understand why raspberry.org have left the RPi 3B
without a serial port for debugging (If you are using the BT module), I
suppose they have a good reason, but I don't know what. In my opinion, the
serial port for debugging is the most important thing on an embedded board.

Best regards.

Oscar Gomez Fuente.

On 23 April 2016 at 10:35, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Thank you Peter,
>  > Only you have to add this line in the config.txt file:
>
>  > device_tree=bcm2710-rpi-3-b.dtb
>  > +dtoverlay=pi3-disable-bt
>
>  > And copy the file pi3-disable-bt-overlay.dtb to /boot/overlays folder.
>
>  > This disabled the Bluetooth module.
>
> Ok, thanks - But longer term I guess we want to support bluetooth/wifi
> on the rpi3.
>
> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160423/027c18f9/attachment.html>
